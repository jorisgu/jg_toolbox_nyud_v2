clc;clear all;close all;

data_path = '/data/workspace/datasets/NYUD_V2/data';
GuptaSetsPath = '/home/jogue/workspace/rcnn-depth/eccv14-data/benchmarkData/metadata';
load(fullfile(GuptaSetsPath,'eccv14-splits.mat'))
sets_path = fullfile(data_path ,'sets');
if ~exist(sets_path, 'dir')
    mkdir(sets_path);
end

indice_Test = test - 5000;
indice_Val = val - 5000;
indice_TrainOnly = train - 5000;

fileID = fopen(fullfile(sets_path,'testGupta.txt'),'w');
for ii = 1:numel(indice_Test)
  num_image = indice_Test(ii);
  fprintf(fileID,'%04d\n', num_image);
end
fclose(fileID);



fileID = fopen(fullfile(sets_path,'valGupta.txt'),'w');
for ii = 1:numel(indice_Val)
  num_image = indice_Val(ii);
  fprintf(fileID,'%04d\n', num_image);
end
fclose(fileID);


fileID = fopen(fullfile(sets_path,'trainGupta.txt'),'w');
for ii = 1:numel(indice_TrainOnly)
  num_image = indice_TrainOnly(ii);
  fprintf(fileID,'%04d\n', num_image);
end
fclose(fileID);


fileID = fopen(fullfile(sets_path,'trainvalGupta.txt'),'w');
for ii = 1:numel(indice_TrainOnly)
  num_image = indice_TrainOnly(ii);
  fprintf(fileID,'%04d\n', num_image);
end
for ii = 1:numel(indice_Val)
  num_image = indice_Val(ii);
  fprintf(fileID,'%04d\n', num_image);
end
fclose(fileID);

% 
% for jj = 1:nb_image
%     if jj<=nb_imageTest
%     ii = imagesPermutation(jj);
%     a_name = sprintf('%04d', ii);
% end

% fileID = fopen('celldata.dat','w');
% formatSpec = '%s %d %2.1f %s\n';
% [nrows,ncols] = size(C);
% for row = 1:nrows
%     fprintf(fileID,formatSpec,C{row,:});
% end
% fclose(fileID);% fileID = fopen('celldata.dat','w');
% formatSpec = '%s %d %2.1f %s\n';
% [nrows,ncols] = size(C);
% for row = 1:nrows
%     fprintf(fileID,formatSpec,C{row,:});
% end
% fclose(fileID);