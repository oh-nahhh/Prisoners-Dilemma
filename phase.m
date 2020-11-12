%for phase plot testing
clear; close all; clc;

def = 0;
coops = 1;

mapSize = 200;
gen = 200;

Map = randi([def coops], mapSize, mapSize);
%b = 1.1:0.00001:2.0;

b = 1.1:0.1:2.0;
y = zeros(size(b));

%run simulation for several values of b and plot phase transition diagram.
for i = 1:length(b)
    temptation = b(i);
    [dens] = Prisoners_dilemma( Map, gen, temptation);
    y(i) = dens(end);
   % disp(['Final cooperator density: ' num2str(dens(end))])
end

plot(b, y, '*')
xlabel('b')
ylabel('Density of Cooperators')
