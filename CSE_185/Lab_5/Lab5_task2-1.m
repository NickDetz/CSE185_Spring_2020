

name1 = 'einstein1';


img = im2double(imread(sprintf('%s.jpg', name1)));
template= im2double(imread('template.jpg'));

%%% Question 3 SSD 
threshold = 5;
[output,match] = template_matching_SSD(img, template, threshold);

figure, imshow(output ./ max(output(:))); title('SSD output');
figure, imshow(match); title('SSD match');

imwrite(output ./ max(output(:)), sprintf('%s_ssd_output.jpg', name1) );
imwrite(match, sprintf('%s_ssd_match.jpg', name1) );


%%% Question 4 Nomcore
threshold = 0.5;
[output, match] = template_matching_normcorr(img, template, threshold);

figure, imshow(output ./ max(output(:))); title('NormCorr output');
figure, imshow(match); title('NormCorr match');

imwrite(output ./ max(output(:)), sprintf('%s_normcorr_output.jpg', name1) );
imwrite(match, sprintf('%s_normcorr_match.jpg', name1) );


