function newImage = saveDepth(depthType, option1, option2, bits, img, pathDir, subfolder, name, ext)

dir_path = fullfile(pathDir,subfolder);
img_path = fullfile(pathDir,subfolder,strcat(name,'.',ext));
if ~exist(dir_path, 'dir')
    mkdir(dir_path);
end
%SAVEDEPTH
%   save depth with the desired option
switch depthType
    case 'focus'
        newImage = saveDepthFocus(img, option1, option2, bits);
        imwrite(newImage ,img_path)
    case 'normal'
        switch bits
            case '8bits'
                newImage = uint8(255.0 * img / 10.0);
            case '16bits'
                newImage = uint16(65535.0 * img / 10.0);
        end
        imwrite(newImage ,img_path)
    case 'HHA'
        % depth rendering in HHA from Gupta
        warning('HHA depthType not defined here : look at depthRcnn toolbox.')
    case 'jet'
        newImage = uint8(255.0 * img / 10.0);
        imwrite(newImage, jet, img_path)
    case 'jet_focus'
        newImage = saveDepthFocus(img, option1, option2, bits);
        imwrite(newImage, jet, img_path)
    case 'cubehelix'
        Map_CUBEHELIX = colormap(CubeHelix(256,1,-1.5,2,1.0));
        newImage = uint8(255.0 * img / 10.0);
        imwrite(newImage, Map_CUBEHELIX, img_path)
    case 'cubehelix_focus'
        Map_CUBEHELIX = colormap(CubeHelix(256,1,-1.5,2,1.0));
        newImage = saveDepthFocus(img, option1, option2, bits);
        imwrite(newImage, Map_CUBEHELIX, img_path)
    case 'histeqRandom'
        switch bits
            case '8bits'
                newImage = uint8(255.0 * img / 10.0);
                newImageWOartifact = newImage;
                random_image = uint8(255.0*rand([size(newImage,1),size(newImage,2)]));
                newImageWOartifact(newImage==0) = random_image(newImage==0);
                newImageWOartifactHisteq = histeq(newImageWOartifact);
            case '16bits'
                newImage = uint16(65535.0 * img / 10.0);
                newImageWOartifact = newImage;
                random_image = uint16(65535.0*rand([size(newImage,1),size(newImage,2)]));
                newImageWOartifact(newImage==0) = random_image(newImage==0);
                newImageWOartifactHisteq = histeq(newImageWOartifact);        
        end
        imwrite(newImageWOartifactHisteq, img_path)
    case 'histeqBack'
        switch bits
            case '8bits'
                newImage = uint8(255.0 * img / 10.0);
                newImage(newImage==0) = 255;
                newImage = histeq(newImage); 
            case '16bits'
                newImage = uint16(65535.0 * img / 10.0);
                newImage(newImage==0) = 65535;
                newImage = histeq(newImage);        
        end
        imwrite(newImage, img_path)        
    case 'histeqFront'
        switch bits
            case '8bits'
                newImage = uint8(255.0 * img / 10.0);
                newImage(newImage==0) = 0;
                newImage = histeq(newImage); 
            case '16bits'
                newImage = uint16(65535.0 * img / 10.0);
                newImage(newImage==0) = 0;
                newImage = histeq(newImage);        
        end
        imwrite(newImage, img_path)  
    otherwise
        warning('Unexpected depth type. No saving.')
end



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

