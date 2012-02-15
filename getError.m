function [errorImage errorValue] = getError(Ia,Ib)

[w h] = size(Ia);
error = 0;
% get error T(x) - I(W(x;p))

for i=1:w
    for j=1:h
        % there should be some threshold preset

        diff  =  Ia(i,j) - Ib(i,j) ; % when diff is small enough terminate
        diff = sqrt(diff)^2;         % but I dont know how small it should be... 
        error = error + diff;        % and the error gets bigger
    end    
end

errorImage = Ia - Ib;
% errorImage = sqrt(errorImage).^2;
errorValue = error;
