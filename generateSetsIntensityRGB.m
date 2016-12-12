clc;clear all;close all;

basic_path = '/c16/THESE.JORIS/datasets/NYUD_V2';
data_path = fullfile(basic_path,'data');


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


if ~exist(fullfile(basic_path ,'/mat/imagesPermutation.mat'),'file')
    disp('No random permutation yet, creating a new one')
    imagesPermutation = randperm(nb_image);
    save(fullfile(basic_path ,'/mat/imagesPermutation.mat'), 'imagesPermutation')
else
    disp('Loading old random permutation')
    load(fullfile(basic_path ,'/mat/imagesPermutation.mat'));
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

%% _i_all
intensitiesAvailable = 60:10:100
rangeName = 'i_100_60';

fileID = fopen(fullfile(sets_path,strcat('test_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_Test)
  num_image = imagesPermutation(indice_Test(ii));
  for jj = intensitiesAvailable
    fprintf(fileID,'i%d_%04d\n', [jj num_image]);
  end
end
fclose(fileID);



fileID = fopen(fullfile(sets_path,strcat('val_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_Val)
  num_image = imagesPermutation(indice_Val(ii));
  for jj = intensitiesAvailable
    fprintf(fileID,'i%d_%04d\n', [jj num_image]);
  end
end
fclose(fileID);


fileID = fopen(fullfile(sets_path,strcat('train_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_TrainOnly)
  num_image = imagesPermutation(indice_TrainOnly(ii));
  for jj = intensitiesAvailable
    fprintf(fileID,'i%d_%04d\n', [jj num_image]);
  end
end
fclose(fileID);


fileID = fopen(fullfile(sets_path,strcat('trainval_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_TrainOnly)
  num_image = imagesPermutation(indice_TrainOnly(ii));
  for jj = intensitiesAvailable
    fprintf(fileID,'i%d_%04d\n', [jj num_image]);
  end
end
for ii = 1:numel(indice_Val)
  num_image = imagesPermutation(indice_Val(ii));
  for jj = intensitiesAvailable
    fprintf(fileID,'i%d_%04d\n', [jj num_image]);
  end
end
fclose(fileID);
