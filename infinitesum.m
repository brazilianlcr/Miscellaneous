function value = infinitesum(start, finish) %% finish this bs later
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

S = [];
for i = [start:1:finish]
    S = [S (1/(0.968^i))];
end

value = sum(S)               
        
end

