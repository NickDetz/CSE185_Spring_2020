%name = 'baboon';
name = 'checkboard';
%name = 'cameraman';

I = im2double(imread(sprintf('%s.png', name)));

sigma1 = 1;
sigma2 = 2;
alpha = 0.04;
R_threshold = 1e-5 * 5;


[corner_x, corner_y] = Harris_cornor_detector(I, sigma1, sigma2, alpha, R_threshold);


figure, imshow(I); hold on;
plot(corner_x, corner_y, 'ro');

h = gcf; 

