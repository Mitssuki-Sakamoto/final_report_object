n=0; list={};
  LIST={'resize_soba' 'resize_curry' 'resize_fried_rice' 'resize_white_rice'};
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
      end
    end
  end
  save('list.mat','list')