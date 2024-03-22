Benches = {}

RegisterNetEvent('pure-crafting:refreshBenches', function(benches)
    local src = source
    removeZones()
    deleteAllBenches()
    Benches = benches
    setupBenches(src)
end)

function setupBenches(source)
    for i = 1, #Benches do 
        local bench = Benches[i]
        local location, rotation = json.decode(bench.location), json.decode(bench.rotation)
        local tableForTarget = {
            options = {
                {
                    type = 'client',
                    action = function()
                        print('client')
                    end,
                    icon = 'fas fa-wrench',
                    label = 'Use Bench',
                    canInteract = function()
                        return true
                    end
                }
            },
            distance = Config.targetingOptions.distance,
            location = location,
        }

        if Config.targetingOptions.interaction == 'target' then 
            --  TODO: setup target
        end

        setupBenchZone(location, rotation, vector3(3, 3, 4))

        local benchObj = createBench(location, rotation)
        bench.obj = benchObj
    end
end

RegisterNetEvent('pure-crafting:insertBench', function(newBench)
    insertBench(newBench)
end)

function insertBench(newBench)
    local location, rotation = newBench.location, newBench.rotation
    local tableForTarget = {
        options = {
            {
                type = 'client',
                action = function()
                    print('client')
                end,
                icon = 'fas fa-wrench',
                label = 'Use Bench',
                canInteract = function()
                    return true
                end
            }
        },
        distance = Config.targetingOptions.distance,
        location = location,
    }

    if Config.targetingOptions.interaction == 'target' then 
        --  TODO: setup target
    end

    setupBenchZone(location, rotation, vector3(3, 3, 4))

    local benchObj = createBench(location, rotation)
    newBench.obj = benchObj
    Benches[#Benches + 1] = newBench
end