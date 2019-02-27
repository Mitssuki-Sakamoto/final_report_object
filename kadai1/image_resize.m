n=0; list={};
IMAGE_SIZE =  250*200;
  LIST={'soba' 'curry' 'fried_rice' 'white_rice'};
  DIR0='/home1/y2016/s1610290/final_report_object/images/';
  for i=1:length(LIST)
    DIR=strcat(DIR0,LIST(i),'/');
    W=dir(DIR{:});

    for j=1:102
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        %fprintf('[%d] %s\n',n,fn);
        list={list{:} fn};
        im = imread(fn);
        im_size = size(im,1) * size(im, 2);
         b = IMAGE_SIZE/im_size;
        im_resize = imresize(im, b);
        OUTDIR = strcat(DIR0 , 'resize_',LIST(i));
        fname=strcat(OUTDIR,'/',num2str(n,'resize_%04d'),'.jpg');
        imwrite(im_resize, char(fname));
      end
    end
  end
  
  
  
  
  
   
  
