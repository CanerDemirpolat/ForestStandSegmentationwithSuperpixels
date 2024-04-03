%Script to obtain segmentations by RF-SLIC, GPR-SLIC, ERS-CHM, SLIC-CHM and SLIC-RGB methods
clear all;close all;clc;
seg1 = single(imread('ForestStandMap.tif'));

chm = imread('CHM.tif');
chm2 = imresize(chm,[size(seg1,1) size(seg1,2)],'bilinear');
chm2(find(chm2<0))=0;
%tur1 = single(imread('rasterizeddd_turler_subseet.tif'));

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
ndvi1 = (features1(:,:,8)-features1(:,:,4))./(features1(:,:,8)+features1(:,:,4));
rgvi1 = (features1(:,:,4)-features1(:,:,3))./(features1(:,:,3)+features1(:,:,4)); 
rendvia1 = (features1(:,:,5)-features1(:,:,4))./(features1(:,:,5)+features1(:,:,4));
rendvib1 = (features1(:,:,6)-features1(:,:,5))./(features1(:,:,6)+features1(:,:,5));
reci1= features1(:,:,7)./features1(:,:,5)-1;
vari1 = (features1(:,:,3)-features1(:,:,4))./(features1(:,:,3)+features1(:,:,4)-features1(:,:,2));
features1=cat(3,ndvi1,rgvi1,rendvia1,rendvib1,reci1,vari1,features1/10000);



features2 = single(features2);
ndvi2 = (features2(:,:,8)-features2(:,:,4))./(features2(:,:,8)+features2(:,:,4)); 
rgvi2 = (features2(:,:,4)-features2(:,:,3))./(features2(:,:,3)+features2(:,:,4)); 
rendvia2 = (features2(:,:,5)-features2(:,:,4))./(features2(:,:,5)+features2(:,:,4));
rendvib2 = (features2(:,:,6)-features2(:,:,5))./(features2(:,:,6)+features2(:,:,5));
reci2= features2(:,:,7)./features2(:,:,5)-1;
vari2 = (features2(:,:,3)-features2(:,:,4))./(features2(:,:,3)+features2(:,:,4)-features2(:,:,2));
features2=cat(3,ndvi2,rgvi2,rendvia2,rendvib2,reci2,vari2,features2/10000);


features3 = single(features3);
ndvi3 = (features3(:,:,8)-features3(:,:,4))./(features3(:,:,8)+features3(:,:,4)); 
rgvi3 = (features3(:,:,4)-features3(:,:,3))./(features3(:,:,3)+features3(:,:,4)); 
rendvia3 = (features3(:,:,5)-features3(:,:,4))./(features3(:,:,5)+features3(:,:,4));
rendvib3 = (features3(:,:,6)-features3(:,:,5))./(features3(:,:,6)+features3(:,:,5));
reci3= features3(:,:,7)./features3(:,:,5)-1;
vari3 = (features3(:,:,3)-features3(:,:,4))./(features3(:,:,3)+features3(:,:,4)-features3(:,:,2));
features3=cat(3,ndvi3,rgvi3,rendvia3,rendvib3,reci3,vari3,features3/10000);


features4 = single(features4);
ndvi4 = (features4(:,:,8)-features4(:,:,4))./(features4(:,:,8)+features4(:,:,4));
rgvi4 = (features4(:,:,4)-features4(:,:,3))./(features4(:,:,3)+features4(:,:,4)); 
rendvia4 = (features4(:,:,5)-features4(:,:,4))./(features4(:,:,5)+features4(:,:,4));
rendvib4 = (features4(:,:,6)-features4(:,:,5))./(features4(:,:,6)+features4(:,:,5));
reci4= features4(:,:,7)./features4(:,:,5)-1;
vari4 = (features4(:,:,3)-features4(:,:,4))./(features4(:,:,3)+features4(:,:,4)-features4(:,:,2));
features4=cat(3,ndvi4,rgvi4,rendvia4,rendvib4,reci4,vari4,features4/10000);


features5 = single(features5);
ndvi5 = (features5(:,:,8)-features5(:,:,4))./(features5(:,:,8)+features5(:,:,4));
rgvi5 = (features5(:,:,4)-features5(:,:,3))./(features5(:,:,3)+features5(:,:,4));
rendvia5 = (features5(:,:,5)-features5(:,:,4))./(features5(:,:,5)+features5(:,:,4));
rendvib5 = (features5(:,:,6)-features5(:,:,5))./(features5(:,:,6)+features5(:,:,5));
reci5= features5(:,:,7)./features5(:,:,5)-1;
vari5 = (features5(:,:,3)-features5(:,:,4))./(features5(:,:,3)+features5(:,:,4)-features5(:,:,2));
features5=cat(3,ndvi5,rgvi5,rendvia5,rendvib5,reci5,vari5,features5/10000);

features6 = single(features6);
ndvi6 = (features6(:,:,8)-features6(:,:,4))./(features6(:,:,8)+features6(:,:,4));
rgvi6 = (features6(:,:,4)-features6(:,:,3))./(features6(:,:,3)+features6(:,:,4));
rendvia6 = (features6(:,:,5)-features6(:,:,4))./(features6(:,:,5)+features6(:,:,4));
rendvib6 = (features6(:,:,6)-features6(:,:,5))./(features6(:,:,6)+features6(:,:,5));
reci6= features6(:,:,7)./features6(:,:,5)-1;
vari6 = (features6(:,:,3)-features6(:,:,4))./(features6(:,:,3)+features6(:,:,4)-features6(:,:,2));
features6=cat(3,ndvi6,rgvi6,rendvia6,rendvib6,reci6,vari6,features6/10000);

features7 = single(features7);
ndvi7 = (features7(:,:,8)-features7(:,:,4))./(features7(:,:,8)+features7(:,:,4)); 
rgvi7 = (features7(:,:,4)-features7(:,:,3))./(features7(:,:,3)+features7(:,:,4)); 
rendvia7 = (features7(:,:,5)-features7(:,:,4))./(features7(:,:,5)+features7(:,:,4));
rendvib7 = (features7(:,:,6)-features7(:,:,5))./(features7(:,:,6)+features7(:,:,5));
reci7= features7(:,:,7)./features7(:,:,5)-1;
vari7 = (features7(:,:,3)-features7(:,:,4))./(features7(:,:,3)+features7(:,:,4)-features7(:,:,2));
features7=cat(3,ndvi7,rgvi7,rendvia7,rendvib7,reci7,vari7,features7/10000);


features8 = single(features8);
ndvi8 = (features8(:,:,8)-features8(:,:,4))./(features8(:,:,8)+features8(:,:,4)); 
rgvi8 = (features8(:,:,4)-features8(:,:,3))./(features8(:,:,3)+features8(:,:,4));
rendvia8 = (features8(:,:,5)-features8(:,:,4))./(features8(:,:,5)+features8(:,:,4));
rendvib8 = (features8(:,:,6)-features8(:,:,5))./(features8(:,:,6)+features8(:,:,5));
reci8 = features8(:,:,7)./features8(:,:,5)-1;
vari8 = (features8(:,:,3)-features8(:,:,4))./(features8(:,:,3)+features8(:,:,4)-features8(:,:,2));
features8=cat(3,ndvi8,rgvi8,rendvia8,rendvib8,reci8,vari8,features8/10000);

featurest_ndvi = cat(3,ndvi1,ndvi2,ndvi3,ndvi4,ndvi5,ndvi6,ndvi7,ndvi8);

featurest = cat(3,features1,features2,features3,features4,features5,features6,features7,features8);
featuresy = reshape(featurest,[size(featurest,1)*size(featurest,2) size(featurest,3)]);
featurest = cat(3,featurest,seg1);

featuresy = reshape(featurest,[size(featurest,1)*size(featurest,2) size(featurest,3)]);

featuresy=single(featuresy);

featurest = featurest(:,:,1:144);
seg1(find(seg1>60))=0;

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

compactness=10;
kk=1;
m=compactness;
morphologic_elementsize = 1;
seRadius=morphologic_elementsize;
mw='mean';
for numsp=200:200:4000 


[l2,NumLabels]=superpixels(cat(3,featurest(:,:,8),featurest(:,:,9),featurest(:,:,10)),numsp,'IsInputLab',0);
superpixel_num_realized = length(unique(l2));
hebe3=drawregionboundaries(l2, uint8(imm), [255 255 255]);
hebe33=drawregionboundaries(l2, uint8(zeros(size(seg1,1),size(seg1,2),3)), [1 1 1]);
hebe33=hebe33(:,:,1); 
hebe33 = hebe33 .* uint8(seg1>0);

l22=l2(64:180,28:160);
seg11=seg1(64:180,28:160);
l22 = renumberregions(l22);
seg11=renumberregions(seg11);

[a2(numsp/200),b2(numsp/200),c2(numsp/200)]=getUndersegmentationError(l2,seg1);
[a22(numsp/200),b22(numsp/200),c22(numsp/200)]=getUndersegmentationError(l22,seg11);

 
 [TP2(numsp/200) FP2(numsp/200) TN2(numsp/200) FN2(numsp/200)] = compareBoundaryImagesSimple(hebe33, sinir, kk);
AMR2(numsp/200) = TP2(numsp/200)/(TP2(numsp/200)+FP2(numsp/200));
AMR22(numsp/200) = TP2(numsp/200)/(TP2(numsp/200)+FN2(numsp/200));

imwrite(hebe3,['SLIC_RGB_' num2str(superpixel_num_realized) '_UE_' num2str(a22(numsp/200)) '_AMR_'  num2str(AMR2(numsp/200)) '_.tif']);
numzer2(numsp/200)=superpixel_num_realized;



nC = numsp;
t = cputime;
lambda_prime = 0.5;sigma = 5.0; 
conn8 = 1; % flag for using 8 connected grid graph (default setting).
 [l2] = mex_ers(double(cat(3,chm2,chm2,chm2)),nC);   
 superpixel_num_realized = length(unique(l2));
hebe3=drawregionboundaries(l2, uint8(imm), [255 255 255]);
hebe33=drawregionboundaries(l2, uint8(zeros(size(seg1,1),size(seg1,2),3)), [1 1 1]);
hebe33=hebe33(:,:,1); 
hebe33 = hebe33 .* uint8(seg1>0);

l22=l2(64:180,28:160);
seg11=seg1(64:180,28:160);
l22 = renumberregions(l22);
seg11=renumberregions(seg11);

 [a4(numsp/200),b4(numsp/200),c4(numsp/200)]=getUndersegmentationError(l2,seg1);
[a44(numsp/200),b44(numsp/200),c44(numsp/200)]=getUndersegmentationError(l22,seg11);

 
 [TP4(numsp/200) FP4(numsp/200) TN4(numsp/200) FN4(numsp/200)] = compareBoundaryImagesSimple(hebe33, sinir, kk);
AMR4(numsp/200) = TP4(numsp/200)/(TP4(numsp/200)+FP4(numsp/200));
AMR44(numsp/200) = TP4(numsp/200)/(TP4(numsp/200)+FN4(numsp/200));

imwrite(hebe3,['ERS_CHM_' num2str(superpixel_num_realized) '_UE_' num2str(a44(numsp/200)) '_AMR_'  num2str(AMR4(numsp/200)) '.tif']);
numzer4(numsp/200)=superpixel_num_realized;


[l2,NumLabels]=superpixels(cat(3,chm2,chm2,chm2),numsp,'IsInputLab',1);

superpixel_num_realized = length(unique(l2));
hebe3=drawregionboundaries(l2, uint8(imm), [255 255 255]);
hebe33=drawregionboundaries(l2, uint8(zeros(size(seg1,1),size(seg1,2),3)), [1 1 1]);
hebe33=hebe33(:,:,1);
hebe33 = hebe33 .* uint8(seg1>0);
% 
l22=l2(64:180,28:160);
seg11=seg1(64:180,28:160);
l22 = renumberregions(l22);
seg11=renumberregions(seg11);

[a5(numsp/200),b5(numsp/200),c5(numsp/200)]=getUndersegmentationError(l2,seg1);
[a55(numsp/200),b55(numsp/200),c55(numsp/200)]=getUndersegmentationError(l22,seg11);


[TP5(numsp/200) FP5(numsp/200) TN5(numsp/200) FN5(numsp/200)] = compareBoundaryImagesSimple(hebe33, sinir, kk);
AMR5(numsp/200) = TP5(numsp/200)/(TP5(numsp/200)+FP5(numsp/200));
AMR55(numsp/200) = TP5(numsp/200)/(TP5(numsp/200)+FN5(numsp/200));

imwrite(hebe3,['SLIC_CHM_' num2str(superpixel_num_realized) '_UE_' num2str(a55(numsp/200)) '_AMR_'  num2str(AMR5(numsp/200)) '_.tif']);
numzer5(numsp/200)=superpixel_num_realized;


[l2, Am, C] = RF_SLIC(featurest, numsp, compactness, morphologic_elementsize, 'mean');
superpixel_num_realized = length(unique(l2));
hebe3=drawregionboundaries(l2, uint8(imm), [255 255 255]);
hebe33=drawregionboundaries(l2, uint8(zeros(size(seg1,1),size(seg1,2),3)), [1 1 1]);
hebe33=hebe33(:,:,1); 
hebe33 = hebe33 .* uint8(seg1>0);

l22=l2(64:180,28:160);
seg11=seg1(64:180,28:160);
l22 = renumberregions(l22);
seg11=renumberregions(seg11);

 [a6(numsp/200),b6(numsp/200),c6(numsp/200)]=getUndersegmentationError(l2,seg1);
[a66(numsp/200),b66(numsp/200),c66(numsp/200)]=getUndersegmentationError(l22,seg11);

 [TP6(numsp/200) FP6(numsp/200) TN6(numsp/200) FN6(numsp/200)] = compareBoundaryImagesSimple(hebe33, sinir, kk);
AMR6(numsp/200) = TP6(numsp/200)/(TP6(numsp/200)+FP6(numsp/200));
AMR66(numsp/200) = TP6(numsp/200)/(TP6(numsp/200)+FN6(numsp/200));

imwrite(hebe3,['RF_SLIC_' num2str(superpixel_num_realized) '_UE_' num2str(a66(numsp/200)) '_AMR_'  num2str(AMR6(numsp/200)) '.tif']);
numzer6(numsp/200)=superpixel_num_realized;

[l2, Am, C] = GPR_SLIC(featurest, numsp, compactness, morphologic_elementsize, 'mean');
superpixel_num_realized = length(unique(l2));
hebe3=drawregionboundaries(l2, uint8(imm), [255 255 255]);
hebe33=drawregionboundaries(l2, uint8(zeros(size(seg1,1),size(seg1,2),3)), [1 1 1]);
hebe33=hebe33(:,:,1); 
hebe33 = hebe33 .* uint8(seg1>0);

l22=l2(64:180,28:160);
seg11=seg1(64:180,28:160);
l22 = renumberregions(l22);
seg11=renumberregions(seg11);

 [a7(numsp/200),b7(numsp/200),c7(numsp/200)]=getUndersegmentationError(l2,seg1);
[a77(numsp/200),b77(numsp/200),c77(numsp/200)]=getUndersegmentationError(l22,seg11);

 [TP7(numsp/200) FP7(numsp/200) TN7(numsp/200) FN7(numsp/200)] = compareBoundaryImagesSimple(hebe33, sinir, kk);
AMR7(numsp/200) = TP7(numsp/200)/(TP7(numsp/200)+FP7(numsp/200));
AMR77(numsp/200) = TP7(numsp/200)/(TP7(numsp/200)+FN7(numsp/200));

imwrite(hebe3,['GPR_SLIC_' num2str(superpixel_num_realized) '_UE_' num2str(a77(numsp/200)) '_AMR_'  num2str(AMR7(numsp/200)) '.tif']);
numzer7(numsp/200)=superpixel_num_realized;

end




accuracy2 = (TP2 + TN2)/(length(l2(:))); 
accuracy4 = (TP4 + TN4)/(length(l2(:))); 
accuracy5 = (TP5 + TN5)/(length(l2(:))); 
accuracy6 = (TP6 + TN6)/(length(l2(:))); 
accuracy7 = (TP7 + TN7)/(length(l2(:))); 



specifity2 = (TN2)./(TN2+FP2);
specifity4 = (TN4)./(TN4+FP4);
specifity5 = (TN5)./(TN5+FP5);
specifity6 = (TN6)./(TN6+FP6);
specifity7 = (TN7)./(TN7+FP7);



colorstring = 'kbgrycm';


interval=100:1:4000;
figure
vq2=interp1(numzer2,AMR2,interval,'linear');
plot(interval,vq2,'Color', colorstring(2),'LineWidth',3)
hold on
vq4=interp1(numzer4,AMR4,interval,'linear');
plot(interval,vq4,'Color', colorstring(4),'LineWidth',3)
hold on
vq5=interp1(numzer5,AMR5,interval,'linear');
plot(interval,vq5,'Color', colorstring(5),'LineWidth',3)
hold on
vq6=interp1(numzer6,AMR6,interval,'linear');
plot(interval,vq6,'Color', colorstring(6),'LineWidth',3)
hold on
vq7=interp1(numzer7,AMR7,interval,'linear');
plot(interval,vq7,'Color', colorstring(7),'LineWidth',3)


legend('SLIC RGB','ERS CHM','MATLABSLIC CHM','RF-SLIC','GRP-SLIC')
title('Boundary Precision')
xlabel('Number of Superpixels')



interval=100:1:4000;
figure;
vq2=interp1(numzer2,AMR22,interval,'linear');
plot(interval,vq2,'Color', colorstring(2),'LineWidth',3)
hold on
vq4=interp1(numzer4,AMR44,interval,'linear');
plot(interval,vq4,'Color', colorstring(4),'LineWidth',3)
hold on
vq5=interp1(numzer5,AMR55,interval,'linear');
plot(interval,vq5,'Color', colorstring(5),'LineWidth',3)
hold on
vq6=interp1(numzer6,AMR66,interval,'linear');
plot(interval,vq6,'Color', colorstring(6),'LineWidth',3)
hold on
vq7=interp1(numzer7,AMR77,interval,'linear');
plot(interval,vq7,'Color', colorstring(7),'LineWidth',3)



legend('SLIC RGB','ERS CHM','MATLABSLIC CHM','RF-SLIC','GRP-SLIC')
title('Boundary Sensitivity')
xlabel('Number of Superpixels')


interval=100:1:4000;
figure
vq2=interp1(numzer2,accuracy2,interval,'linear');
plot(interval,vq2,'Color', colorstring(2),'LineWidth',3)
hold on
vq4=interp1(numzer4,accuracy4,interval,'linear');
plot(interval,vq4,'Color', colorstring(4),'LineWidth',3)
hold on
vq5=interp1(numzer5,accuracy5,interval,'linear');
plot(interval,vq5,'Color', colorstring(5),'LineWidth',3)
hold on
vq6=interp1(numzer6,accuracy6,interval,'linear');
plot(interval,vq6,'Color', colorstring(6),'LineWidth',3)
hold on
vq7=interp1(numzer7,accuracy7,interval,'linear');
plot(interval,vq7,'Color', colorstring(7),'LineWidth',3)

legend('SLIC RGB','ERS CHM','MATLABSLIC CHM','RF-SLIC','GRP-SLIC')
title('Boundary Accuracy')
xlabel('Number of Superpixels')



interval=100:1:4000;
figure;
hold on
vq2=interp1(numzer2,specifity2,interval,'linear');
plot(interval,vq2,'Color', colorstring(2),'LineWidth',3)
hold on
vq4=interp1(numzer4,specifity4,interval,'linear');
plot(interval,vq4,'Color', colorstring(4),'LineWidth',3)
hold on
vq5=interp1(numzer5,specifity5,interval,'linear');
plot(interval,vq5,'Color', colorstring(5),'LineWidth',3)
hold on
vq6=interp1(numzer6,specifity6,interval,'linear');
plot(interval,vq6,'Color', colorstring(6),'LineWidth',3)
hold on
vq7=interp1(numzer7,specifity7,interval,'linear');
plot(interval,vq7,'Color', colorstring(7),'LineWidth',3)

legend('SLIC RGB','ERS CHM','MATLABSLIC CHM','RF-SLIC','GRP-SLIC')
title('Boundary Specifity')
xlabel('Number of Superpixels')



figure;
vq2=interp1(numzer2,a2,interval,'linear');
plot(interval,vq2,'Color', colorstring(2),'LineWidth',3)
hold on
vq4=interp1(numzer4,a4,interval,'linear');
plot(interval,vq4,'Color', colorstring(4),'LineWidth',3)
hold on
vq5=interp1(numzer5,a5,interval,'linear');
plot(interval,vq5,'Color', colorstring(5),'LineWidth',3)
hold on
vq6=interp1(numzer6,a6,interval,'linear');
plot(interval,vq6,'Color', colorstring(6),'LineWidth',3)
hold on
vq7=interp1(numzer7,a7,interval,'linear');
plot(interval,vq7,'Color', colorstring(7),'LineWidth',3)

legend('SLIC RGB','ERS CHM','MATLABSLIC CHM','RF-SLIC','GRP-SLIC')
title('Undersegmentation Error')
xlabel('Number of Superpixels')





figure;
vq2=interp1(numzer2,a22,interval,'linear');
plot(interval,vq2,'Color', colorstring(2),'LineWidth',3)
hold on
vq4=interp1(numzer4,a44,interval,'linear');
plot(interval,vq4,'Color', colorstring(4),'LineWidth',3)
hold on
vq5=interp1(numzer5,a55,interval,'linear');
plot(interval,vq5,'Color', colorstring(5),'LineWidth',3)
hold on
vq6=interp1(numzer6,a66,interval,'linear');
plot(interval,vq6,'Color', colorstring(6),'LineWidth',3)
hold on
vq7=interp1(numzer7,a77,interval,'linear');
plot(interval,vq7,'Color', colorstring(7),'LineWidth',3)

legend('SLIC RGB','ERS CHM','MATLABSLIC CHM','RF-SLIC','GRP-SLIC')
title('Undersegmentation Error 2')
xlabel('Number of Superpixels')

save('results_5methods.mat');