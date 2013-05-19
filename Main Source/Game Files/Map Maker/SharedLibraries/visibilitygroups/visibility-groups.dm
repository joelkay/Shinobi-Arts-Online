
var
	// vis_all is the list of atoms that are represented
	// by images due to being in a visibility group.
	list/vis_all = list()

	// vis_players is the list of all mobs with clients that
	// have vis objects - these are the mobs whose image lists
	// must be updated when an atom's visibility changes (even
	// if the client-owning mob isn't in any groups).
	list/vis_players = list()

Visibility
	var
		// you shouldn't ever need to access these vars directly
		image/image
		atom/owner
		list/views = list()
		list/groups = list()

		original_icon

	New(atom/a)
		owner = a

		// check if the object is a mob with a client,
		// if it is we add the image so the mob can see itself.
		if(ismob(a))
			var/mob/m = a

			if(m.client)
				vis_players += m
				m.client.images += image

	proc
		// adds all arguments to the groups list
		is_a()
			var/changed = 0

			for(var/group_name in args)
				if(group_name in groups)
					continue

				groups += group_name
				changed = 1

			if(changed)
				if(groups.len)
					vis_all += owner

				update()

			return changed

		// removes all arguments from the groups list
		is_not_a()
			var/changed = 0

			for(var/group_name in args)
				if(group_name in groups)
					groups -= group_name
					changed = 1

			if(changed)
				if(!groups.len)
					vis_all -= owner

				update()

			return changed

		// adds all arguments to the views list
		can_see()
			var/changed = 0

			for(var/group_name in args)
				if(group_name in views)
					continue

				views += group_name
				changed = 1

			if(changed)
				refresh()

			return changed

		// removes all arguments from the views list
		cant_see()
			var/changed = 0

			for(var/group_name in args)
				if(group_name in views)
					views -= group_name
					changed = 1

			if(changed)
				refresh()

			return changed

		// this is called when the views list changes.
		// it checks each mob with a visibility object
		// and checks to see if your ability to see it
		// has changed.
		refresh()
			if(!ismob(owner))
				return

			var/mob/m = owner
			if(!m.client)
				return

			for(var/atom/a in vis_all)
				if(m.can_see(a))
					m.client.images += a.vis.image
				else
					m.client.images -= a.vis.image

		// this is called when the groups list changes, it
		// checks each client to see if the image for the
		// changed object needs to be shown or hidden
		update()

			// if you're in at least one visibility group
			if(groups.len)

				// and you don't have an image object representation,
				// create the image that represents the object
				if(!image)
					image = image(owner.icon, owner, owner.icon_state, owner.layer)
					original_icon = owner.icon
					owner.icon = null

			// if you're not in any visibility groups and you do have
			// an image object, remove it.
			else
				if(image)
					owner.icon = original_icon
					del image

			if(image)
				for(var/mob/m in vis_players)
					if(m.can_see(owner))
						m.client.images += image
					else
						m.client.images -= image

atom
	var
		Visibility/vis

mob
	proc
		can_see(atom/a)

			// you can always see yourself
			if(a == src) return 1

			// both objects need to have vis objects
			if(!vis) return 1
			if(!a.vis) return 1

			// if the atom is in a single group that src can see,
			// then src can see the atom
			for(var/group_name in vis.views)
				if(group_name in a.vis.groups)
					return 1

			// otherwise src can't see it
			return 0
