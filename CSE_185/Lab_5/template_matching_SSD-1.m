function [output, match] = template_matching_SSD(img, template, threshold)

[row,col]=size(img);


shift_u = floor(size(template,2)/2);
shift_v = floor(size(template,1)/2);
I1=zeros(row+2*shift_u,col+2*shift_v);
I1(1+shift_u:row+shift_u,1+shift_u:col+shift_v)=img;

output=img;
for u = 1 : size(I1, 2) - 2*shift_u
    for v = 1 : size(I1, 1) - 2*shift_v
        x1 = u ;
        x2 = u + 2*shift_u;
        y1 = v ;
        y2 = v + 2*shift_v;
        
        patch = I1(y1:y2, x1:x2);
        patch = (patch - template).^2;
        
        value = sum(patch);
        value = sum(value);
        output(v,u) = value;
    end
end


match = (output < threshold);
end
