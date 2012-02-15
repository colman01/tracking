% function [transformI u v subPix]= affineProj(I,p)
function [transformI ] = affineProj(I,p, targetXPoints,targetYPoints)

% later if I want to crop out a patch from a larger image I will need
% another image variable
% I2 = I(targetXPoints,targetYPoints);
I2 = I;
try
    figure(100);imshow(I2);
end
[n m] = size(I2);

transformI = zeros(n,m);
% u(x,a) = a_0 + a_1*x + a_2y
% v(x,y) = a_3 + a_4*x + a_5y

a_0 =p(1);
a_1 =p(2);
a_2 =p(3);
a_3 =p(4);
a_4 =p(5);
a_5 =p(6);

u =  zeros(n,m);
v =  zeros(n,m);

for i=1:n
    for j=1:m
        x = i;
        y = j;
        horzShift = a_0 + a_1*x + a_2*y;
        vertShift = a_3 + a_4*x + a_5*y;
        transformI(i,j) = getSub(I2,horzShift  ,vertShift );
    end
end

try
    figure(200);imshow(transformI);
end
