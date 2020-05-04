function [tree] = buildDecisionTree(data, n)
%buildDecisionTree Summary of this function goes here
%   Detailed explanation goes here
    
    tree = Node();
    tree.number=n;
    tree.dist = computeDistributionLabels(data);
       
    tree.gini = computeGini(tree.dist);
    tree.data = data;
    
    if(tree.gini == 0)
        return;
    end
    
    [feature, split] = findOptimalSplit(data);
    
    tree.feature = feature;
    tree.split = split;
    
    tree.left = buildDecisionTree(data(data(:, feature) <= split, :),2*n);
    tree.left.parent=tree;
    tree.right = buildDecisionTree(data(data(:, feature) > split, :),2*n+1);
    tree.right.parent=tree;
end

