load('bovw2.mat');
training_data = bovw2.';
n = 100;
idx=[1:n];
cv = 5;
data_pos = training_data(1:n,:);
data_neg = training_data(n + 1:2 * n,:);

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
fprintf('accuracy: %f\n',mean(accuracy));