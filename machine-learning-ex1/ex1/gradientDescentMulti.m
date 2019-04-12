function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
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
    %       of the cost function (computeCostMulti) and gradient here.
    %



    %featureNumber = size(X, 2);
    %tmep_theta = theta;
    %for i = 1:featureNumber
    %    tmep_theta(i,1) = theta(i,1) - (sum((X*theta-y) .* X(:,i))) / m *alpha ;
    %end
    %theta = tmep_theta
    
    S = (1 / m) * (X' * (X * theta - y));
    theta = theta - alpha .* S;
    % ============================================================

    % Save the cost J in every iteration    
    cost_j =  computeCostMulti(X, y, theta);
    
    fprintf('%d hang, cost_j the result is %f\n',iter,cost_j); 
    J_history(iter) = cost_j;

end

end
