proc/loaddatamodule4()
	usr.contents+=newlist(/buildable/TREES/bigtree1,/buildable/TREES/bigtree2,/buildable/TREES/deadtree)
	usr.contents+=newlist(/buildable/TREES/medtree,/buildable/TREES/pine,/buildable/TREES/pine2)
	usr.contents+=newlist(/buildable/TREES/smalltree1,/buildable/TREES/smalltree2)





buildable
	TREES

		bigtree1
			icon = 'big tree1.png'
			build = /buildable/TREES/bigtree1

		bigtree2
			icon = 'big tree2.png'
			build = /buildable/TREES/bigtree2

		deadtree
			icon = 'dead tree.png'
			build = /buildable/TREES/deadtree

		medtree
			icon = 'med tree.png'
			build = /buildable/TREES/medtree

		pine
			icon = 'pine.png'
			build = /buildable/TREES/pine

		pine2
			icon = 'pine2.png'
			build = /buildable/TREES/pine2

		smalltree1
			icon = 'small tree1.png'
			build = /buildable/TREES/smalltree1

		smalltree2
			icon = 'small tree2.png'
			build = /buildable/TREES/smalltree2