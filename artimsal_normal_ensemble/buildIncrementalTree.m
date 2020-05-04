function tree=buildIncrementalTree(veri, sinif)
%a�aca ba�lang��ta 2 farkl� s�n�ftan �rnek vermemiz gerekiyor
%datay� buna g�re modifiye edicez
%base learner�n e�itim setinin ilk �rne�i ile s�n�f� ayn� olmayan bir
%�rnek ba�lang�� verileri olacak
i=2;
while sinif(1,1)==sinif(i,1)
    i=i+1;
end
gccveri=veri(2,:);
gccsinif=sinif(2,1);
veri(2,:)=veri(i,:);
sinif(2,1)=sinif(i,1);
veri(i,:)=gccveri;
sinif(i,1)=gccsinif;

ilkdata=[veri(1,:) sinif(1,:);veri(2,:) sinif(2,:)];
tree = buildDecisionTree(ilkdata, 1);

for i=3:length(sinif)
[leaf, label] = classifyVector(tree, veri(i,:));
yeniorn=[veri(i,:) sinif(i,:)];
tree.data=[tree.data;yeniorn];
leaf.data=[leaf.data;yeniorn];
if label~=sinif(i,1)
   newLeaf=updateLeaf(leaf);
   tree=changeNode(tree, newLeaf);
end
end