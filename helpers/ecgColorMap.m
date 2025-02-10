function J = ecgColorMap(m,class)

% Copyright 2020 The MathWorks, Inc.

n = ceil(m/4);
u = [(1:1:n)/n ones(1,n-1) (n:-1:1)/n]';
g = ceil(n/2) - (mod(m,4)==1) + (1:length(u))';
r = g + n;
b = g - n;
r1 = r(r<=128);
g1 = g(g<=128);
b1 = b(b >0);
J = zeros(m,3);
J(r1,1) = u(1:length(r1));
J(g1,2) = u(1:length(g1));
J(b1,3) = u(end-length(b1)+1:end);
feval = str2func(class);
J = feval(J);

end
