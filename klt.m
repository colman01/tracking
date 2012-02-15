% e.g. targetXPoints = 180:300;;
%      targetYPoints = 175:320;

%      function [warp] = klt( template, I ,targetXPoints ,targetYPoints,iterations);

function [warp] = klt( template, I ,targetXPoints ,targetYPoints,iterations);

% diff = 0;

%template = template(targetXPoints,targetYPoints);
% patch = I(targetXPoints,targetYPoints);
patch = I;
[h w] = size(patch);

%% step 3
% get the gradient image... of the template

[dIx dIy] = gradient(patch);
% [I2xx I2xy] = gradient(Ix);
% [I2yx I2yy] = gradient(Iy);

%% step 4) Constant Jacobian  % J = [ x 0 y 0 1 0; 0 x 0 y 0 1]; page 4
% simon_baker_2002

dW_dp = jacobian(w, h);
size(dW_dp)

%% step 5) Compute steepest descent image
steepest = steepestDescentImage(dW_dp, dIx, dIy, h, w);

%% step 6) Compute Hessian and inverse
% should be 6x6 matrix
H = hessian(steepest, w);
invHessian = inv(H);

oldError = 0;
error = 0;
%  That was all the stuff to be precomputed...
%  now for the algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% I(x)
% set template
% generate warped image

% 1) Compute warped image with current parameters

p     = [ 0 1 0 1 0 1]; % translating 1 pix .... almost trivial, but not equal initalization
warp = affineProj(patch,p,targetXPoints ,targetYPoints);
try
    figure(400);imshow(template);
    figure(800);imshow(warp);
end
for i=1:iterations
    %% step 2
    % get error T(x) - I(W(x;p))

    [errorImage errorValue] = getError(patch,warp);
    %% step 7 ------------- 
    
    % parameter update
    % invHessian (check) * steepestDescentImageTranspose (check) * errorImage
    % (check)
    result = deltaPUpdate(steepest, errorImage);

    %% step 8
    deltaP = invHessian*result;

    %% step 9
    p = p + deltaP'/100;
    warp = affineProj(warp,p, 1:w,1:h);
%     figure(200);imshow(transformI);
    i = i + 1;
    
%%      codeproject.com image alignment termination solution   
% 		// Update parameter vector approximation.
% 		wz_a += delta_wz;
% 		tx_a += delta_tx;
% 		ty_a += delta_ty;
% 
% 		// Print diagnostic information to screen.
% 		printf("iter=%d dwz=%f dtx=%f dty=%f mean_error=%f\n", 
% 			iter, delta_wz, delta_tx, delta_ty, mean_error);
% 
% 		// Check termination critera.
% 		if(fabs(delta_wz)<EPS && fabs(delta_tx)<EPS && fabs(delta_ty)<EPS) break;
    
end




