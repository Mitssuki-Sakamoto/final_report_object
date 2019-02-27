n=0; list={};
  LIST={'resize_soba' 'resize_curry' 'resize_fried_rice' 'resize_white_rice'};
  DIR0='/home1/y2016/s1610290/final_report_object/images/';  
  histgram=[];
  for i=1:length(LIST)
    DIR=strcat(DIR0,LIST(i),'/');
    W=dir(DIR{:});
    
    for j=1:102
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        X = imread(fn);
        RED=X(:,:,1); GREEN=X(:,:,2); BLUE=X(:,:,3);
        X64=floor(double(RED)/64) *4*4 + floor(double(GREEN)/64) *4 + floor(double(BLUE)/64);
        X64_vec=reshape(X64,1,numel(X64));
        h=histc(X64_vec,[0:63]);
        h = h / sum(h);
        histgram=[histgram; h];
      end
    end
  end
  
  save('hist.mat','histgram');
    
