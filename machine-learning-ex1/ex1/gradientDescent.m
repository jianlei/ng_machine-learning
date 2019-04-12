function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % fprintf('theta(1) --------- is :%f  and theta(2) --------- is :%f\n',theta(1),theta(2)); 
    % temp0 = theta(1) - (alpha * sum(X*theta-y) / m); 
    % temp1 = theta(2) - (alpha * sum((X*theta-y) .* X(:,2))) / m;
    %
    % theta(1) = temp0;
    % theta(2) = temp1; 
    %
     
    featureNumber = size(X, 2);
    tmep_theta = theta;
    for i = 1:featureNumber
     tmep_theta(i) = theta(i) - (alpha * sum((X*theta-y) .* X(:,i))) / m;
    end
    theta = tmep_theta
    
    % ============================================================

    % Save the cost J in every iteration    
    cost_j =  computeCost(X, y, theta);
    
    fprintf('%d hang, cost_j the result is %f\n',iter,cost_j); 
    J_history(iter) = cost_j;

end

end
