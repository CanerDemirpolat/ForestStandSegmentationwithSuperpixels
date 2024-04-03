%Script to obtain performance figures
%Uses previously saved results from "get_results_5methods.m",
%"get_results_SNIC.m","get_result_best_and_worst.m" and "get_results_LSC.mat"
clear all
close all
clc
load('SNIC_results.mat');
load ('results_5methods.mat');
load('best_and_worst_results.mat');
load('LSC_results.mat');

accuracy11 = (xxxTP9 + xxxTN9)/(length(l2(:))); 
accuracy1 = (xTP9 + xTN9)/(length(l2(:))); 
accuracy10 = (TP10 + TN10)/(length(l2(:))); 
accuracy3 = (xxTP9 + xxTN9)/(length(l2(:))); 

specifity11 = (xxxTN9)./(xxxTN9+xxxFP9);
specifity1 = (xTN9)./(xTN9+xFP9);
specifity10 = (TN10)./(TN10+FP10);
specifity3 = (xxTN9)./(xxTN9+xxFP9);


numzer10=[numzer10(1:6) numzer10(10)];
specifity10 =[specifity10(1:6) specifity10(10)];
accuracy10 = [accuracy10(1:6) accuracy10(10)];
AMR10 = [AMR10(1:6) AMR10(10)];

AMR1010 = [AMR1010(1:6) AMR1010(10)];

a10 = [a10(1:6) a10(10)];
colorstring = 'kbgrycm';

AMR10=AMR10(1:6);
AMR1010=AMR1010(1:6);
accuracy10=accuracy10(1:6);
specifity10=specifity10(1:6);
a10 = a10(1:6);
numzer10 = numzer10(1:6);

numzer2 = 900./numzer2;
numzer4 = 900./numzer4;
numzer5 = 900./numzer5;
numzer6 = 900./numzer6;
numzer7 = 900./numzer7;
numzer10 = 900./numzer10;
numzer1 = 900./xnumzer9;
numzer3 = 900./xxnumzer9;
numzer11 = 900./xxxnumzer9;

interval=0:0.00001:4;

figure



vq1=interp1(numzer1,xAMR9,interval,'linear');
plot(interval,vq1,'-.','Color', colorstring(7),'LineWidth',3)
hold on

vq3=interp1(numzer3,xxAMR9,interval,'linear');
plot(interval,vq3,'-.','Color', [192/255 192/255 192/255],'LineWidth',3)
hold on

vq=interp1(numzer11,xxxAMR9,interval,'linear');
plot(interval,vq,'Color', [69/255 139/255 0/255],'LineWidth',3)
hold on


vq2=interp1(numzer2,AMR2,interval,'linear');
plot(interval,vq2,'Color', colorstring(1),'LineWidth',3)
hold on
vq4=interp1(numzer4,AMR4,interval,'linear');
plot(interval,vq4,'Color', colorstring(2),'LineWidth',3)
hold on
vq5=interp1(numzer5,AMR5,interval,'linear');
plot(interval,vq5,'Color', colorstring(6),'LineWidth',3)
hold on
vq6=interp1(numzer6,AMR6,interval,'linear');
plot(interval,vq6,'Color', colorstring(3),'LineWidth',3)
hold on
vq7=interp1(numzer7,AMR7,interval,'linear');
plot(interval,vq7,'Color', colorstring(4),'LineWidth',3)
hold on
vq10=interp1(numzer10,AMR10,interval,'linear');
plot(interval,vq10,'Color', colorstring(5),'LineWidth',3)
plot(numzer2,AMR2,'k*','MarkerSize',24,'MarkerFaceColor','k')
plot(numzer4,AMR4,'bdiamond','MarkerSize',12,'MarkerFaceColor','b')
plot(numzer5,AMR5,'chexagram','MarkerSize',12,'MarkerFaceColor','c')
plot(numzer6,AMR6,'gsquare','MarkerSize',12,'MarkerFaceColor','g')
plot(numzer7,AMR7,'rpentagram','MarkerSize',12,'MarkerFaceColor','r')
plot(numzer10,AMR10,'yo','MarkerSize',12,'MarkerFaceColor','y')
plot(numzer11,xxxAMR9,'g^','MarkerSize',12,'MarkerFaceColor',[69/255 139/255 0/255])

colorstring = 'kbgrycm';

legend('Lowest Performance Scenario','Peak Performance Scenario','LSC CHM','SLIC RGB','ERS CHM','SLIC CHM','RF-SLIC','GPR-SLIC','SNIC CHM','FontSize',20)
ylabel('Boundary Precision','FontSize',24)
xlabel('Average Size of the Superpixels in Hectares','FontSize',24)
set(gca,'FontSize',24)
xlim([0.2 1])



figure;
vq1=interp1(numzer1,xAMR99,interval,'linear');
plot(interval,vq1,'-.','Color', colorstring(7),'LineWidth',3)
hold on

vq3=interp1(numzer3,xxAMR99,interval,'linear');
plot(interval,vq3,'-.','Color', [192/255 192/255 192/255],'LineWidth',3)
hold on

vq=interp1(numzer11,xxxAMR99,interval,'linear');
plot(interval,vq,'Color', [69/255 139/255 0/255],'LineWidth',3)
hold on

vq2=interp1(numzer2,AMR22,interval,'linear');
plot(interval,vq2,'Color', colorstring(1),'LineWidth',3)
hold on
vq4=interp1(numzer4,AMR44,interval,'linear');
plot(interval,vq4,'Color', colorstring(2),'LineWidth',3)
hold on
vq5=interp1(numzer5,AMR55,interval,'linear');
plot(interval,vq5,'Color', colorstring(6),'LineWidth',3)
hold on
vq6=interp1(numzer6,AMR66,interval,'linear');
plot(interval,vq6,'Color', colorstring(3),'LineWidth',3)
hold on
vq7=interp1(numzer7,AMR77,interval,'linear');
plot(interval,vq7,'Color', colorstring(4),'LineWidth',3)
hold on
vq10=interp1(numzer10,AMR1010,interval,'linear');
plot(interval,vq10,'Color', colorstring(5),'LineWidth',3)
plot(numzer2,AMR22,'k*','MarkerSize',24,'MarkerFaceColor','k')
plot(numzer4,AMR44,'bdiamond','MarkerSize',12,'MarkerFaceColor','b')
plot(numzer5,AMR55,'chexagram','MarkerSize',12,'MarkerFaceColor','c')
plot(numzer6,AMR66,'gsquare','MarkerSize',12,'MarkerFaceColor','g')
plot(numzer7,AMR77,'rpentagram','MarkerSize',12,'MarkerFaceColor','r')

plot(numzer10,AMR1010,'yo','MarkerSize',12,'MarkerFaceColor','y')
plot(numzer11,xxxAMR99,'g^','MarkerSize',12,'MarkerFaceColor',[69/255 139/255 0/255])

colorstring = 'kbgrycm';
legend('Lowest Performance Scenario','Peak Performance Scenario','LSC CHM','SLIC RGB','ERS CHM','SLIC CHM','RF-SLIC','GPR-SLIC','SNIC CHM','FontSize',20)
ylabel('Boundary Sensitivity','FontSize',24)
xlabel('Average Size of the Superpixels in Hectares','FontSize',24)
set(gca,'FontSize',24)
xlim([0.2 1])


figure
vq1=interp1(numzer1,accuracy1,interval,'linear');
plot(interval,vq1,'-.','Color', colorstring(7),'LineWidth',3)
hold on

vq3=interp1(numzer3,accuracy3,interval,'linear');
plot(interval,vq3,'-.','Color', [192/255 192/255 192/255],'LineWidth',3)
hold on

vq=interp1(numzer11,accuracy11,interval,'linear');
plot(interval,vq,'Color', [69/255 139/255 0/255],'LineWidth',3)
hold on

vq2=interp1(numzer2,accuracy2,interval,'linear');
plot(interval,vq2,'Color', colorstring(1),'LineWidth',3)
hold on
vq4=interp1(numzer4,accuracy4,interval,'linear');
plot(interval,vq4,'Color', colorstring(2),'LineWidth',3)
hold on
vq5=interp1(numzer5,accuracy5,interval,'linear');
plot(interval,vq5,'Color', colorstring(6),'LineWidth',3)
hold on
vq6=interp1(numzer6,accuracy6,interval,'linear');
plot(interval,vq6,'Color', colorstring(3),'LineWidth',3)
hold on
vq7=interp1(numzer7,accuracy7,interval,'linear');
plot(interval,vq7,'Color', colorstring(4),'LineWidth',3)
hold on
vq10=interp1(numzer10,accuracy10,interval,'linear');
plot(interval,vq10,'Color', colorstring(5),'LineWidth',3)
plot(numzer2,accuracy2,'k*','MarkerSize',24,'MarkerFaceColor','k')
plot(numzer4,accuracy4,'bdiamond','MarkerSize',12,'MarkerFaceColor','b')
plot(numzer5,accuracy5,'chexagram','MarkerSize',12,'MarkerFaceColor','c')
plot(numzer6,accuracy6,'gsquare','MarkerSize',12,'MarkerFaceColor','g')
plot(numzer7,accuracy7,'rpentagram','MarkerSize',12,'MarkerFaceColor','r')

plot(numzer10,accuracy10,'yo','MarkerSize',12,'MarkerFaceColor','y')
plot(numzer11,accuracy11,'g^','MarkerSize',12,'MarkerFaceColor',[69/255 139/255 0/255])

colorstring = 'kbgrycm';
legend('Lowest Performance Scenario','Peak Performance Scenario','LSC CHM','SLIC RGB','ERS CHM','SLIC CHM','RF-SLIC','GPR-SLIC','SNIC CHM','FontSize',20)
ylabel('Boundary Accuracy','FontSize',24)
xlabel('Average Size of the Superpixels in Hectares','FontSize',24)
set(gca,'FontSize',24)
xlim([0.2 1])



figure;
hold on
vq1=interp1(numzer1,specifity1,interval,'linear');
plot(interval,vq1,'-.','Color', colorstring(7),'LineWidth',3)
hold on

vq3=interp1(numzer3,specifity3,interval,'linear');
plot(interval,vq3,'-.','Color', [192/255 192/255 192/255],'LineWidth',3)
hold on

vq=interp1(numzer11,specifity11,interval,'linear');
plot(interval,vq,'Color', [69/255 139/255 0/255],'LineWidth',3)
hold on

vq2=interp1(numzer2,specifity2,interval,'linear');
plot(interval,vq2,'Color', colorstring(1),'LineWidth',3)
hold on
vq4=interp1(numzer4,specifity4,interval,'linear');
plot(interval,vq4,'Color', colorstring(2),'LineWidth',3)
hold on
vq5=interp1(numzer5,specifity5,interval,'linear');
plot(interval,vq5,'Color', colorstring(6),'LineWidth',3)
hold on
vq6=interp1(numzer6,specifity6,interval,'linear');
plot(interval,vq6,'Color', colorstring(3),'LineWidth',3)
hold on
vq7=interp1(numzer7,specifity7,interval,'linear');
plot(interval,vq7,'Color', colorstring(4),'LineWidth',3)
hold on
vq10=interp1(numzer10,specifity10,interval,'linear');
plot(interval,vq10,'Color', colorstring(5),'LineWidth',3)
plot(numzer2,specifity2,'k*','MarkerSize',24,'MarkerFaceColor','k')
plot(numzer4,specifity4,'bdiamond','MarkerSize',12,'MarkerFaceColor','b')
plot(numzer5,specifity5,'chexagram','MarkerSize',12,'MarkerFaceColor','c')
plot(numzer6,specifity6,'gsquare','MarkerSize',12,'MarkerFaceColor','g')
plot(numzer7,specifity7,'rpentagram','MarkerSize',12,'MarkerFaceColor','r')
plot(numzer10,specifity10,'yo','MarkerSize',12,'MarkerFaceColor','y')
plot(numzer11,specifity11,'g^','MarkerSize',12,'MarkerFaceColor',[69/255 139/255 0/255])

colorstring = 'kbgrycm';
legend('Lowest Performance Scenario','Peak Performance Scenario','LSC CHM','SLIC RGB','ERS CHM','SLIC CHM','RF-SLIC','GPR-SLIC','SNIC CHM','FontSize',20)
ylabel('Boundary Specificity','FontSize',24)
xlabel('Average Size of the Superpixels in Hectares','FontSize',24)
set(gca,'FontSize',24)
xlim([0.2 1])






figure;
vq1=interp1(numzer1,xa99,interval,'linear');
plot(interval,vq1,'-.','Color', colorstring(7),'LineWidth',3)
hold on

vq3=interp1(numzer3,xxa99,interval,'linear');
plot(interval,vq3,'-.','Color', [192/255 192/255 192/255],'LineWidth',3)
hold on
vq=interp1(numzer11,xxxa99,interval,'linear');
plot(interval,vq,'Color', [69/255 139/255 0/255],'LineWidth',3)
hold on

vq2=interp1(numzer2,a22,interval,'linear');
plot(interval,vq2,'Color', colorstring(1),'LineWidth',3)
hold on
vq4=interp1(numzer4,a44,interval,'linear');
plot(interval,vq4,'Color', colorstring(2),'LineWidth',3)
hold on
vq5=interp1(numzer5,a55,interval,'linear');
plot(interval,vq5,'Color', colorstring(6),'LineWidth',3)
hold on
vq6=interp1(numzer6,a66,interval,'linear');
plot(interval,vq6,'Color', colorstring(3),'LineWidth',3)
hold on
vq7=interp1(numzer7,a77,interval,'linear');
plot(interval,vq7,'Color', colorstring(4),'LineWidth',3)
hold on
vq10=interp1(numzer10,a10,interval,'linear');
plot(interval,vq10,'Color', colorstring(5),'LineWidth',3)
plot(numzer2,a22,'k*','MarkerSize',24,'MarkerFaceColor','k')
plot(numzer4,a44,'bdiamond','MarkerSize',12,'MarkerFaceColor','b')
plot(numzer5,a55,'chexagram','MarkerSize',12,'MarkerFaceColor','c')
plot(numzer6,a66,'gsquare','MarkerSize',12,'MarkerFaceColor','g')
plot(numzer7,a77,'rpentagram','MarkerSize',12,'MarkerFaceColor','r')
plot(numzer10,a10,'yo','MarkerSize',12,'MarkerFaceColor','y')
plot(numzer11,xxxa99,'g^','MarkerSize',12,'MarkerFaceColor',[69/255 139/255 0/255])

colorstring = 'kbgrycm';
legend('Lowest Performance Scenario','Peak Performance Scenario','LSC CHM','SLIC RGB','ERS CHM','SLIC CHM','RF-SLIC','GPR-SLIC','SNIC CHM','FontSize',20)
ylabel('Undersegmentation Error','FontSize',24)
xlabel('Average Size of the Superpixels in Hectares','FontSize',24)
set(gca,'FontSize',24)
xlim([0.2 1])

