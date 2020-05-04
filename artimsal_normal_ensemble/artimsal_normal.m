function hatatotal=artimsal_normal(edata,tdata,x,y)
%%deneme
% clear all;
% [x,y]=arffoku('C:\Users\Melike Nur Mermer\Desktop\36uci\36uci\vote.arff');
% [ornek,ozellik]=size(x);
% sinifsay=max(y);
% [eorn,torn]=crossval(ornek,2);
% edata=eorn{1,1};
% tdata=torn{1,1};
%%
ensmsay=2;
[ornek,ozellik]=size(x);
sinifsay=max(y);
eornsay=length(edata);
tornsay=length(tdata);
training_x=zeros(eornsay,ozellik);
training_y=zeros(eornsay,1);
testing_x=zeros(tornsay,ozellik);
testing_y=zeros(tornsay,1);
%eðitim ve test setlerinin oluþturulmasý
    for i=1:eornsay
        training_x(i,:)=x(edata(i),:);
        training_y(i,1)=y(edata(i),1);   
    end
    for i=1:tornsay
        testing_x(i,:)=x(tdata(i),:);
        testing_y(i,1)=y(tdata(i),1);      
    end
%eðitim setinin hangi indisteki elemanlarýnýn alýnacaðýný belirleyen matris
bagger=randi(eornsay,ensmsay,eornsay);
%temel öðrenicilerin kullanacaðý eðitim setlerinin giriþleri
%çýkýþlarý ayrý matrislerde tutuluyor
to_x=zeros(eornsay,ozellik,ensmsay);
to_y=zeros(eornsay,1,ensmsay);    
        for i=1:ensmsay
        for j=1:eornsay
        to_x(j,:,i)=training_x(bagger(i,j),:);
        to_y(j,1,i)=training_y(bagger(i,j),1);
        end
        end
%aðaçlarý tutan "dtrees" cell array
dtrees1 = cell(1,ensmsay);
dtrees2 = cell(1,ensmsay);
for i=1:ensmsay
tree1 = buildIncrementalTree(to_x(:,:,i), to_y(:,:,i));
dtrees1{i} = tree1;
data=[to_x(:,:,i) to_y(:,:,i)];
tree2 = buildDecisionTree(data,1);
dtrees2{i} = tree2;
end
%aðaçlarýn tahminleri
to_tahmin1=zeros(tornsay,1,ensmsay);
to_tahmin2=zeros(tornsay,1,ensmsay);
for i=1:ensmsay
    for j=1:tornsay
        tree1=dtrees1{i};
        [a,to_tahmin1(j,1,i)]=classifyVector(tree1,testing_x(j,:));
        tree2=dtrees2{i};
        [b,to_tahmin2(j,1,i)]=classifyVector(tree2,testing_x(j,:));
    end
end
%kararlarýn demokrasi ile birleþtirilmesi
dogrutahmin1=0;
artimsaltahmin=zeros(tornsay,1);
dogrutahmin2=0;
normaltahmin=zeros(tornsay,1);
for i=1:tornsay
    tahminsay1=zeros(1,sinifsay);
    tahminsay2=zeros(1,sinifsay);
    for j=1:ensmsay
        tahminsay1(1,to_tahmin1(i,1,j))=tahminsay1(1,to_tahmin1(i,1,j))+1;
        tahminsay2(1,to_tahmin2(i,1,j))=tahminsay2(1,to_tahmin2(i,1,j))+1;
    end
    [encok,artimsaltahmin(i,1)]=max(tahminsay1);
    [encok2,normaltahmin(i,1)]=max(tahminsay2);
    %ortak verilen kararýn doðruluðu
    if artimsaltahmin(i,1)==testing_y(i,1)
        dogrutahmin1=dogrutahmin1+1;
    end
    if normaltahmin(i,1)==testing_y(i,1)
        dogrutahmin2=dogrutahmin2+1;
    end
end
hata1=1-(dogrutahmin1/tornsay);
hata2=1-(dogrutahmin2/tornsay);
hatatotal=[hata1 hata2];