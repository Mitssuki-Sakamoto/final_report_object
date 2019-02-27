load('hist.mat');
n = 0;
data_pos = histgram(1:100,:);
data_neg = histgram(101:200,:);
cv=5;
idx=[1:100];
accuracy=[];
for i=1:cv 
  eval_pos =data_pos(find(mod(idx,cv)==(i-1)),:);
  train_pos=data_pos(find(mod(idx,cv)~=(i-1)),:);
  eval_neg =data_neg(find(mod(idx,cv)==(i-1)),:);
  train_neg=data_neg(find(mod(idx,cv)~=(i-1)),:);

  eval=[eval_pos ; eval_neg];
  train=[train_pos ; train_neg];
 for j = 1:40
     min = 999999;
    index = 0;
    for k = 1:160
    d = sqrt(sum((eval(j,:)-train(k,:)).^2));
        if min > d
            min = d;
            index = k;
        end
    end
    if (j <= 20 && index <= 80) || (j > 20 && index > 80)
        n = n + 1;
    end
 end
 ac = n/40;
 accuracy=[accuracy ac];
 n = 0;
end

fprintf('accuracy: %f\n',mean(accuracy));
