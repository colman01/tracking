function subPixIntensity = getSub(I,x,y);

%   a --- d
%   |     |
%   |     |
%   |     |
%   b --- c

% a = [floor(x) floor(y)];
% b = [floor(x) ceil(y) ];
% c = [ceil(x)  ceil(y) ];
% d = [ceil(x)  floor(y)];
[w,h]=size(I);

%disp(w);

% if (x < 1 )
%     x = 1;
%     subPixIntensity = NaN;
%     return;
% elseif (x>w-1)
%     x = w-1;
%     subPixIntensity = NaN;
%     return;
% end
% 
% if (y < 1 )
%     y = 1;
%     subPixIntensity = NaN;
%     return;
% elseif (y>h-1)
%     y = h-1;
%     subPixIntensity = NaN;
%     return;
% end

if (x < 1 )
    x = 1;
    subPixIntensity = 0;
    return;
elseif (x>w-1)
    x = w-1;
    subPixIntensity = 0;
    return;
end

if (y < 1 )
    y = 1;
    subPixIntensity = 0;
    return;
elseif (y>h-1)
    y = h-1;
    subPixIntensity = 0;
    return;
end


fx = floor(x);
fy = floor(y);
cx = ceil(x);
cy = ceil(y);

b = I(fx,fy);
a = I(fx,cy);
d = I(cx ,cy);
c = I(cx ,fy);

dx = x - fx;
dy = y - fy;

diffX = 1 - dx;
diffY = 1 - dy;

subPixIntensity = diffY*(diffX*b + dx*c) + dy*(diffX*a + dx*d);

%   b --- c
%   |     |
%   |     |
%   |     |
%   a --- d




