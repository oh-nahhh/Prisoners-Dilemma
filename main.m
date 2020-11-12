%Main function for testing
clear; close all; clc;

def = 0; %0 defines defector
coops = 1; % 1 defines a cooperator

%grid size.
mapSize = 200;
generations = 200;

%randomize 50-50 grid
Map = randi([def coops], mapSize, mapSize);

b = 1.7; %temptation parameter

temptation = b;

%run simulation
Prisoners_dilemma( Map, generations, temptation);
