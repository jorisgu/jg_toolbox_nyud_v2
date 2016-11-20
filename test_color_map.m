close all;
% Gray = rand(200, 200);


ii = 1
a_rgb = images(:,:,:,ii);
a_d_raw = rawDepths(:,:,ii);
a_d = depths(:,:,ii);
a_label = labels(:,:,ii);
a_instance = instances(:,:,ii);
a_name = sprintf('%04d', ii);
a_extension = 'png';




figure(1)





Gray = showIt(a_d_raw, false);
imshow(Gray)


RGB1 = cat(3, Gray, Gray, Gray);  % information stored in intensity
RGB2 = Gray;
RGB2(end, end, 3) = 0;  % All information in red channel
GrayIndex = uint8(floor(Gray * 255));
Map_JET       = jet(255);
RGB3      = ind2rgb(GrayIndex, Map_JET);

% Map_CUBEHELIX = colormap(CubeHelix(256,0.5,-1.5,1.2,1.0));


RGB4      = ind2rgb(GrayIndex, Map_CUBEHELIX);


colormap(Map_CUBEHELIX ); % apply new colormap
colormap(Map_JET);
colorbar();


% The input values are:
%   nlev  = number of colour steps
%   start = colour to begin at (1=red, 2=green, 3=red;
%           e.g. 0.5=purple)
%   rots  = number of rotations
%   hue   = hue intensity scaling, 0=B&W
%   gamma = intensity correction