clc;clear all;close all;

data_path = '/c16/THESE.JORIS/datasets/NYUD_V2/data';
GuptaSetsPath = '/c16/THESE.JORIS/matlab_toolbox/rcnn-depth/eccv14-data/benchmarkData/metadata';
% GuptaSetsPath = '/home/jogue/workspace/rcnn-depth/eccv14-data/benchmarkData/metadata';
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


%% For intensities i_100_60
intensitiesAvailable = 60:10:100;
rangeName = 'i_100_60';

fileID = fopen(fullfile(sets_path,strcat('testGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_Test)
    num_image = indice_Test(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('valGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_Val)
    num_image = indice_Val(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('trainGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_TrainOnly)
    num_image = indice_TrainOnly(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('trainvalGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_TrainOnly)
    num_image = indice_TrainOnly(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
for ii = 1:numel(indice_Val)
    num_image = indice_Val(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

%% For intensities i_50_10
intensitiesAvailable = 10:10:50;
rangeName = 'i_50_10';

fileID = fopen(fullfile(sets_path,strcat('testGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_Test)
    num_image = indice_Test(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('valGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_Val)
    num_image = indice_Val(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('trainGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_TrainOnly)
    num_image = indice_TrainOnly(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('trainvalGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_TrainOnly)
    num_image = indice_TrainOnly(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
for ii = 1:numel(indice_Val)
    num_image = indice_Val(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

%% For intensities iAll
intensitiesAvailable = 10:10:100;
rangeName = 'i_all';

fileID = fopen(fullfile(sets_path,strcat('testGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_Test)
    num_image = indice_Test(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('valGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_Val)
    num_image = indice_Val(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('trainGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_TrainOnly)
    num_image = indice_TrainOnly(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);

fileID = fopen(fullfile(sets_path,strcat('trainvalGupta_',rangeName,'.txt')),'w');
for ii = 1:numel(indice_TrainOnly)
    num_image = indice_TrainOnly(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
for ii = 1:numel(indice_Val)
    num_image = indice_Val(ii);
    for jj = intensitiesAvailable
        fprintf(fileID,'i%d_%04d\n', [jj num_image]);
    end
end
fclose(fileID);