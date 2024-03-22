function deleteAllBenches()
    for i = 1, #Benches do 
        local benchObj = Benches[i].obj
        if not benchObj or not DoesEntityExist(benchObj) then goto continue end
        DeleteEntity(benchObj)
        Benches[i].obj = nil
        ::continue::
    end
end

function deleteBench(id)
    for i = 1, #Benches do 
        if Benches[i].id == id then 
            local benchObj = Benches[i].obj
            if not benchObj or not DoesEntityExist(benchObj) then return end
            DeleteEntity(benchObj)
            Benches[i].obj = nil
            break
        end
    end
end

function createBench(location, rotation)
    RequestModel(`prop_toolchest_05`)
    local object = CreateObject(`prop_toolchest_05`, location.x, location.y, location.z, false, false, false)
    SetEntityRotation(object, rotation.x, rotation.y, rotation.z, 1)
    PlaceObjectOnGroundProperly(object)
    -- Wait(150)
    FreezeEntityPosition(object, true)
    SetEntityCanBeDamaged(object, false)
    return object
end