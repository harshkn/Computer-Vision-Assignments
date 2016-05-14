function harris = compute_harris(dx2,dy2,dxdy,sigma)
%{
 Calculate the Harris function values by using the obtained structure tensor.

 Inputs:
   dx2
   dy2
   dxdy
   sigma

 Outputs:
   harris   image of Harris function values.
%}

sigma_sq = sigma .^ 2;
dx2s = sigma_sq * dx2;
dy2s = sigma_sq * dy2;
dxdys = sigma_sq * dxdy;

detC = dx2s .* dy2s -  dxdys .^ 2;
traceC = dx2s + dy2s;
% sigmasq = sigma .^ 2 ;
alpha = 0.06;
harris =  detC - alpha *  traceC.^ 2;

end

