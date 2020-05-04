clear all;
[x,y]=arffoku('C:\Users\Melike Nur Mermer\Desktop\36uci\36uci\zoo.arff');
[ornek,ozellik]=size(x);
sinifsay=max(y);
tekrarsayi=10;
cvfold=2;
hatatotal=zeros(cvfold*tekrarsayi,2);
i=1;
while i<=cvfold*tekrarsayi
[eorn,torn]=crossval(ornek,cvfold);
for j=1:cvfold
edata=eorn{1,j};
tdata=torn{1,j};
hatatotal(i,:)=artimsal_normal(edata,tdata,x,y);
i=i+1;
end
end
ortalamahata=[sum(hatatotal(:,1))/(cvfold*tekrarsayi) sum(hatatotal(:,2))/(cvfold*tekrarsayi)];
H=ttest2(hatatotal(:,1),hatatotal(:,2));

