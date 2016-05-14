function L_amp = amplify_high_freq2(L)
%{
 Amplifies frequencies of the finest two levels.

 Inputs:
   L       Laplacian image pyramid.

 Outputs:
   L_amp       Laplacian image pyramid with amplified levels.
%}

L_amp = L;
amp_factor = [2.5,1.5];
imVal = 1;
L_amp{imVal} = L{imVal} * amp_factor(imVal);
imVal = 2;
L_amp{imVal} = L{imVal} * amp_factor(imVal);


% format check
assert(iscell(L_amp));
