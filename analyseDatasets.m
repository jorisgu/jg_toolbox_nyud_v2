%% Loading
% clear all;close all;clc;
addpath('/c16/THESE.JORIS/matlab_toolbox/colorspace')
%nyudv2_path = '/data/workspace/datasets/NYUD_V2/';
nyudv2_path = '/c16/THESE.JORIS/datasets/NYUD_V2/';
load(fullfile(nyudv2_path,'mat','images.mat'))
load(fullfile(nyudv2_path,'mat','rawDepths.mat'))
load(fullfile(nyudv2_path,'mat','depths.mat'))
load(fullfile(nyudv2_path,'mat','labels.mat'))
load(fullfile(nyudv2_path,'mat','instances.mat'))
load(fullfile(nyudv2_path,'mat','names.mat'))


%% Make dictionnary between a class and its metaclass
load(fullfile(nyudv2_path,'mat','classMapping40.mat'))
mapping = containers.Map(allClassName,className(mapClass));


data_path = fullfile(nyudv2_path,'data');


nb_image = 1449;%size(rawDepths,3);

repartitionLabels894 = containers.Map;
repartitionLabels40 = containers.Map;
for k=1:length(names)
    repartitionLabels894(names{k}) = 0;
    repartitionLabels40(mapping(names{k})) = 0;
end


% %% Make dictionnary between a class and its metaclass
load(fullfile(nyudv2_path,'mat','classMapping40.mat'))
mapping = containers.Map(allClassName,className(mapClass));

%% Loop


for jj = 1:length(testGupta)
    
    ii = testGupta(jj);
    disp(strcat('Processing image n°', num2str(ii), '/', num2str(nb_image)))
    
    a_rgb = images(:,:,:,ii);
    a_d_raw = rawDepths(:,:,ii);
    a_d = depths(:,:,ii);
    a_label = labels(:,:,ii);
    a_instance = instances(:,:,ii);
    a_name = sprintf('%04d', ii);
    a_extension = 'png';
    
    
    [a_BB,a_labels] = getInstanceBB(a_label, a_instance);
    
    for k=1:length(a_BB)
        repartitionLabels894(names{a_labels(k)}) = repartitionLabels894(names{a_labels(k)}) + 1 ;
        repartitionLabels40(mapping(names{a_labels(k)})) = repartitionLabels40(mapping(names{a_labels(k)})) + 1;
    end
    
end



bar( cell2mat( values(repartitionLabels40) ) )
set(gca,'XTick',[1:length(keys(repartitionLabels40))])
set(gca,'xticklabel', keys(repartitionLabels40))