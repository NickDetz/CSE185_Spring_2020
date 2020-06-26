%%%%% Code by Nick Deters
image = uint8(imread('01.jpg'));


Image2 = zeros(300, 400, 3, 'uint8');

Image2(25:300, 1:400, :)= image(25:300, 1:400, :);

subplot(1,2,1);
imshow(Image2);
subplot(1,2,2);
imshow(image);

Image3 = zeros(300, 400, 3, 'uint8');

theta = 60;
x0 = 400/2;
y0 = 300/2;
for y1 = 1 : 300 
    for x1 = 1 : 400
        x2 = round(cosd(theta)*(x1-x0) + sind(theta)*(y1 - y0) + x0);
        y2 = round(-sind(theta)*(x1-x0) + cosd(theta)*(y1-y0) + y0);
        
        if(x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            Image3(y2,x2, :) = image(y1,x1, :);
        end
    end
end

subplot(1,2,1);
imshow(Image3);
subplot(1,2,2);
imshow(image);
imwrite(Image3, 'rotate_1.jpg')

%%%%%Question 3


Image4 = zeros(300, 400, 3, 'uint8');

theta = 60;
x0 = 400/2;
y0 = 300/2;
for y1 = 1 : 300 
    for x1 = 1 : 400
        x2 = round(cosd(theta)*(x1-x0) - sind(theta)*(y1 - y0) + x0);
        y2 = round(sind(theta)*(x1-x0) + cosd(theta)*(y1-y0) + y0);
        
        if(x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            I4(y1,x1, :) = image(y2,x2, :);
        end
    end
end

subplot(1,2,1);
imshow(Image4);
subplot(1,2,2);
imshow(image);
imwrite(Image4, 'rotate_0.jpg')


