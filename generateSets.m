clc;clear all;close all;

data_path = '/data/workspace/datasets/NYUD_V2/data';
% load('/c16/THESE.JORIS/datasets/NYUD_V2/mat/labels.mat')
% nb_image = size(labels,3);
nb_image = 1449;

percentageTest = 20.0;
nb_imageTest = round(percentageTest /100.0 * nb_image);
nb_imageTrain = nb_image - nb_imageTest;

percentageValidation = 10; % (val is part of train)
nb_imageVal = round(percentageValidation/100.0 * nb_imageTrain);

disp(['Number of Images : ' num2str(nb_image)])
disp(['----------- test : ' num2str(nb_imageTest)])
disp(['---------- train : ' num2str(nb_imageTrain)])

disp(' Train repartition : ')
disp(['------- Only train : ' num2str(nb_imageTrain-nb_imageVal)])
disp(['-------- Only eval : ' num2str(nb_imageVal)])


if ~exist('/data/workspace/datasets/NYUD_V2/mat/imagesPermutation.mat','file')
    disp('New permutation')
    imagesPermutation = randperm(nb_image);
    save('/data/workspace/datasets/NYUD_V2/mat/imagesPermutation.mat', 'imagesPermutation')
else
    disp('Loading old permutation')
    load('/data/workspace/datasets/NYUD_V2/mat/imagesPermutation.mat');
end


set_test = cell(nb_imageTest,1);
set_trainOnly = cell(nb_imageTrain-nb_imageVal,1);
set_val = cell(nb_imageVal,1);

indice_Test = 1:nb_imageTest;
indice_Val = nb_imageTest+1:nb_imageTest+nb_imageVal;
indice_TrainOnly = nb_imageTest+nb_imageVal+1:nb_imageTest+nb_imageTrain;


sets_path = fullfile(data_path ,'sets');
if ~exist(sets_path, 'dir')
    mkdir(sets_path);
end

fileID = fopen(fullfile(sets_path,'test.txt'),'w');
for ii = 1:numel(indice_Test)
  num_image = imagesPermutation(indice_Test(ii));
  fprintf(fileID,'%04d\n', num_image);
end
fclose(fileID);



fileID = fopen(fullfile(sets_path,'val.txt'),'w');
for ii = 1:numel(indice_Val)
  num_image = imagesPermutation(indice_Val(ii));
  fprintf(fileID,'%04d\n', num_image);
end
fclose(fileID);


fileID = fopen(fullfile(sets_path,'train.txt'),'w');
for ii = 1:numel(indice_TrainOnly)
  num_image = imagesPermutation(indice_TrainOnly(ii));
  fprintf(fileID,'%04d\n', num_image);
end
fclose(fileID);


fileID = fopen(fullfile(sets_path,'trainval.txt'),'w');
for ii = 1:numel(indice_TrainOnly)
  num_image = imagesPermutation(indice_TrainOnly(ii));
  fprintf(fileID,'%04d\n', num_image);
end
for ii = 1:numel(indice_Val)
  num_image = imagesPermutation(indice_Val(ii));
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