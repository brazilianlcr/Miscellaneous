function [Cost] = LCOE(I_t, M_t, F_t, E_t, r)
% Function calculates the Levelized Cost Of Electricity for a nuclear power
% plant.
%   I_t [array] = Investment expenditures in year t (including financing)
%   in $/Kwy
%   M_t [array] = Operations and maintenance expenditures in year t
%   in $/Kwy
%   F_t [array] = Fuel expenditures in year t
%   in $/Kwy
%   E_t [array] = Electricity generation in year t
%   in $/Kwy
%   r [scalar] = discount rate (interest rate)
%   in y^-1
%   Cost = output of the function in $/KWh

    if length(I_t)==length(M_t) && length(M_t)==length(F_t) && length(F_t)==length(E_t)
    cashin_t = [];
    cashout_t = [];
        for t = 1:length(I_t)
        cashin_t = [cashin_t (I_t(t) + M_t(t) + F_t(t))/((1+r)^t)]; % discounted cash influx in year t
        cashout_t = [cashout_t E_t(t)/((1+r)^t)]; % discounted cash outflux in year t
        
        end
    cashin = sum(cashin_t);
    cashout = sum(cashout_t);
    Cost = cashin/cashout;
    Cost = Cost/(365*24); %Transforms the quantity $/KWyr into $/KWh
    else
    error('Make sure all the cash arrays have the same length. Add zeroes to the beginning of the revenue stream corresponding to construction years')
    end
end


