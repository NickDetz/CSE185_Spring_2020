%%%task 1

img = im2double (imread('lena.jpg'));

ratio1 = 0.1;
[low_pass_img1, high_pass_img1] = separate_frequency(img, ratio1);


imwrite(low_pass_img1 , 'lena_low_0.1.jpg');
imwrite(high_pass_img1 + 0.5,  'lena_high_0.1.jpg');

ratio2 = 0.2;
[low_pass_img2, high_pass_img2] = separate_frequency(img, ratio2);

imwrite(low_pass_img2, 'lena_low_0.2.jpg');
imwrite(high_pass_img2, 'lena_high_0.2.jpg');


%%%%% task 2
name1='marilyn.jpg';
name2='einstein.jpg';
img1=im2double(imread(name1));
img2=im2double(imread(name2));
ratio=.03;

img_merg = hybrid_image(img1,img2,ratio);

%%imshow(img_merg);
%%figure, imshow(img_merg);
imwrite(img_merg, 'hybrid_2.jpg');

name='new_york.jpg';
%name = 'flowers.jpg';
img_v=im2double(imread(name));

new = Visualization(img_v);



