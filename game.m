function res = game(m, n, i, j, Map, b)
%constants
def = 0; %defector
coops = 1; %cooperator

%return the score of cell interaction
    res = -1;
    if Map(m, n) == coops
        if Map(i, j) == def
            res = 0; %recive suckers payoff
        else
            res =1; %recive reward
        end
    end
    if Map(m, n) == def
        if Map(i, j) == def
            res = 0; %recive  punishment
        else
            res = b; %recive temptation
        end
    end
end
