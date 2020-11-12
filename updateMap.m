function newMap = updateMap(oldMap, oldRes, mapSize)
    newMap = zeros(mapSize, mapSize);
    for m = 1:mapSize
        for n = 1:mapSize
            newMap(m, n) = emulateCell(m, n, oldMap, oldRes, mapSize);
        end
    end
end
