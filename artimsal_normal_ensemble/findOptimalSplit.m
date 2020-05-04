function [feature, split] = findOptimalSplit(data)
    n = size(data, 1);
    [ornek,ozellik]=size(data);
    ozellik=ozellik-1;
    
    cost = inf();
    feature = -1;
    split = -1;
    for f=1:ozellik
        for i=1:n
            c = computeCostGini(data, f, i);
            %ginisi en düþük olan özellik düðüme atanacak
            if(c < cost)
                cost = c;
                feature = f;
                split = data(i, f);
            end
        end
    end
end

function [cost] = computeCostGini(data, f, i)
    n = size(data, 1);
    split = data(i, f);
    
    %ginisol=lesser,equal=leq, ginisað=greater=gre
    leq = data(data(:, f) <= split, :);
    gre = data(data(:, f) > split, :);
    %özelliðin toplam ginisi hesaplanýr 
    cost = (size(leq, 1) / n) * computeGini(computeDistributionLabels(leq)) + (size(gre, 1) / n) * computeGini(computeDistributionLabels(gre));
end


