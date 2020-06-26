img = im2double(imread('lena.jpg'));

[magnitude, orientation] = sobel_feature(img);

threshold = 0.3;
e = magnitude > threshold;

e1 = img;
e2 = img;

figure, imshow(img);
figure, imshow(e1); title('sobel edge');

figure, imshow(e2); title('canny edge');