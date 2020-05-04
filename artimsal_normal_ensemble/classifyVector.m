function [leaf, label] = classifyVector(tree, vector)
    if(vector(tree.feature) <= tree.split)
        if(~isempty(tree.left))
            [leaf, label] = classifyVector(tree.left, vector);
        else
            [~, label] = max(tree.dist);
            leaf = tree;
        end
    else
        if(~isempty(tree.right))
            [leaf, label] = classifyVector(tree.right, vector);
        else
            [~, label] = max(tree.dist);
            leaf = tree;
        end
    end
end

