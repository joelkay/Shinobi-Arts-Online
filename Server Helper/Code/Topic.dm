world/Topic(T,Addr)
	var/list/params = params2list(T)
	switch(params["action"])
		if("test")
			world<<"Reply received"
