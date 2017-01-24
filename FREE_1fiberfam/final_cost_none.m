function [fc, dfcdx, dfcdu] = final_cost_none(x, u, params)

    fc = 0;
    dfcdx = zeros(1, length(x));
    dfcdu = zeros(1, length(u));

end