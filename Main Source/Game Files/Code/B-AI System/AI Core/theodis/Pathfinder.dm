turf
	//more weight is more to traverse, things like sand and rubble get higher than grass.
	var/pathweight = 1
	proc
		AdjacentTurfs()
			var/L[] = new()
			for(var/turf/t in oview(src,1))
				if(!t.density)
					var/dFound
					for(var/atom/o in t.contents)
						if(o.density)
							dFound=TRUE
							break
					if(!dFound)
						L.Add(t)
			return L
		Distance(turf/t)
			if(get_dist(src,t) == 1)
				var/cost = (src.x - t.x) * (src.x - t.x) + (src.y - t.y) * (src.y - t.y)
				//Multiply the cost by the average of the pathweights of the
				//tile being entered and tile being left
				cost *= (pathweight+t.pathweight)/2
				return cost
			else
				return get_dist(src,t)

var/const/P_DIJKSTRA_NOT_FOUND = 0
var/const/P_DIJKSTRA_FINISHED = 1
var/const/P_DIJKSTRA_ADD_PATH = 2
var/const/P_INCLUDE_INTERIOR = 1
var/const/P_INCLUDE_FINISHED = 2

PathNode
	var
		datum/source
		PathNode/prevNode
		f
		g
		h
		nt		// Nodes traversed
	New(s,p,pg,ph,pnt)
		source = s
		prevNode = p
		g = pg
		h = ph
		f = g + h
		source.bestF = f
		nt = pnt

datum
	var
		bestF

proc
	PathWeightCompare(PathNode/a, PathNode/b)
		return a.f - b.f

	AStar(start,end,adjacent,dist,maxnodes,maxnodedepth,mintargetdist,minnodedist)
		var/PriorityQueue/open = new /PriorityQueue(/proc/PathWeightCompare)
		var/closed[] = new()
		var/path[]

		open.Enqueue(new /PathNode(start,null,0,call(start,dist)(end)))

		while(!open.IsEmpty() && !path)
		{
			var/PathNode/cur = open.Dequeue()
			closed.Add(cur.source)

			var/closeenough
			if(mintargetdist)
				closeenough = call(cur.source,dist)(end) <= mintargetdist

			if(cur.source == end || closeenough) //Found the path
				path = new()
				path.Add(cur.source)
				while(cur.prevNode)
					cur = cur.prevNode
					path.Add(cur.source)
				break

			var/L[] = call(cur.source,adjacent)()
			if(minnodedist && maxnodedepth)
				if(call(cur.source,minnodedist)(end) + cur.nt >= maxnodedepth)
					continue
			else if(maxnodedepth)
				if(cur.nt >= maxnodedepth)
					continue

			for(var/datum/d in L)
				//Get the accumulated weight up to this point
				var/ng = cur.g + call(cur.source,dist)(d)
				if(d.bestF)
					if(ng + call(d,dist)(end) < d.bestF)
						for(var/i = 1; i <= open.L.len; i++)
							var/PathNode/n = open.L[i]
							if(n.source == d)
								open.Remove(i)
								break
					else
						continue

				open.Enqueue(new /PathNode(d,cur,ng,call(d,dist)(end),cur.nt+1))
				if(maxnodes && open.L.len > maxnodes)
					open.L.Cut(open.L.len)
		}

		var/PathNode/temp
		while(!open.IsEmpty())
			temp = open.Dequeue()
			temp.source.bestF = 0
		while(closed.len)
			temp = closed[closed.len]
			temp.bestF = 0
			closed.Cut(closed.len)

		if(path)
			for(var/i = 1; i <= path.len/2; i++)
				path.Swap(i,path.len-i+1)

		return path

	Dijkstra(start,adjacent,dist,finished,maxnodedepth,compatibility=1)
		var/PriorityQueue/open = new /PriorityQueue(/proc/PathWeightCompare)
		var/closed[] = new()
		var/ret[] = new()
		var/path[]

		open.Enqueue(new /PathNode(start,null,0,0))

		while(!open.IsEmpty())
		{
			var/PathNode/cur = open.Dequeue()
			var/isDone
			closed.Add(cur.source)

			isDone = call(finished)(cur.source, cur.g)
			if(isDone)
				var/PathNode/tmpNode = cur
				path = new()
				path.Add(tmpNode.source)
				while(tmpNode.prevNode)
					tmpNode = tmpNode.prevNode
					path.Add(tmpNode.source)
				ret[++ret.len] = path
			if(isDone == P_DIJKSTRA_FINISHED)
				break

			var/L[] = call(cur.source,adjacent)()

			if(maxnodedepth && cur.nt >= maxnodedepth)
				continue

			for(var/datum/d in L)
				//Get the accumulated weight up to this point
				var/ng = cur.g + call(cur.source,dist)(d)

				if(d.bestF)
					if(ng < d.bestF)
						for(var/i = 1; i <= open.L.len; i++)
							var/PathNode/n = open.L[i]
							if(n.source == d)
								open.Remove(i)
								break
					else
						continue
				open.Enqueue(new /PathNode(d,cur,ng,0,cur.nt+1))
		}

		var/PathNode/temp
		while(!open.IsEmpty())
			temp = open.Dequeue()
			temp.source.bestF = 0
		while(closed.len)
			temp = closed[closed.len]
			temp.bestF = 0
			closed.Cut(closed.len)

		for(var/list/L in ret)
			for(var/i = 1; i <= L.len/2; i++)
				L.Swap(i,L.len-i+1)

		if(ret.len < 1)
			return null
		else if(ret.len == 1 && compatibility)
			return ret[1]
		return ret

	DijkstraTurfInRange(start,adjacent,dist,finished, include = P_INCLUDE_INTERIOR | P_INCLUDE_FINISHED,maxnodedepth)
		var/PriorityQueue/open = new /PriorityQueue(/proc/PathWeightCompare)
		var/closed[] = new()
		var/path[] = new()
		var/finishedL[] = new()

		open.Enqueue(new /PathNode(start,null,0,0))

		while(!open.IsEmpty())
		{
			var/PathNode/cur = open.Dequeue()
			closed.Add(cur.source)

			//Get the accumulated weight up to this point
			if(call(finished)(cur.source,cur.g)) //Found an end point
				finishedL += cur.source
				continue

			var/L[] = call(cur.source,adjacent)()

			if(maxnodedepth && cur.nt >= maxnodedepth)
				continue

			for(var/datum/d in L)
				var/ng = cur.g + call(cur.source,dist)(d)
				if(d.bestF)
					if(ng < d.bestF)
						for(var/i = 1; i <= open.L.len; i++)
							var/PathNode/n = open.L[i]
							if(n.source == d)
								open.Remove(i)
								break
					else
						continue
				open.Enqueue(new /PathNode(d,cur,ng,0,cur.nt+1))
		}

		var/PathNode/temp
		while(!open.IsEmpty())
			temp = open.Dequeue()
			temp.source.bestF = 0
		while(closed.len)
			temp = closed[closed.len]
			temp.bestF = 0
			path+=temp
			closed.Cut(closed.len)
		switch(include)
			if(P_INCLUDE_INTERIOR)
				return path
			if(P_INCLUDE_FINISHED)
				return finishedL
			if(P_INCLUDE_INTERIOR | P_INCLUDE_FINISHED)
				return path + finishedL
		return null