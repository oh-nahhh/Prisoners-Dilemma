function newRes = updateMapRes(mapSize, Map, b)
     newRes = zeros(mapSize, mapSize);
     for m = 1:mapSize
         for n = 1:mapSize
             newRes(m, n) = getScore(m, n, mapSize, b, Map); %update score
         end
     end
 end
