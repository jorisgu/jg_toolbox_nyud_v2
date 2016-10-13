function newImage = saveDepth(depthType, option1, option2, bits, img, pathDir, subfolder, name, ext)
%SAVEDEPTH
%   save depth with the desired option
switch depthType
    case 'focus'
        newImage = saveDepthFocus(img, option1, option2, bits);
    case 'normal'
        switch bits
            case '8bits'
                newImage = uint8(255.0 * img / 10.0);
            case '16bits'
                newImage = uint16(65535.0 * img / 10.0);
        end
    case 'joint'
        % depth rendering in RGB from Eitel
        warning('Joint depthType not defined yet.')
        
    otherwise
        warning('Unexpected depth type. No saving.')
end

dir_path = fullfile(pathDir,subfolder);
img_path = fullfile(pathDir,subfolder,strcat(name,'.',ext));
if ~exist(dir_path, 'dir')
    mkdir(dir_path);
end
imwrite(newImage ,img_path)

end




function newImage = saveDepthFocus(img, minRange, maxRange, bits)
%'0.7133', '5.2044'
backgroundRange = 1.05 * maxRange;

% remove out of range (make a "focus")

img(img<minRange) = backgroundRange;
img(img>maxRange) = backgroundRange;

switch bits
    case '8bits'
        newImage = uint8(255.0 * (img - minRange) / (backgroundRange-minRange));
    case '16bits'
        newImage = uint16(65535.0 * (img - minRange) / (backgroundRange-minRange));
end
end