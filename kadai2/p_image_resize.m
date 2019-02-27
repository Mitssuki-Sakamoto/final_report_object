n=0; list={};
IMAGE_SIZE =  250*200;
  LIST={'katsudon_relevance' 'katsudon_lastest'};
  DIR0='/home1/y2016/s1610290/final_report_object/images/';
  
  
    DIR=strcat(DIR0,LIST(1),'/');
    W=dir(DIR{:});

    for j=1:102
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        list={list{:} fn};
        im = imread(fn);
        im_size = size(im,1) * size(im, 2);
         b = IMAGE_SIZE/im_size;
        im_resize = imresize(im, b);
        OUTDIR = strcat(DIR0 , 'resize_',LIST(1));
        fname=strcat(OUTDIR,'/',num2str(n,'resize_%04d'),'.jpg');
        imwrite(im_resize, char(fname));
      end
    end
    
    DIR=strcat(DIR0,LIST(2),'/');
    W=dir(DIR{:});
    for j=1:300
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        list={list{:} fn};
        im = imread(fn);
        im_size = size(im,1) * size(im, 2);
         b = IMAGE_SIZE/im_size;
        im_resize = imresize(im, b);
        OUTDIR = strcat(DIR0 , 'resize_',LIST(2));
        fname=strcat(OUTDIR,'/',num2str(n,'resize_%04d'),'.jpg');
        imwrite(im_resize, char(fname));
      end
    end
    
    
 