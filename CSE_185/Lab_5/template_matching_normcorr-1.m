function[output, match] = template_matching_normcorr(img, template, threshold)

[rows,cols]=size(img);


shift_u = floor(size(template,2)/2);
shift_v = floor(size(template,1)/2);
I1=zeros(rows+2*shift_u,cols+2*shift_v);
I1(1+shift_u:rows+shift_u,1+shift_u:cols+shift_v)=img;
output = img;

shift_u = floor(size(template,2)/2);
shift_v = floor(size(template,1)/2);

   for u = 1 : size(I1, 2) - 2*shift_u
         for v = 1 : size(I1, 1) - 2*shift_v
        x1 = u ;
        x2 = u + 2*shift_u;
        y1 = v ;
        y2 = v + 2*shift_v;
            
            patch = I1(y1:y2, x1:x2);
            
            patch2 = patch(:);
            template2 = template(:);
            
            patch2 = patch2 - mean(patch2);
            template2 = template2 - mean(template2);
            
            patch2 = patch2/norm(patch2);
            template2 = template2/norm(template2);
            
            normcarr = dot(patch2, template2);
            
            output(v,u) = normcarr;
        end
    end
    
    match = (output > threshold);
    
end
            
