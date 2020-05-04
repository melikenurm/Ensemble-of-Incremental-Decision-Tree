function leaf = updateLeaf(leaf)
%�rne�in s�n�fland�r�ld��� leaf yerine d���m olu�tur
            n=leaf.number;
            [feature, split] = findOptimalSplit(leaf.data); 
            leaf.feature = feature;
            leaf.split = split;
            
            leaf = buildDecisionTree(leaf.data,n);
            %leaf.left = buildDecisionTree(leaf.data(leaf.data(:, feature) <= split, :),2*n);
            %leaf.right = buildDecisionTree(leaf.data(leaf.data(:, feature) > split, :),2*n+1);           
end