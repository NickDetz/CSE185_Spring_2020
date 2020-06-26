
% img_dir = 'data/Backyard';
img_dir = 'data/Basketball';
%img_dir = 'data/Dumptruck';
img1 = im2double(imread(fullfile(img_dir, 'frame10.png')));
img2 = im2double(imread(fullfile(img_dir, 'frame11.png')));

%window_size = 45;
window_size = 100;  
k = 4; 

w = floor(window_size/2);
shift = w + 10;



I1 = rgb2gray(img1);
I2 = rgb2gray(img2);

Ix_m = imfilter(I1, [1 -1;  1 -1], 'replicate');
Iy_m = imfilter(I1, [1  1; -1 -1], 'replicate');



u = zeros(size(I1));
v = zeros(size(I1));

u_next = zeros(size(I1));
v_next = zeros(size(I1));

for t = 1:k
    for i = 1 + shift : size(Ix_m, 1) - shift
        for j = 1 + shift : size(Ix_m, 2) - shift
 
            Ix = Ix_m(i-w : i+w, j-w : j+w);
            Iy = Iy_m(i-w : i+w, j-w : j+w); 
            i2 = round(i + v(i, j)); 
            j2 = round(j + u(i, j)); 
            It = I1(i-w : i+w, j-w : j+w) - I2(i2-w : i2+w, j2-w : j2+w);

            
            

            Ix = Ix(:);
            Iy = Iy(:);
            It = It(:);
            A = [Ix, Iy];
            b = -It;
            x = A \ b;
            %x = pinv(A) * b; 
            %x = inv(A' * A) * A' * b;
            u_next(i, j) = x(1);
            v_next(i, j) = x(2);

        end
    end
    
    u = u + u_next;
    v = v + v_next;
    
    
end

plot_flow(img2, u, v);
h = gcf;
saveas(h, 'BasketBallresult.png');
%saveas(h, 'Backyardresult.png');
%saveas(h, 'Dumptruckresult.png');