addpath('/usr/local/class/object/matconvnet');
addpath('/usr/local/class/object/matconvnet/matlab');
load('list.mat');
net = load('imagenet-caffe-alex.mat');
vl_setupnn;
D = [];
for i = 1:900
        im = imread(list{i}) ;
        im_ = single(im) ; % note: 0-255 range
        im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
        im_ = im_ - net.meta.normalization.averageImage ;

        res = vl_simplenn(net, im_);
        dcnnf=squeeze(res(end- 3).x);
        dcnnf=dcnnf/norm(dcnnf);
        D = [D dcnnf];
end


n = 100;
training_data = D';

data_pos = training_data(301:325,:);
data_neg = training_data(4*n + 1:9 * n,:);

  eval = training_data(1:3 * n,:);

  train_label=[ones(size(data_pos,1),1); ones(size(data_neg,1),1)*(-1)];
  train_data = [data_pos; data_neg];
  
  model = fitcsvm(train_data, train_label,'KernelFunction','linear'); 
  [predicted_label, scores] = predict(model, eval);
   
  % 降順 ('descent') でソートして，ソートした値とソートインデックスを取得します．
[sorted_score,sorted_idx] = sort(scores(:,2),'descend');

% list{:} に画像ファイル名が入っているとして，
% sorted_idxを使って画像ファイル名，さらに
% sorted_score[i](=score[sorted_idx[i],2])の値を出力します．
OUTDIR='result_25';
mkdir(OUTDIR);
FID = fopen('result_25.txt','w');
for i=1:numel(sorted_idx)
  fprintf('%s %f\n',list{sorted_idx(i)},sorted_score(i));
  fprintf(FID,'%s %.5f\n',list{sorted_idx(i)},sorted_score(i));
  if i <= 100
    fname=strcat(OUTDIR,'/',num2str(i,'%04d'),'.jpg');
    im = imread(list{i});
    imwrite(im ,char(fname));
  end
end
fclose(FID);