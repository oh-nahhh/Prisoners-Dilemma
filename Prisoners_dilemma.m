function [densOfCoops] = Prisoners_dilemma( Map, gen, b)

    colScheme  =[0,0,1;1,1,0;0,1,0;1,0,0];  % Color scheme for map
    mapSize = size(Map, 1); %get the length of the square map.
    densOfCoops(1) = sum(sum(Map))./(mapSize*mapSize); %initialize the density of cooperators

    %constants
    def = 0; %Defector
    coops = 1; %Cooperator
    DtoC = 2; %Defector to Cooperator
    CtoD = 3; %Cooperator to Defector

    %update the score of a cell
    res = updateMapRes(mapSize, Map, b);
    popCount = zeros(gen, 2); %Saves the poulation distribution.

    %Initialize color scheme and visualize.
    colormap(colScheme);
    image(Map+1);
    drawnow

    for k = 1:gen
        nbrOfCoops = sum(Map(:) == coops); % get the nbr of cooperators
        %initialize the population count
        popCount(k, 1) = nbrOfCoops; %save the number of cooperators in the population
        popCount(k, 2) = (mapSize*mapSize) - nbrOfCoops; %save the number of defectors in the population

        oldMap = Map;

        %update for next generation
        Map = updateMap(Map, res, mapSize);
        res = updateMapRes(mapSize, Map, b); %update score


        %sum the difference from the previous generation
        diff= Map - oldMap;
        diffMap = Map;

        for m = 1:mapSize
            for n = 1:mapSize
                if diff(m, n) == def - coops
                    diffMap(m, n) = CtoD;  %Cooperator to Defector
                end
                if diff(m, n) == coops - def
                    diffMap(m, n) = DtoC; %Defector to Cooperator
                end
            end
        end
        %visualize
        colorWorld = diffMap;
        colormap(colScheme);
        image(colorWorld+1);
        drawnow

        xlabel(strcat('Generation: ', num2str(k), ', b = ', num2str(b)));


        %sum the density of cooperators, vector will be returned
        densOfCoops(k+1) = 1 - sum(sum(Map))/(mapSize*mapSize);

    end

    %plot population
    figure;
    plot(1:gen, popCount(:,1), 1:gen, popCount(:,2),'LineWidth', 2);
    xlabel('Generation');
    ylabel('Population');
    legend('Cooperators', 'Defectors');

end
