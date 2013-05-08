mob
	proc
		scene5begin()
			if(sffi)return
			src.sffi=1

			if(!src.map3)
				src.sffi=0
				sleep(10)//load
				src.scene5begin()//till it readay
				return

			src.fade()
			src.client.eye=src
			src.loc=locate(src.map3.x1+1,src.map3.y1+8,src.map3.z1)//16,6,9//same place
			src.toggle()
			src.messagez(3)
			src.canmove=1

			//src.tutorial1()
			spawn(30)
				src.scenesdone()