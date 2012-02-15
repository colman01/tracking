function H = hessian(steepest, w)

H = zeros(6, 6);

% Gauss-Newton approximation to the Hessian
% should be a 6*6 dimention matrix as defined by (11) page 3
% baker_simon_2002
for i=1:6
    position = ((i-1)*w)+1:((i-1)*w)+w;
	row1 = steepest(:,position);
	for j=1:6
        positions = ((j-1)*w)+1:((j-1)*w)+w;
		row2 = steepest(:,positions);
        % row multiplication as is defined by the hessian
		H(j, i) = sum(sum((row1 .* row2)));
	end
end



%% should be working e.g.

%  position = ((3-1)*10)+1:((3-1)*10)+10
% 
% position =
% 
%     21    22    23    24    25    26    27    28    29    30
