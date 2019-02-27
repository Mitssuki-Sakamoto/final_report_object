  load('list.mat');
  run('/usr/local/class/object/MATLAB/vlfeat/vl_setup');
  addpath('/usr/local/class/object/MATLAB/sift');
 
  vec=[];
  for i = 1:200
     [pnt,desc]=sift_rand(rgb2gray(imread(list{i})),'randn',300);
    vec = [vec desc];
  end
  [codebook1, idx]=vl_kmeans(vec,500);
  % codebook を save します．
  save('codebook1.mat','codebook1');
  
  vec=[];
  for i = 201:400
     [pnt,desc]=sift_rand(rgb2gray(imread(list{i})),'randn',300);
    vec = [vec desc];
  end
  [codebook2, idx]=vl_kmeans(vec,500);
  % codebook を save します．
  save('codebook2.mat','codebook2');
  
