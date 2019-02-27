addpath('/usr/local/class/object/matconvnet');
addpath('/usr/local/class/object/matconvnet/matlab');
load('list.mat');
net = load('imagenet-caffe-alex.mat');
vl_setupnn;
D = [];
for i = 1:200
        im = imread(list{i + 200}) ;
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

data_pos = training_data(1:n,:);
data_neg = training_data(n + 1:2 * n,:);

cv=5;
idx=[1:n];
accuracy=[];

% idx番目(idxはcvで割った時の余りがi-1)が評価データ
% それ以外は学習データ
for i=1:cv 
  eval_pos =data_pos(find(mod(idx,cv)==(i-1)),:);
  train_pos=data_pos(find(mod(idx,cv)~=(i-1)),:);
  eval_neg =data_neg(find(mod(idx,cv)==(i-1)),:);
  train_neg=data_neg(find(mod(idx,cv)~=(i-1)),:);

  eval=[eval_pos ; eval_neg];
  train=[train_pos ; train_neg];


  eval_label =[ones(size(eval_pos,1),1); ones(size(eval_neg,1),1)*(-1)];
  train_label=[ones(size(train_pos,1),1); ones(size(train_neg,1),1)*(-1)];
  
  
  model = fitcsvm(train, train_label,'KernelFunction','rbf','KernelScale','auto'); 
  [predicted_label, scores] = predict(model, eval);
   
  ac = numel(find(eval_label==predicted_label))/numel(eval_label);
  
  accuracy=[accuracy ac];
  
end

fprintf('accuracy: %f\n',mean(accuracy))