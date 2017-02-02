%% Loading
% clear all;close all;clc;
% addpath('/c16/THESE.JORIS/matlab_toolbox/colorspace_toolbox')
% %nyudv2_path = '/data/workspace/datasets/NYUD_V2/';
% nyudv2_path = '/c16/THESE.JORIS/datasets/NYUD_V2/';
% load(fullfile(nyudv2_path,'mat','images.mat'))
% load(fullfile(nyudv2_path,'mat','rawDepths.mat'))
% load(fullfile(nyudv2_path,'mat','depths.mat'))
% load(fullfile(nyudv2_path,'mat','labels.mat'))
% load(fullfile(nyudv2_path,'mat','instances.mat'))
% load(fullfile(nyudv2_path,'mat','names.mat'))
%
%
% matlab_toolbox = '/c16/THESE.JORIS/matlab_toolbox/';
% dataset_path = '/c16/THESE.JORIS/datasets';
%
%
% addpath(fullfile(matlab_toolbox,'jg_toolbox_nyud_v2'),fullfile(matlab_toolbox,'colorspace_toolbox'));
%
% data_path = fullfile(nyudv2_path,'data');
%
%
% nb_image = 1449;%size(rawDepths,3);
%
%
% Map_CUBEHELIX = colormap(CubeHelix(256,1,-1.5,2,1.0));
%
% close all;
Map_jet = jet;
%% Loop
counter=0;
averageTime_jet = 0;
averageTime_cubehelix = 0;
averageTime_histeq = 0;
for ii = 1:nb_image
    
    disp(strcat('Processing image n°', num2str(ii), '/', num2str(nb_image)))
    
    a_rgb = images(:,:,:,ii);
    a_d_raw = rawDepths(:,:,ii);
    a_d = depths(:,:,ii);
    a_label = labels(:,:,ii);
    a_instance = instances(:,:,ii);
    a_name = sprintf('%04d', ii);
    a_extension = 'png';
    
    newImage8bits = uint8(255.0 / 10.0 * a_d );
    newImage16bits = uint16(65535.0 /10. * a_d);
    

    
    
    tStart_cubehelix = tic;
    d_cubehelix = ind2rgb(newImage8bits, Map_CUBEHELIX);
    tElapsed_cubehelix = toc(tStart_cubehelix);
    averageTime_cubehelix = (averageTime_cubehelix*counter+tElapsed_cubehelix)/(counter+1);
    
    tStart_histeq = tic;
    d_histeq = histeq(newImage8bits);
    tElapsed_histeq = toc(tStart_histeq);
    averageTime_histeq = (averageTime_histeq*counter+tElapsed_histeq)/(counter+1);
    tStart_jet = tic;
    d_jet = ind2rgb(newImage8bits, Map_jet);
    tElapsed_jet = toc(tStart_jet);
    averageTime_jet = (averageTime_jet*counter+tElapsed_jet)/(counter+1);
    
    
    counter=counter+1;
    
    disp(strcat('######################### jet :   ',num2str(round(10000*averageTime_jet)/10),'ms | cubehelix : ',num2str(round(10000*averageTime_cubehelix)/10),'ms | histeq : ',num2str(round(10000*averageTime_histeq)/10), 'ms #########################'))
end

close all;