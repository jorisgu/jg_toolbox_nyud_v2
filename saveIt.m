function saveIt( img, pathDir, subfolder, name, ext)
%SAVEIT 
%   saveIt( img, '/.../NYUD_V2/data', 'rgb', '0001','jpg' )

if nargin < 5
    ext =   'png';
end
dir_path = fullfile(pathDir,subfolder);
img_path = fullfile(pathDir,subfolder,strcat(name,'.',ext));
if ~exist(dir_path, 'dir')
    mkdir(dir_path);
end

img_uint8 = uint8(img);
imwrite(img_uint8 ,img_path);
end