clc;
close all;

y=imread('cameraman.tif');
y = im2double(y);
figure,imshow(y);

PSF = fspecial('disk', 8);

yblur = conv2(y,PSF);
figure,imshow(yblur);

%wiener deconv
x = deconvwnr(yblur, PSF, 0.005);
figure, imshow(x)

%blind deconv
psf2 = fspecial('disk', 5.4);
x = deconvblind(yblur, PSF, 18);
figure, imshow(x)
