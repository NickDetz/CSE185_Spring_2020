function [corner_x, corner_y] = Harris_cornor_detector(I, sigma1, sigma2, alpha, R_threshold);


hsize1 = 1 + 2 * ceil(sigma1 * 2);
hsize2 = 1 + 2 * ceil(sigma2 * 2);

guassian_Kernal1 = fspecial('gaussian', hsize1, sigma1);
guassian_Kernal2 = fspecial('gaussian', hsize2, sigma2);



DerX = [1,0,-1];
DerY = [1;0;-1];

Ix = imfilter(imfilter(I, guassian_Kernal1, 'replicat'), DerX, 'replicate');
Iy = imfilter(imfilter(I, guassian_Kernal2, 'replicat'), DerY, 'replicate');

subplot(2,3,1)
imshow(Ix + 0.5);
subplot(2,3,2)
imshow(Iy + 0.5);


IXx = Ix .* Ix;
IYy = Iy .* Iy;
IXY = Ix .* Iy;

SXx = imfilter(IXx, guassian_Kernal2, 'replicate');
SYy = imfilter(IYy, guassian_Kernal2, 'replicate');
SXY = imfilter(IXY, guassian_Kernal2, 'replicate');

det = (SXx .* SYy) - (SXY .* SXY);
trace = SXx + SYy;

R = det - (alpha*(trace.^2));

subplot(2,3,3)
imagesc(R); colormap jet; colorbar; axis image;


cornor_map = R > R_threshold;

subplot(2,3,4)
imshow(cornor_map);



%%%%%% extra credit

local_maxima = imregionalmax(R);


subplot(2,3,5)
imshow(local_maxima)

final_corner_map = (cornor_map & local_maxima);

[corner_y, corner_x] = find(final_corner_map);

end




function P = inregionalmax(R)
    shift_u = size(R,2);
     shift_v = size(R,1);

     for u = 1+shift_u: size(R, 2)-shift_u
         for v = 1+ shift_v: size(R, 1)-shift_v
             x1 = u - floor(shift_u/2);
             x2 = u + floor(shift_u/2);
             y1 = v - floor(shift_v/2); 
             y2 = v + floor(shift_v/2);

             P = R(y1:y2, x1:x2); 
             
             if(R > R(shift_u - 1, shift_v - 1) && ...
                R > R(shift_u - 1, shift_v) && ...
                R > R(shift_u - 1, shift_v + 1) && ...
                R > R(shift_u + 1, shift_v - 1) && ...
                R > R(shift_u + 1, shift_v) && ...
                R > R(shift_u + 1, shift_v + 1) && ...
                R > R(shift_u, shift_v - 1) && ...
                R > R(shift_u, shift_v + 1))

             end
                     
         end
     end
end
