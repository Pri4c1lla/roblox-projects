xpcall(function()
    -- metamethods hooking
    oldnamecall = hookmetamethod(game, "__namecall", function(obj, ...)
        local method = getnamecallmethod()

        if not checkcaller() then
            if table.find(preventObjs, obj) and table.find(namecallmethods2, method) then
                local content = oldnamecall(obj, ...)

                for i,v in pairs(protected_objs) do
                    local index = table.find(content, v)
                    if index then
                        content[index] = nil
                    end
                end

                gcinfo()

                return content
            elseif table.find(namecallmethods, getnamecallmethod()) and table.find(preventObjs, obj) and table.find(protected_objs, oldnamecall(obj, ...)) then
                -- return nil if the object returned from the function is a protected object
                return nil
            end
        end

        return oldnamecall(obj, ...)
    end)

	-- functions hooking
	for i,v in pairs(arraymethods) do
		local old

		old = hookfunction(v, function(obj, ...)
			if not checkcaller() and table.find(preventObjs, obj) then
				-- get the table with the instances
				local content = old(obj, ...)
		
				for i,v in pairs(protected_objs) do
					local index = table.find(content, v)
					if index then
						-- remove the protected object from the table
						content[index] = nil
					end
				end
		
				-- update the table's index
				gcinfo()
		
				-- return the edited table
				return content
			end

			return old(obj, ...)
		end)
	end

	for i,v in pairs(findmethods) do
		local old

		old = hookfunction(i, function(obj, ...)
			if table.find(preventObjs, obj) and table.find(protected_objs, old(obj, ...)) then
				-- return nil if the object returned from the function is a protected object
				return nil
			end

			return old(obj, ...)
		end)
	end
end, function()
	return print("Skip (Missing hookfunction or hookmetamethod)")
end)