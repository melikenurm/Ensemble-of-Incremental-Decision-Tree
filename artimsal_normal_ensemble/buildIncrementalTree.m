function tree=buildIncrementalTree(veri, sinif)
%aðaca baþlangýçta 2 farklý sýnýftan örnek vermemiz gerekiyor
%datayý buna göre modifiye edicez
%base learnerýn eðitim setinin ilk örneði ile sýnýfý ayný olmayan bir
%örnek baþlangýç verileri olacak
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