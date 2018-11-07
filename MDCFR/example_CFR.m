% clc;
% clear all;
addpath('./jpegtbx_1.4');
dims=25000;
ff=zeros(1,dims);
DIR= mfilename('fullpath');
i=findstr(DIR,'\');
DIR=DIR(1:i(end));
IMAGE = strcat(DIR,'1.jpg');
QF=75;
tic
if(QF==95)
    ff= FAR(IMAGE,1,1);
elseif(QF==75)
    ff= FAR(IMAGE,1,1*0.75);
end
toc

save -v7.3 ff.mat ff


