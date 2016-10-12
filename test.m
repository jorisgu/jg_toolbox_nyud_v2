data_path = '/c16/THESE.JORIS/datasets/NYUD_V2/dataTest';
nb_image = size(depths,3);
for ii = 1:nb_image
        
    disp(strcat('Processing image n°', num2str(ii), '/', num2str(nb_image)))
    
%     a_rgb = images(:,:,:,ii);
%     a_instance = instances(:,:,ii);
%     a_label = labels(:,:,ii);
%     a_d_raw = rawDepths(:,:,ii);
    a_d = depths(:,:,ii);
    a_name = sprintf('%04d', ii);
    a_extension = 'png';

    %% rgb
    %showIt(a_rgb);
    %saveIt( a_rgb, data_path, 'rgb', a_name, a_extension)

    %% raw depth
    %a_d_raw_show = showIt(a_d_raw, false);
    % normalised
    %saveIt( a_d_raw_show, data_path, 'd_raw_normalised', a_name, a_extension)
    %%% TODO 
    % joint (colorised)
    % focus (remove far distanced information)
    % normal 8 bits
    % normal 16 bits

    %% depth
    a_d_show = showIt(a_d, false);
    % normalised
    saveIt( a_d_show, data_path, 'd_normalised', a_name, a_extension)

    %% instances
    %a_i_show = showIt(a_instance,false);
    %saveIt( a_i_show, data_path, 'instances', a_name, a_extension)

    %% labels
    %a_l_show = showIt(a_label,false);
    %saveIt( a_l_show, data_path, 'labels', a_name, a_extension)

    %% annotations

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
%         mystruct.annotation.object(k).name = names(a_labels(k));
%         mystruct.annotation.object(k).pose = 'unknown';
%         mystruct.annotation.object(k).truncated = -1;
%         mystruct.annotation.object(k).difficult = 0;
%         mystruct.annotation.object(k).bndbox.xmin = round(a_BB{k}(1));
%         mystruct.annotation.object(k).bndbox.ymin = round(a_BB{k}(2));
%         mystruct.annotation.object(k).bndbox.xmax = round(a_BB{k}(1))+a_BB{k}(3)-1;
%         mystruct.annotation.object(k).bndbox.ymax = round(a_BB{k}(2))+a_BB{k}(4)-1;
%     end
% 
%     xml_path = fullfile(data_path,'Annotations');
%     xml_filename = strcat(a_name,'.xml');
%     struc2xml(mystruct, xml_path, xml_filename)
end