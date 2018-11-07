function ff = FAR(imagePath,q,QM)

I_STRUCT = jpeg_read(imagePath);
%% Decompress to spatial domain
fun = @(x)x.data .*I_STRUCT.quant_tables{1};
I_spatial = blockproc(I_STRUCT.coef_arrays{1},[8 8],fun);
fun=@(x)idct2(x.data);
I_spatial = blockproc(I_spatial,[8 8],fun)+128;
[m,n]=size(I_spatial); 

%% Compute DCTR locations to be merged 1  
%  ‰»Î£∫Œﬁ
%  ‰≥ˆ£∫mergedCoordinates1  modeFeaDim1
% mergedCoordinates1 = cell(25, 1);
% for i=1:5
%     for j=1:5
%         coordinates1 = [i,j; i,10-j; 10-i,j; 10-i,10-j];
%         coordinates1 = coordinates1(all(coordinates1<9, 2), :);
%         mergedCoordinates1{(i-1)*5 + j} = unique(coordinates1, 'rows');
%     end
% end
% 
% modeFeaDim1 = numel(mergedCoordinates1)*(T+1);
%% Compute DCTR locations to be merged 2
% mergedCoordinates2 = cell(49, 1);
% for i=1:7
%     for j=1:7
%         coordinates2 = [i,j; i,14-j; 14-i,j; 14-i,14-j];
%         coordinates2 = coordinates2(all(coordinates2<13, 2), :);
%         mergedCoordinates2{(i-1)*7 + j} = unique(coordinates2, 'rows');
%     end
% end
% 
% modeFeaDim2 = numel(mergedCoordinates2)*(T+1);
       
% F = zeros(1, modeFeaDim1+modeFeaDim2, 'single');

% load NR_BOSS.mat;
% ff = MDCFR(I_spatial,NR_BOSS_sec,QM);

load NR_BOWS.mat;
ff = MDCFR(I_spatial,NR_BOWS_sec,QM);

end





















