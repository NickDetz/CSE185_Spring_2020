img = im2double(imread('lena.jpg'));

%%%% question 1 Guassian Pyramid
sigma = 2.0;
hsize = 7;
scale = 5;
guas = fspecial('gaussian', hsize, sigma);
I = img;
for s = 1: scale
   
    for u = 1 : size(I, 2)
        for v = 1 : size(I, 1)
            x1 = u -floor(hsize/2); x2 = u+floor(hsize/2);
            y1 = v-floor(hsize/2); y2 = v+floor(hsize/2);
            
            if ( (x1 > 1) && (x2 < (size(I, 2)-floor(hsize/2))) &&  (y1 > 1) && (y2 < (size(I, 1)-floor(hsize/2)))  )
                patch = I(y1:y2, x1:x2);
                value = patch .* guas;
                value = value(:);
                value = sum(value);
            else
                value = I(v,u);
            end
            
            I(v, u) = value;
        end
     end
     imwrite(I , sprintf('Guassian_scale%d.jpg',s));

    
    I = imresize(I,1/2);
end

%%%% question 2 Laplacian Pyramid
I = img;
Iinit = img;
for s = 1: scale
    for u = 1 : size(I, 2)
        for v = 1 : size(I, 1)
            x1 = u -floor(hsize/2); x2 = u+floor(hsize/2);
            y1 = v-floor(hsize/2); y2 = v+floor(hsize/2);
            
            if ( (x1 > 1) && (x2 < (size(I, 2)-floor(hsize/2))) &&  (y1 > 1) && (y2 < (size(I, 1)-floor(hsize/2)))  )
                patch = I(y1:y2, x1:x2);
                value = patch .* guas;
                value = value(:);
                value = sum(value);
            else
                value = I(v,u);
            end
            
            I(v, u) = value;
        end
    end
    
    %%% Laplacian Filtering
    I = Iinit - I;
    
    
    imwrite(I + 0.5, sprintf('Laplacian_scale%d.jpg', s));
    
    
    %I = imresize(filter,1/2);
    %Iinit = imresize(filter,1/2);
    
end
