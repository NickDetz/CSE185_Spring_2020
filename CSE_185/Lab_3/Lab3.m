image1 = im2double(imread('lena.jpg'));

H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; 
V = [1, 0, -1; 2, 0, -2; 1, 0, -1]; 

image_sobel = Sobel_filter(image1, H);
figure, imshow(image_sobel);
imwrite(image_sobel, 'sobel_y.jpg');

image_sobel_2 = Sobel_filter(image1, V);
figure, imshow(image_sobel_2);
imwrite(image_sobel_2, 'sobel_x.jpg');

