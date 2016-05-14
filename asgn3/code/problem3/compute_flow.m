function [u,v] = compute_flow(x,y,dx2,dy2,dxdy,dxdt,dydt)
% Computes optical flow at all given points
%
% INPUTS:
%   x           vector of x-coordinates of interest points
%   y           vector of y-coordinates of interest points
%   dx2         dx*dx
%   dxdy        dx*dy
%   dy2         dy*dy
%   dxdt        dx*dt
%   dydt        dy*dt
%
% OUTPUTS:
%   u           horizontal flow component at interest points
%   v           vertical flow component at interest points

u = zeros(size(x));
v = zeros(size(y));
for i = 1:numel(x)
    ty = y(i);
    tx = x(i);
    tensor = [dx2(ty,tx), dxdy(ty,tx); dxdy(ty,tx),dy2(ty,tx)];
    rhs = -[dxdt(ty,tx); dydt(ty,tx)];
    opt_flow(i,:) = mldivide(tensor, rhs);
end
u = opt_flow(:,1);
v = opt_flow(:,2);

%%tried to vectorise- could not succeed
% u = zeros(size(x));
% v = zeros(size(y));
% linearInd = sub2ind([388,584], y, x);
% mtensor = [dx2(linearInd)'; dxdy(linearInd)'; dxdy(linearInd)'; dy2(linearInd)'];
% mtensorr = reshape(mtensor, [2 2 (numel(mtensor)/4)]);
% mrhs = -[dxdt(linearInd)'; dydt(linearInd)'];
% mrhsr = reshape(mrhs, [2 1 (numel(mrhs)/2)]);
% mopt_flow = mldivide(mtensorr, mrhsr);

% format check
assert(all(size(u) == size(x)));
assert(all(size(v) == size(y)));

