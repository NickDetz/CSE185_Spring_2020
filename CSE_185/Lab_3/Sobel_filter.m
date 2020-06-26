function sobel_filt =  Sobel_filter(image1, kernel)

 sobel_filt = zeros(size(image1));
   shift_u = size(kernel,2);
   shift_v = size(kernel,1);
   
   for u = 1+shift_u: size(image1, 2)-shift_u
       for v = 1+ shift_v: size(image1, 1)-shift_v
           x1 = u - floor(shift_u/2);
           x2 = u + floor(shift_u/2);
           y1 = v - floor(shift_v/2); 
           y2 = v + floor(shift_v/2);
           
           patch = image1(y1:y2, x1:x2); 
           patch = patch .* kernel;
           patch = patch(:);
  
           value = sum(patch);
           value = sum(value);
         
           sobel_filt(v, u) = value;
       end
   end
end
