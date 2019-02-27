list=textread('curry_image_url_list.txt','%s');
OUTDIR='../images/curry';
mkdir(OUTDIR);
for i=1:size(list,1)
  fname=strcat(OUTDIR,'/',num2str(i,'%04d'),'.jpg');
  websave(fname,list{i});
end
