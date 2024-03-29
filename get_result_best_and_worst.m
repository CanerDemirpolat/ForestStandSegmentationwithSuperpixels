%Script to obtain best and worst performance scenarios

clear all;close all;clc;
seg1 = single(imread('ForestStandMap.tif'));
features2  = imread('sentinel2_2018_0507.tif');

seg1=imresize(single(seg1),[size(features2,1) size(features2,2)],'nearest');

sinir = single(imread('ForestStandEdges.tif'));
sinir=imresize(single(sinir),[size(features2,1) size(features2,2)],'nearest');

seg1= seg1(1:300,1:300,:);
sinir = sinir(1:300,1:300);


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
[l2, Am, C] = sliczero(zeros(300,300,3), numsp, compactness, morphologic_elementsize, 'mean');
superpixel_num_realized = length(unique(l2));
hebe3=drawregionboundaries(l2, uint8(imm), [255 255 255]);
hebe33=drawregionboundaries(l2, uint8(zeros(size(seg1,1),size(seg1,2),3)), [1 1 1]);
hebe33=hebe33(:,:,1); 
hebe33 = hebe33 .* uint8(seg1>0);
l22=l2(64:180,28:160);
seg11=seg1(64:180,28:160);
l22 = renumberregions(l22);
seg11=renumberregions(seg11);
[xa9(numsp/200),xb9(numsp/200),xc9(numsp/200)]=getUndersegmentationError(l2,seg1);
[xa99(numsp/200),xb99(numsp/200),xc99(numsp/200)]=getUndersegmentationError(l22,seg11);
[xTP9(numsp/200) xFP9(numsp/200) xTN9(numsp/200) xFN9(numsp/200)] = compareBoundaryImagesSimple(hebe33, sinir, kk);
xAMR9(numsp/200) = xTP9(numsp/200)/(xTP9(numsp/200)+xFP9(numsp/200));
xAMR99(numsp/200) = xTP9(numsp/200)/(xTP9(numsp/200)+xFN9(numsp/200));
imwrite(hebe3,['Mimimum_' num2str(superpixel_num_realized) '_UE_' num2str(xa99(numsp/200)) '_AMR_'  num2str(xAMR9(numsp/200)) '.tif']);
xnumzer9(numsp/200)=superpixel_num_realized;

[l2, Am, C] = sliczero(cat(3,seg1,seg1,seg1), numsp, compactness, morphologic_elementsize, 'mean');
superpixel_num_realized = length(unique(l2));
hebe3=drawregionboundaries(l2, uint8(imm), [255 255 255]);
hebe33=drawregionboundaries(l2, uint8(zeros(size(seg1,1),size(seg1,2),3)), [1 1 1]);
hebe33=hebe33(:,:,1); 
hebe33 = hebe33 .* uint8(seg1>0);
l22=l2(64:180,28:160);
seg11=seg1(64:180,28:160);
l22 = renumberregions(l22);
seg11=renumberregions(seg11);
[xxa9(numsp/200),xxb9(numsp/200),xxc9(numsp/200)]=getUndersegmentationError(l2,seg1);
[xxa99(numsp/200),xxb99(numsp/200),xxc99(numsp/200)]=getUndersegmentationError(l22,seg11);
[xxTP9(numsp/200) xxFP9(numsp/200) xxTN9(numsp/200) xxFN9(numsp/200)] = compareBoundaryImagesSimple(hebe33, sinir, kk);
xxAMR9(numsp/200) = xxTP9(numsp/200)/(xxTP9(numsp/200)+xxFP9(numsp/200));
xxAMR99(numsp/200) = xxTP9(numsp/200)/(xxTP9(numsp/200)+xxFN9(numsp/200));
imwrite(hebe3,['Maximum_' num2str(superpixel_num_realized) '_UE_' num2str(xxa99(numsp/200)) '_AMR_'  num2str(xxAMR9(numsp/200)) '.tif']);
xxnumzer9(numsp/200)=superpixel_num_realized;

end


