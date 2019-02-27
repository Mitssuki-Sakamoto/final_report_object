list=textread('white_rice_image_url_list.txt','%s');
OUTDIR='../images/white_rice';
mkdir(OUTDIR);
for i=1:size(list,1)
  fname=strcat(OUTDIR,'/',num2str(i,'%04d'),'.jpg');
  websave(fname,list{i});
end