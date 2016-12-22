%% Loading
clear all;close all;clc;
addpath('/c16/THESE.JORIS/matlab_toolbox/colorspace')
%nyudv2_path = '/data/workspace/datasets/NYUD_V2/';
nyudv2_path = '/c16/THESE.JORIS/datasets/NYUD_V2/';
load(fullfile(nyudv2_path,'mat','images.mat'))
load(fullfile(nyudv2_path,'mat','rawDepths.mat'))
load(fullfile(nyudv2_path,'mat','depths.mat'))
load(fullfile(nyudv2_path,'mat','labels.mat'))
load(fullfile(nyudv2_path,'mat','instances.mat'))
load(fullfile(nyudv2_path,'mat','names.mat'))


data_path = fullfile(nyudv2_path,'data');


nb_image = 1449;%size(rawDepths,3);




%% Make dictionnary between a class and its metaclass
load(fullfile(nyudv2_path,'mat','classMapping40.mat'))
mapping = containers.Map(allClassName,className(mapClass));

%% Loop
for ii = 1:nb_image
    
    disp(strcat('Processing image n°', num2str(ii), '/', num2str(nb_image)))
    
    a_rgb = images(:,:,:,ii);
    a_d_raw = rawDepths(:,:,ii);
    a_d = depths(:,:,ii);
    a_label = labels(:,:,ii);
    a_instance = instances(:,:,ii);
    a_name = sprintf('%04d', ii);
    a_extension = 'png';
    
    
    %% label gupta
    
    a_label_nonzeros = a_label;
    a_label_nonzeros(a_label==0)=1;
    a_label_gupta = arrayfun(@(x) mapClass(x),a_label_nonzeros );
    a_label_gupta(a_label==0)=0;
    saveIt( a_label_gupta, data_path, 'labels_gupta', a_name, a_extension)

    %% rgb
    %showIt(a_rgb);
    %saveIt( a_rgb, data_path, 'rgb_raw_8bits', a_name, a_extension)
    %a_hsv = rgb2hsv(a_rgb);
    
    %     for jj = 90:-10:10
    %         saveIt( changeLuminosity(a_rgb,jj), data_path, strcat('rgb_i_',int2str(jj),'_8bits'), a_name, a_extension)
    %     end

    %% raw depth
    %a_d_raw_show = showIt(a_d_raw, false);
    
    
    
    % jet (colorised)
    %     saveDepth('jet', '', '', '', a_d_raw, data_path, 'd_raw_jet_8bits', a_name, a_extension);
    %     saveDepth('jet_focus', 0.7133, 5.2044, '8bits', a_d_raw, data_path, 'd_raw_jet_focus_8bits', a_name, a_extension);
    
    % cubehelix (colorised)
    %     saveDepth('cubehelix', '', '', '', a_d_raw, data_path, 'd_raw_cubehelix_8bits', a_name, a_extension);
    %     saveDepth('cubehelix_focus', 0.7133, 5.2044, '8bits', a_d_raw, data_path, 'd_raw_cubehelix_focus_8bits', a_name, a_extension);
    
    % focus (remove far distanced information)
    %     saveDepth('focus', 0.7133, 5.2044, '8bits', a_d_raw, data_path, 'd_raw_focus_8bits', a_name, a_extension);
    %     saveDepth('focus', 0.7133, 5.2044, '16bits', a_d_raw, data_path, 'd_raw_focus_16bits', a_name, a_extension);
    
    % normal
    %     saveDepth('normal', '', '', '8bits', a_d_raw, data_path, 'd_raw_normal_8bits', a_name, a_extension);
    %     saveDepth('normal', '', '', '16bits', a_d_raw, data_path, 'd_raw_normal_16bits', a_name, a_extension);
    
    % histeq
    %      saveDepth('histeqRandom', '', '', '8bits', a_d_raw, data_path, 'd_raw_histeqRandom_8bits', a_name, a_extension);
    %      saveDepth('histeqRandom', '', '', '16bits', a_d_raw, data_path, 'd_raw_histeqRandom_16bits', a_name, a_extension);
    %
    %      saveDepth('histeqBack', '', '', '8bits', a_d_raw, data_path, 'd_raw_histeqBack_8bits', a_name, a_extension);
    %      saveDepth('histeqBack', '', '', '16bits', a_d_raw, data_path, 'd_raw_histeqBack_16bits', a_name, a_extension);
    %
    %      saveDepth('histeqFront', '', '', '8bits', a_d_raw, data_path, 'd_raw_histeqFront_8bits', a_name, a_extension);
    %      saveDepth('histeqFront', '', '', '16bits', a_d_raw, data_path, 'd_raw_histeqFront_16bits', a_name, a_extension);
    
    %% depth
    %     a_d_show = showIt(a_d, false);
    %     % normalised
    %     saveIt( a_d_show, data_path, 'd_normalised', a_name, a_extension)
    
    %     %% instances
    %     a_i_show = showIt(a_instance,false);
    %     saveIt( a_i_show, data_path, 'instances', a_name, a_extension)
    %
    %     %% labels
    %     a_l_show = showIt(a_label,false);
    %     saveIt( a_l_show, data_path, 'labels', a_name, a_extension)
    
    %% annotations
    %
    %     [a_BB,a_labels] = getInstanceBB(a_label, a_instance);
    %
    %     mystruct.annotation.folder = 'data';
    %     mystruct.annotation.filename = strcat(a_name,'.',a_extension);
    %     mystruct.annotation.source.database = 'The NYUD V2 database';
    %     mystruct.annotation.source.annotation = 'NYUD V2';
    %     mystruct.annotation.source.image = 'NYU';
    %     mystruct.annotation.owner = 'Nathan Silberman';
    %     mystruct.annotation.size.width = size(a_d,2);
    %     mystruct.annotation.size.height = size(a_d,1);
    %     mystruct.annotation.size.depth = size(a_d,3);
    %     mystruct.annotation.segmented = 0;
    %
    %     for k=1:length(a_BB)
    %         mystruct.annotation.object(k).name = mapping(names{a_labels(k)});
    %         mystruct.annotation.object(k).pose = 'unknown';
    %         mystruct.annotation.object(k).truncated = -1;
    %         mystruct.annotation.object(k).difficult = 0;
    %         mystruct.annotation.object(k).bndbox.xmin = round(a_BB{k}(1));
    %         mystruct.annotation.object(k).bndbox.ymin = round(a_BB{k}(2));
    %         mystruct.annotation.object(k).bndbox.xmax = round(a_BB{k}(1))+a_BB{k}(3)-1;
    %         mystruct.annotation.object(k).bndbox.ymax = round(a_BB{k}(2))+a_BB{k}(4)-1;
    %     end
    %
    %     xml_path = fullfile(data_path,'Annotations_40');
    %     xml_filename = strcat(a_name,'.xml');
    %     struc2xml(mystruct, xml_path, xml_filename)
end