%name = 'lines';
%name = 'hill';
name = 'bridge';
img = imread(sprintf('%s.png', name));

edge_map = edge(rgb2gray(img), 'canny', 0.1, 3);
figure, imshow(edge_map);


[m,b] = hough_transform(edge_map);
x = 1:size(img,2);
y = m*x+b;

subplot(2,2,1);
imshow(img); title('my implement(mb)');hold on;
plot(x,y, 'LineWidth', 4, 'Color' , 'red');

h = gcf;

 

[r, theta] = hough_transform_polar(edge_map);
x = 1:size(img, 2);
y =  -(cos(theta)/sin(theta)) * x + (r / sin(theta));
figure, imshow(img); title('Your implementation (polar)'); hold on;
plot(x, y, 'LineWidth', 4, 'Color', 'blue');
h = gcf;

