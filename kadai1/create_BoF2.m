load('codebook2.mat');   % 最初にcodebook行列を読み込みます．
load('list.mat');
bovw2=zeros(500,200);
 for j=1:200  % 各画像についての for-loop
     [pnt,desc]=sift_rand(rgb2gray(imread(list{j + 200})),'randn',1000);
     for i=1:size(pnt,2)  % 各SIFT特徴点についての for-loop
         min = 999999;
         index = 0;
         for k=1:size(codebook2,2)
            d = sqrt(sum((desc(:,i)-codebook2(:,k)).^2));
            if min > d
                min = d;
                index = k;
            end
        end
        bovw2(index,j)=bovw2(index,j)+1; 
    end
 end
 save('bovw2.mat','bovw2');