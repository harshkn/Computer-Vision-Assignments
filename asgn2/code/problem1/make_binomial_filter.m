function K = make_binomial_filter(fsize)
% Creates a binomial filter.
%
% Inputs:
%   fsize     filter dimensions
%
% Outputs:
%   K         filter matrix

%% Generation of pascals triangle coefficients
PT(1, 1) = 1;
PT(2, 1 : 2) = [1 1]; 
for rowP = 3 : fsize
    PT(rowP, 1) = 1;   
    for colP = 2 : rowP-1
        PT(rowP, colP) = PT(rowP-1, colP-1) + PT(rowP-1, colP);
    end   
    PT(rowP, rowP) = 1;
end
K = PT(fsize,:); %choosing the coefficients 1D
K = (K' * K);
normValK = sum(K(:));
K = K/normValK; %normalizing
end
