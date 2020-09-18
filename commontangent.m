function [a, b] = commontangent(f, g, range)
% Function that calculates the common tangent given two free energy curves
% f and g
%   f and g are row vectors with the free energy values, range is the
%   composition range being considered(usually linspace(0, 1, n)). All three arrays
%   must have the same length

if f(end) < g(end)
    df = diff(f);
    df = [df df(end)];
    tg = @(x) f(x) - x*df(x) + df(x).*linspace(0, length(g));
    for i = length(f):-1:1
        tangent = tg(i);
        if sum(tangent < g) ~= size(g, 2)
            break
        end
    end
    a = df(i);
    b = f(i) - df(i)*f(i);
else
    dg = diff(g);
    dg = [dg dg(end)];
    tg = @(x) g(x) - x*dg(x) + dg(x).*linspace(0, length(f));
    for i = length(g):-1:1
        tangent = tg(i);
        plot(range, f, range, g, range, tangent);
        if sum(tangent < f) ~= size(f, 2)
            break
        end
    end
    a = dg(i);
    b = g(i) - dg(i)*g(i);
end
hold off
plot(range, f, range, g, range, tangent);
hold on
end

