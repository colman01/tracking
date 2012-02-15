function result = steepestDescentImage(dW_dp, dIx, dIy, h, w)

% nabla_I * dW / dp is defined to be the steepest descent image
% the steepest descent parameter updates are needed
% from page 3 baker_simon_2002
% sum over all data [sigma_x] [nabla_I * dW / dP]'*[template - I(W(x;p))]

% for the number of affine parameters
for i=1:6		
    % position of the data in the partial defivative
    position = ((i-1)*w)+1:((i-1)*w)+w;  % just like in hessian
    
    % going along the x
	Tx = dIx .* dW_dp(1:h,position);
    % going along the vertical
	Ty = dIy .* dW_dp(h+1:end,position);
	steepest(:,position) = Tx + Ty;
end

result = steepest;



%% as is in hessian

%  position = ((3-1)*10)+1:((3-1)*10)+10
% 
% position =
% 
%     21    22    23    24    25    26    27    28    29    30