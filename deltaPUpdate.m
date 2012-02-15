function result = deltaPUpdate(steepest, errorImage)
% this for step 7, to compute the equation
% [sigma_x]*[nabla_T*Jacobian]^transpose * errorImage

[h w] = size(errorImage);
parameters = zeros(6, 1);

for i=1:6
    positions = ((i-1)*w)+1:((i-1)*w)+w;
	row = steepest(:,positions);
	parameters(i) = sum(sum(row .* errorImage));
end

result = parameters;
