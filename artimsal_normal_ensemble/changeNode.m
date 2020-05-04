function newtree=changeNode(tree, leaf)
%yeni düðümü aðaçtaki yerine yerleþtiriyoruz
   if ~isempty(tree.left) && tree.left.number==leaf.number
      tree.left.data=[tree.left.data;leaf.data];
      tree.left=leaf;
   else if ~isempty(tree.right) && tree.right.number==leaf.number
      tree.right.data=[tree.right.data;leaf.data];
      tree.right=leaf;
   else
       if ~isempty(tree.left) 
        newT=changeNode(tree.left, leaf);
        tree.left=newT;
       end
       if ~isempty(tree.right)
        newT2=changeNode(tree.right, leaf);
        tree.right=newT2;
       end       
       end  
   end
     newtree=tree;