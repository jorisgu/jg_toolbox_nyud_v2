function a_rgb_idelta = changeLuminosity(img_rgb, lum_pourcentage)

conv_rgb2lab = 'RGB->Lab';
conv_lab2rgb = 'Lab->RGB';

img_lab = colorspace(conv_rgb2lab,double(img_rgb));
a_lab_idelta = changeLuminosityLab(img_lab, (lum_pourcentage-100)*100);

a_rgb_idelta = uint8(colorspace(conv_lab2rgb,a_lab_idelta));


%     figure(1);
%     subplot(3,2,1);
%     imshow(a_rgb)
%     subplot(3,2,2);
%     imshow(a_rgb_i90)
%     subplot(3,2,3);
%     hist(a_lab(:,:,1),mybins)
%     subplot(3,2,4);
%     hist(a_lab_i90(:,:,1),mybins)
%     subplot(3,2,5);
%     imshow(a_lab(:,:,1),[0 10000])
%     subplot(3,2,6);
%     imshow(a_lab_i90(:,:,1),[0 10000])


end

function [ img_deltated ] = changeLuminosityLab(img_lab, delta)


matrixDelta = delta*ones([size(img_lab,1),size(img_lab,2)]);

img_lab_lum = img_lab(:,:,1)+matrixDelta;
img_lab_lum(img_lab_lum>10000)=10000;
img_lab_lum(img_lab_lum<0)=0;

img_deltated = img_lab;
img_deltated(:,:,1)=img_lab_lum;
end
