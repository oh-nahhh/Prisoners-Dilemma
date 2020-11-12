function totalScore = getScore(m, n, mapSize, b, Map)
%return the score from playing the game with its neighbors
    s = 0;
    for i = -1:1
        for j = -1:1
            if m+i <= mapSize && m+i >= 1 && n+j <= mapSize && n+j >= 1 %look at neighbors
                s = s + game(m, n, m+i, n+j, Map, b); %calculate score
            end
        end
    end
   totalScore = s;
end
