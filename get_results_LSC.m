clear all
close all
clc
seg1 = single(imread('ForestStandMap.tif'));
chm = imread('CHM.tif');
chm2 = imresize(chm,[size(seg1,1) size(seg1,2)],'bilinear');

chm2(find(chm2<0))=0;
[features1 rr] = geotiffread('sentinel2_2018_0407.tif');
features2  = imread('sentinel2_2018_0507.tif');
features3 = imread('sentinel2_2018_0701.tif');
features4 = imread('sentinel2_2018_0803.tif');
features5 = imread('sentinel2_2018_0912.tif');
features6 = imread('sentinel2_2018_1101.tif');
features7 = imread('sentinel2_2019_0214.tif');
features8 = imread('sentinel2_2019_0226.tif');
seg1=imresize(single(seg1),[size(features2,1) size(features2,2)],'nearest');
chm2=imresize(chm2,[size(features2,1) size(features2,2)],'bilinear');

sinir = single(imread('ForestStandEdges.tif'));
sinir=imresize(single(sinir),[size(features2,1) size(features2,2)],'nearest');

features1= features1(1:300,1:300,:);
features2= features2(1:300,1:300,:);
features3= features3(1:300,1:300,:);
features4= features4(1:300,1:300,:);
features5= features5(1:300,1:300,:);
features6= features6(1:300,1:300,:);
features7= features7(1:300,1:300,:);
features8= features8(1:300,1:300,:);
seg1= seg1(1:300,1:300,:);
sinir = sinir(1:300,1:300);
chm2=chm2(1:300,1:300);




features1 = single(features1);
ndvi1 = (features1(:,:,8)-features1(:,:,4))./(features1(:,:,8)+features1(:,:,4)); %NDVI hesabÄ±
rgvi1 = (features1(:,:,4)-features1(:,:,3))./(features1(:,:,3)+features1(:,:,4)); %NDVI hesabÄ±
rendvia1 = (features1(:,:,5)-features1(:,:,4))./(features1(:,:,5)+features1(:,:,4));
rendvib1 = (features1(:,:,6)-features1(:,:,5))./(features1(:,:,6)+features1(:,:,5));
reci1= features1(:,:,7)./features1(:,:,5)-1;
vari1 = (features1(:,:,3)-features1(:,:,4))./(features1(:,:,3)+features1(:,:,4)-features1(:,:,2));
features1=cat(3,ndvi1,rgvi1,rendvia1,rendvib1,reci1,vari1,features1/10000);



features2 = single(features2);
ndvi2 = (features2(:,:,8)-features2(:,:,4))./(features2(:,:,8)+features2(:,:,4)); %NDVI hesabÄ±
rgvi2 = (features2(:,:,4)-features2(:,:,3))./(features2(:,:,3)+features2(:,:,4)); %NDVI hesabÄ±
rendvia2 = (features2(:,:,5)-features2(:,:,4))./(features2(:,:,5)+features2(:,:,4));
rendvib2 = (features2(:,:,6)-features2(:,:,5))./(features2(:,:,6)+features2(:,:,5));
reci2= features2(:,:,7)./features2(:,:,5)-1;
vari2 = (features2(:,:,3)-features2(:,:,4))./(features2(:,:,3)+features2(:,:,4)-features2(:,:,2));
features2=cat(3,ndvi2,rgvi2,rendvia2,rendvib2,reci2,vari2,features2/10000);


features3 = single(features3);
ndvi3 = (features3(:,:,8)-features3(:,:,4))./(features3(:,:,8)+features3(:,:,4)); %NDVI hesabÄ±
rgvi3 = (features3(:,:,4)-features3(:,:,3))./(features3(:,:,3)+features3(:,:,4)); %NDVI hesabÄ±
rendvia3 = (features3(:,:,5)-features3(:,:,4))./(features3(:,:,5)+features3(:,:,4));
rendvib3 = (features3(:,:,6)-features3(:,:,5))./(features3(:,:,6)+features3(:,:,5));
reci3= features3(:,:,7)./features3(:,:,5)-1;
vari3 = (features3(:,:,3)-features3(:,:,4))./(features3(:,:,3)+features3(:,:,4)-features3(:,:,2));
features3=cat(3,ndvi3,rgvi3,rendvia3,rendvib3,reci3,vari3,features3/10000);


features4 = single(features4);
ndvi4 = (features4(:,:,8)-features4(:,:,4))./(features4(:,:,8)+features4(:,:,4)); %NDVI hesabÄ±
rgvi4 = (features4(:,:,4)-features4(:,:,3))./(features4(:,:,3)+features4(:,:,4)); %NDVI hesabÄ±
rendvia4 = (features4(:,:,5)-features4(:,:,4))./(features4(:,:,5)+features4(:,:,4));
rendvib4 = (features4(:,:,6)-features4(:,:,5))./(features4(:,:,6)+features4(:,:,5));
reci4= features4(:,:,7)./features4(:,:,5)-1;
vari4 = (features4(:,:,3)-features4(:,:,4))./(features4(:,:,3)+features4(:,:,4)-features4(:,:,2));
features4=cat(3,ndvi4,rgvi4,rendvia4,rendvib4,reci4,vari4,features4/10000);


features5 = single(features5);
ndvi5 = (features5(:,:,8)-features5(:,:,4))./(features5(:,:,8)+features5(:,:,4)); %NDVI hesabÄ±
rgvi5 = (features5(:,:,4)-features5(:,:,3))./(features5(:,:,3)+features5(:,:,4)); %NDVI hesabÄ±
rendvia5 = (features5(:,:,5)-features5(:,:,4))./(features5(:,:,5)+features5(:,:,4));
rendvib5 = (features5(:,:,6)-features5(:,:,5))./(features5(:,:,6)+features5(:,:,5));
reci5= features5(:,:,7)./features5(:,:,5)-1;
vari5 = (features5(:,:,3)-features5(:,:,4))./(features5(:,:,3)+features5(:,:,4)-features5(:,:,2));
features5=cat(3,ndvi5,rgvi5,rendvia5,rendvib5,reci5,vari5,features5/10000);

features6 = single(features6);
ndvi6 = (features6(:,:,8)-features6(:,:,4))./(features6(:,:,8)+features6(:,:,4)); %NDVI hesabÄ±
rgvi6 = (features6(:,:,4)-features6(:,:,3))./(features6(:,:,3)+features6(:,:,4)); %NDVI hesabÄ±
rendvia6 = (features6(:,:,5)-features6(:,:,4))./(features6(:,:,5)+features6(:,:,4));
rendvib6 = (features6(:,:,6)-features6(:,:,5))./(features6(:,:,6)+features6(:,:,5));
reci6= features6(:,:,7)./features6(:,:,5)-1;
vari6 = (features6(:,:,3)-features6(:,:,4))./(features6(:,:,3)+features6(:,:,4)-features6(:,:,2));
features6=cat(3,ndvi6,rgvi6,rendvia6,rendvib6,reci6,vari6,features6/10000);

features7 = single(features7);
ndvi7 = (features7(:,:,8)-features7(:,:,4))./(features7(:,:,8)+features7(:,:,4)); %NDVI hesabÄ±
rgvi7 = (features7(:,:,4)-features7(:,:,3))./(features7(:,:,3)+features7(:,:,4)); %NDVI hesabÄ±
rendvia7 = (features7(:,:,5)-features7(:,:,4))./(features7(:,:,5)+features7(:,:,4));
rendvib7 = (features7(:,:,6)-features7(:,:,5))./(features7(:,:,6)+features7(:,:,5));
reci7= features7(:,:,7)./features7(:,:,5)-1;
vari7 = (features7(:,:,3)-features7(:,:,4))./(features7(:,:,3)+features7(:,:,4)-features7(:,:,2));
features7=cat(3,ndvi7,rgvi7,rendvia7,rendvib7,reci7,vari7,features7/10000);


features8 = single(features8);
ndvi8 = (features8(:,:,8)-features8(:,:,4))./(features8(:,:,8)+features8(:,:,4)); %NDVI hesabÄ±
rgvi8 = (features8(:,:,4)-features8(:,:,3))./(features8(:,:,3)+features8(:,:,4)); %NDVI hesabÄ±
rendvia8 = (features8(:,:,5)-features8(:,:,4))./(features8(:,:,5)+features8(:,:,4));
rendvib8 = (features8(:,:,6)-features8(:,:,5))./(features8(:,:,6)+features8(:,:,5));
reci8 = features8(:,:,7)./features8(:,:,5)-1;
vari8 = (features8(:,:,3)-features8(:,:,4))./(features8(:,:,3)+features8(:,:,4)-features8(:,:,2));
features8=cat(3,ndvi8,rgvi8,rendvia8,rendvib8,reci8,vari8,features8/10000);


featurest = cat(3,features1,features2,features3,features4,features5,features6,features7,features8);
featuresy = reshape(featurest,[size(featurest,1)*size(featurest,2) size(featurest,3)]);
featurest = cat(3,featurest,seg1);

featuresy = reshape(featurest,[size(featurest,1)*size(featurest,2) size(featurest,3)]);

featuresy=single(featuresy);

featurest = featurest(:,:,1:144);
immm=double(seg1);
immm(find(seg1==10))=0;
immm(find(seg1==20))=0.4;
immm(find(seg1==30))=0;
immm(find(seg1==40))=0;
immm(find(seg1==50))=1;
immm(find(seg1==60))=1;


immm2=double(seg1);
immm2(find(seg1==10))=0;
immm2(find(seg1==20))=0;
immm2(find(seg1==30))=1;
immm2(find(seg1==40))=0;
immm2(find(seg1==50))=0.1034;
immm2(find(seg1==60))=0.8276;


immm3=double(seg1);
immm3(find(seg1==10))=1;
immm3(find(seg1==20))=0;
immm3(find(seg1==30))=0;
immm3(find(seg1==40))=0.1724;
immm3(find(seg1==50))=0.7241;
immm3(find(seg1==60))=0;


imm =cat(3,immm,immm2,immm3);
imm=uint8(255*imm);

kk=1;
morphologic_elementsize = 1;
seRadius=morphologic_elementsize;
mw='mean';
chm2=255*mat2gray(chm2);
compactness=0.205;

for numsp=200:200:4000

[l2] = LSC_mex(cat(3,uint8(chm2),uint8(chm2),uint8(chm2)), numsp,compactness);

% [l2] = LSC_mex(cat(3,uint8(2550*featurest(:,:,8)),uint8(2550*featurest(:,:,9)),uint8(2550*featurest(:,:,10))), numsp,compactness);
superpixel_num_realized = length(unique(l2));
hebe3=drawregionboundaries(l2, uint8(imm), [255 255 255]);
hebe33=drawregionboundaries(l2, uint8(zeros(size(seg1,1),size(seg1,2),3)), [1 1 1]);
hebe33=hebe33(:,:,1); 
hebe33 = hebe33 .* uint8(seg1>0);
l22=l2(64:180,28:160);
seg11=seg1(64:180,28:160);
l22 = renumberregions(l22);
seg11=renumberregions(seg11);
[xxxa9(numsp/200),xxxb9(numsp/200),xxxc9(numsp/200)]=getUndersegmentationError(l2,seg1);
[xxxa99(numsp/200),xxxb99(numsp/200),xxxc99(numsp/200)]=getUndersegmentationError(l22,seg11);
[xxxTP9(numsp/200) xxxFP9(numsp/200) xxxTN9(numsp/200) xxxFN9(numsp/200)] = compareBoundaryImagesSimple(hebe33, sinir, kk);
xxxAMR9(numsp/200) = xxxTP9(numsp/200)/(xxxTP9(numsp/200)+xxxFP9(numsp/200));
xxxAMR99(numsp/200) = xxxTP9(numsp/200)/(xxxTP9(numsp/200)+xxxFN9(numsp/200));
imwrite(hebe3,['LSC_' num2str(superpixel_num_realized) '_UE_' num2str(xxxa99(numsp/200)) '_AMR_'  num2str(xxxAMR9(numsp/200)) '.tif']);
xxxnumzer9(numsp/200)=superpixel_num_realized;
end

save('LSC_results_imcomplete.mat');