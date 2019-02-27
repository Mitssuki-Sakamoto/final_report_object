n=0; list={};
  LIST={'resize_katsudon_lastest' 'resize_katsudon_relevance' 'resize_negative'};
  DIR0='/home1/y2016/s1610290/final_report_object/images/';  
  
    DIR=strcat(DIR0,LIST(1),'/');
    W=dir(DIR{:});
    
    for j=1:302
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        list={list{:} fn};
      end
    end
    
    DIR=strcat(DIR0,LIST(2),'/');
    W=dir(DIR{:});
    
    for j=1:102
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        list={list{:} fn};
      end
    end
    
    DIR=strcat(DIR0,LIST(3),'/');
    W=dir(DIR{:});
    
    for j=1:502
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        n=n+1;
        fprintf('[%d] %s\n',n,fn);
        list={list{:} fn};
      end
    end
 
  save('list.mat','list')