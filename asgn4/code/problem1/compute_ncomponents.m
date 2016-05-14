function [n80,n95] = compute_ncomponents(cumvar)
%{
 Computes required number of components to account for 80%/95% of variance.

 Inputs:
   cumvar  cumulative variance

 Outputs:
   n80     number of components required for 80% of variance.
   n95     number of components requried for 95% of variance.
%}

n80 = min(find(cumvar > 0.8));
n95 = min(find(cumvar > 0.95));
