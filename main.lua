if not isfolder or not makefolder or not isfile or not writefile then return end if not isfolder("impact") then makefolder("impact") end if not isfolder("impact/profiles") then makefolder("impact/profiles") end do local format = string.format local success, err = pcall(function() loadstring(game:HttpGetAsync(format("https://raw.githubusercontent.com/Toon-arch/ImpactClientForRoblox/main/customprofiles/%s.lua", tostring(game.PlaceId))))() end) if not success then loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Toon-arch/ImpactClientForRoblox/main/customprofiles/MainScript.lua"))() end end
