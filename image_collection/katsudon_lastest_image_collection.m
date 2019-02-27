list=textread('katsudon_lastest_url_list.txt','%s');

% websave でMATLABで画像ファイルをダウンロードしてみましょう．
% 以下を実行すると，imgdir に画像が 0001.jpg, ... としてsaveされます．

OUTDIR='../images/katsudon_lastest';
mkdir(OUTDIR);
for i=1:size(list,1)
  fname=strcat(OUTDIR,'/',num2str(i,'%04d'),'.jpg');
  websave(fname,list{i});
end