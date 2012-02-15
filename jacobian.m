function dW_dp = jacobian(nx, ny);

% | x 0 y 0 1 0 | 
% | 0 x 0 y 0 1 |

% e.g. dW_dp = jacobian(2,1)
%      
%   0     1   
%   0     0     
% 
%   0     0   
%   0     1     
% 
%   0     0     
%   0     0     
%   
%   0     0    
%   0     0  
% 
%   1     1    
%   0     0   
% 
%   0     0
%   1     1


% this has to be changed to a cross product in the usual way
% [0:5]*ones(6,1)
% ans =
%     15
%     
    
% e.g. 
%  kron([0:5],ones(2, 1))
% 
%      0     1     2     3     4     5
%      0     1     2     3     4     5

% your might be wondering what kron does, so I incuded the examples
% this is a simpler way to create the jacobian than having many for loops
x = kron([0:nx - 1],ones(ny, 1));

% e.g.
% kron([0:1]',ones(1, 6))
%
% 
%      0     0     0     0     0     0
%      1     1     1     1     1     1
y = kron([0:ny - 1]',ones(1, nx));

nullEntry = zeros(ny, nx);
onesEntry = ones(ny, nx);

     % | x          0           y          0            1          0 | 
     % | 0          x           0          y            0          1 |

dW_dp = [x,         nullEntry,  y,         nullEntry,   onesEntry, nullEntry;
         nullEntry, x,          nullEntry, y,           nullEntry, onesEntry];
     
     

