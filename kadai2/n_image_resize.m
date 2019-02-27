n=0; list={};
IMAGE_SIZE =  250*200;
  DIR0='/usr/local/class/object/bgimg';
  DIR1='/home1/y2016/s1610290/final_report_object/images/';
    DIR=strcat(DIR0,'/');
    W=dir(DIR);

    for j=1:502
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR,W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        list={list{:} fn};
        im = imread(fn);
        im_size = size(im,1) * size(im, 2);
         b = IMAGE_SIZE/im_size;
        im_resize = imresize(im, b);
        OUTDIR = strcat(DIR1 , 'resize_','negative');
        %mkdir(OUTDIR);
        fname=strcat(OUTDIR,'/',num2str(n,'resize_%04d'),'.jpg');
        imwrite(im_resize, char(fname));
      end
    end