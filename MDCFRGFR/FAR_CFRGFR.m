function F = FAR_CFRGFR_hide(imagePath,QF)

I_STRUCT = jpeg_read(imagePath);
%% Set parameters
T = 4;
%% Decompress to spatial domain
fun = @(x)x.data .*I_STRUCT.quant_tables{1};
I_spatial = blockproc(I_STRUCT.coef_arrays{1},[8 8],fun);
fun=@(x)idct2(x.data);
I_spatial = blockproc(I_spatial,[8 8],fun)+128;
[m,n]=size(I_spatial); 



load cor_index_BOWS_CFRGFR_sec.mat;
[index,num] = creat_index(cor_index_sec);
load NR_BOWS_CFRGFR_sec.mat;
F = data_process_5(I_spatial,NR_sec,QF,num);


% load cor_index_BOSS_CFRGFR_sec.mat
% [index,num] = creat_index(cor_index_sec);
% load NR_BOSS_CFRGFR_sec.mat
% F = data_process_5(I_spatial,NR_sec,QF,num);

F1=GFR(imagePath,QF,index);
F=[F F1];

end
