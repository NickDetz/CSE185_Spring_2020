function img = Visualization(img_v)

frequency_map = fftshift(fft2(img_v));
figure, imagesc(log(abs(frequency_map)+1)), colormap jet;

img = frequency_map;
end
