function K = make_gaussian_filter(fsize, sigma)
%{
Creates a Gaussian filter.

 Inputs:
   fsize     filter dimensions.
   sigma     standard deviation.

 Outputs:
   K         filter matrix.
%}

size1 = (fsize(1) - 1) / 2;
size2 = (fsize(2) - 1) / 2;
sigma1 = sigma;
sigma2 = sigma;
h = exp(-(-size1:size1).^2/(2*sigma1^2)).'*exp(-(-size2:size2).^2/(2*sigma2^2));
K = h/sum(h(:));

% K = fspecial('gaussian',fsize,sigma)

end

