%%%%% Nick Deters Lab 1 CSE 185
%%% test
img = imread('01.jpg');

%%figure, imshow(img);

%%%%imwrite(img, output.jpg);

%%%% Question 1 set Green channel to 0 and save as green.jpg

img = imread('01.jpg');
img(:,:,2) = 0;
image(img);
%%%%imwrite(img,'green.jpg');


%%%% Question 2 Convert image to gray scale

imgGrey = imread('01.jpg');
size(imgGrey);
Y = imgGrey(:,:,1)*.299 + imgGrey(:,:,2)*.587 + imgGrey(:,:,3)*.114;
%g = imgGrey(:,:,2)*.587; 
%b = imgGrey(:,:,3)*.114;

%%%imshow(Y);
 
imwrite(Y, 'grayimg.jpg');

%%%Question 3
img3 = imread('01.jpg');

img3 = imrotate(img3, 90);

%%%figure, imshow(img3);

%%%%% Question 4

I = imread('01.jpg');
[m,n] = size(I);
I = I(30:270, 100:300,:);
%%imshow(I)
imwrite(I, 'crop.jpg');


%%%% question 5 


flipimg = imread('01.jpg');
flipimg = flip(flipimg, 2);

%%%imshow(flipimg);

%%%%% Question 6

H = imread('01.jpg');
J = imread('02.jpg');
K = imread('03.jpg');
L = imread('04.jpg');

Bkgrd = zeros(300 * 2 + 10, 400* 2 + 10, 3, 'uint8');
Bkgrd(1:300, 1:400, :) = H;
Bkgrd(1:300, 410:809, :) = J;
Bkgrd(310:609, 1:400, :) = K;
Bkgrd(310:609, 410:809, :) = L;

%%%imshow(Bkgrd);

imwrite(Bkgrd, 'combine.jpg');

%%%%% Question 8

Z = imread('05.jpg.png');
A = imread('06.jpg.png');

Add = (A+Z)/2;

Add = reshape(Add, 375, 1242, 3);

imwrite(Add, 'average.jpg');

imshow(Add);






