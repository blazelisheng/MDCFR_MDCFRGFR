clear
addpath('./jpegtbx_1.4');
dims=30000;
ff=zeros(1,dims);
DIR= mfilename('fullpath');
i=findstr(DIR,'\');
DIR=DIR(1:i(end));
IMAGE = strcat(DIR,'1.jpg');
QF=95;
if(QF==95)
    ff=FAR_CFRGFR(IMAGE,95);
elseif(QF==75)
    ff=FAR_CFRGFR(IMAGE,75);
end

save -v7.3 ff.mat ff





