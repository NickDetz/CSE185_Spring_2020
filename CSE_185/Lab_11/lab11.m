load('att_face.mat');

%k = 10;
%k = 20;
%k = 30;
%k = 40;
k = 50; 

h = size(face_training, 1);
w = size(face_training, 2);
n_train = size(face_training, 3);
n_test = size(face_testing, 3);

fprintf('Compute eigenface...\n');

X = reshape(face_training, h*w, n_train);


x_bar = mean(X, 2);


X = bsxfun(@minus, X, x_bar);


C = X * X';


[U, S, D] = svd(C);


U = U(:, 1:k);


fprintf('Face reconstruction...\n');
f = face_training(:, :, 1);
imwrite(f, 'input.png');
figure(1), 
subplot(1, 2, 1); imshow(imresize(f, 4)); title('input');

f = f(:) - x_bar;
coef = U' * f;


f_rec = x_bar + U * coef;
f_rec = reshape(f_rec, h, w);
subplot(1, 2, 2); imshow(imresize(f_rec, 4)); title('reconstruction');
imwrite(f_rec, sprintf('reconstruct_k%d.png', k));


fprintf('Convert training data to coef...\n');
coef_train = U' * X;


fprintf('Testing...\n');
id_predict = zeros(size(id_testing));

for i = 1:n_test
    
   
    img_test = face_testing(:, :, i);
    
   
    vec_test = img_test(:) - x_bar;
    coef_test = U' * vec_test;
    
    error = zeros(n_train, 1);
    for j = 1:n_train
        
        diff = coef_train(:, j) - coef_test;
        error(j) = sum( diff .^2 );
        
    end
  
    [~, min_id] = min(error);
    id_predict(i) = min_id;
    
end

accuracy = sum(id_testing == id_predict)/n_test;
fprintf('Accuracy = %f\n', accuracy);


%---------------------------------------%
%---------- Fill in this table ---------%
%---------------------------------------%
%   k   |  Accuracy |  Squared error
%---------------------------------------%
%  10   |  0.675    |
%---------------------------------------%
%  20   |  0.6875   |
%---------------------------------------%
%  30   |  0.71875  |
%---------------------------------------%
%  40   |  0.7375   |
%---------------------------------------%
%  50   |   0.7375  |
%---------------------------------------%