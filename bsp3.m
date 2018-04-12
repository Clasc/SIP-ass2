original = imread('343a.tif');

subplot(2,2,1);imshow(original,[]);
G = graph (original);
L = laplacian(G);
laplace = conv2(original,L,"same")

subplot(2,2,2); imshow(laplace, []);