function [gini] = computeGini(dist)
    gini = 1;
    n = sum(dist);
    for i=1:size(dist, 2)
        gini = gini - (dist(i) / n)^2;
    end
end
