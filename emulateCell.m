function copyCell = emulateCell(m, n, oldMap, oldRes, mapSize)
     res= 0;
     copyCell = oldMap(m, n);
     for i = -1:1
         for j = -1:1
             if m+i <= mapSize && m+i >= 1 && n+j <= mapSize && n+j >= 1 %look at neighbors
                 s = oldRes(m+i, n+j);
                 r = oldMap(m+i, n+j);
                 %find cell with highest score
                 if res < s
                     res = s;
                     copyCell = r; %emulate cell with highest score
                 end
             end
         end
     end
 end
