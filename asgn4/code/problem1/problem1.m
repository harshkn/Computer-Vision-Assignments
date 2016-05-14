%% Problem 1 - PCA for Face Images

%% 1) Load the images
[data,facedim,nfaces] = load_faces('../../data/yale_faces');



%% 2) Get the principal components by calling compute_pca

[U,lambda,mu,cumvar] = compute_pca(data);

%% 3) Plot the cumulative variance
figure();
plot(cumvar);



%% 4) Compute the the necessary number of bases with compute_ncomponents.
[n80,n95] = compute_ncomponents(cumvar);
%%    Display the number of components in the command window.
text1 = ['Number of Components required for 80 percent cum variance : ',num2str(n80)];
disp (text1);
text1 = ['Number of Components required for 95 percent cum variance : ',num2str(n95)];
disp (text1);
%disp ('Number of Components required for 95 percent cum variance : ',num2str(n95));

%% 5) Plot the mean face and the first 10 Eigenfaces by calling display_faces
figure();
display_faces(U,mu,facedim)

%% 6a) Choose a face image out of the data with take_face
faceim = take_face(data, facedim, randi([1,nfaces*20],1,1));

%% 6b) Make 4 different calls to compute_reconstruction to reconstruct the
%%     chosen image with 5/15/50/150 principal components.
f5 = compute_reconstruction(faceim,U,mu,5);
f15 = compute_reconstruction(faceim,U,mu,15);
f50 = compute_reconstruction(faceim,U,mu,50);
f150 = compute_reconstruction(faceim,U,mu,150);

%% 6c) Plot the reconstructions and the original in a single figure with
%%     display_reconstruction.

display_reconstruction(faceim,f5,f15,f50,f150)
