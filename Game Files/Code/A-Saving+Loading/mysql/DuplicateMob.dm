
//Title: Object Duplication
//Credit to: Jtgibson
//Contributed by: Jtgibson


//This snippet will create and return an exact duplicate of
// a mob or an object.


datum/proc/duplicate()
    var/datum/duplicate = new type
    for(var/V in src.vars)
        if(issaved(vars[V]))
            if(istype(vars[V],/list))
                var/list/L = vars[V]
                duplicate.vars[V] = L.Copy()
            else
                duplicate.vars[V] = vars[V]
    return duplicate


atom/movable/duplicate()
    var/atom/movable/duplicate = new type(src.loc)

    var/list/parallel_inventory = list()
    for(var/atom/movable/X in src)
        parallel_inventory.len++
        var/atom/movable/duplicated_item = X.duplicate()
        duplicated_item.loc = duplicate
        X.loc = src
    for(var/V in src.vars-"contents")
        if(issaved(src.vars[V]))
            if(istype(vars[V],/list))
                var/list/L = vars[V]
                duplicate.vars[V] = L.Copy()
            else
                duplicate.vars[V] = src.vars[V]
            if(src.vars[V] in src.contents)
                duplicate.vars[V] = parallel_inventory[src.contents.Find(vars[V])]
    return duplicate


//This supplement will determine if an object is an exact duplicate.
// Use the 'requires' and 'filters' list to determine variables
// that must match or won't be checked, respectively.
//'Requires' will check only those variables.  'Filters' will check all
// variables BUT those.
//Note that it will not check vars marked as const, tmp, or static.


atom/proc/compare(atom/checkee, list/requires, list/filters)
    if(!checkee)
        CRASH("Given null comparison")
        return

    if(requires && requires.len) //check to see if it matches all required vars
        for(var/V in src.vars)
            if(issaved(src.vars[V]) && requires.Find(V) &&(filters && !filters.Find(V)))
                if(checkee.vars[V] != src.vars[V]) return 0

    else if(filters && filters.len) //check to see if it matches all unfiltered vars
        for(var/V in src.vars)
            if(issaved(src.vars[V]) && !filters.Find(V))
                if(checkee.vars[V] != src.vars[V]) return 0

    else
        for(var/V in src.vars) //check for exact match
            if(issaved(src.vars[V]))
                if(checkee.vars[V] != src.vars[V]) return 0

    return 1


/*
//Testing code/sample implementation:

mob/verb/copy(obj/O in oview())
  var/obj/new_obj = O.duplicate()
  new_obj.loc = usr.loc
  usr << "And then there were two!"

mob/verb/compare_exact_stats(mob/M in oview())
    if(!src.compare(M, requires=list("max_HP","max_MP","str")))
        usr << "You aren't exactly the same as [M] in regards to strength, HP, and MP."
    else
        usr << "You are exactly the same as [M] in regards to strength, HP, and MP!"
*/