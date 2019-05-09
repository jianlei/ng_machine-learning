function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

n = size(theta,1);

thetawithoutzero = theta(2:end,:);% 因为正则化不需要对theta0正则化

J = sum((X * theta .- y) .^ 2) ./ (2*m) + sum(thetawithoutzero .^ 2) * lambda / (2*m);

% 第一个theta设置为0 
thetawithFirstIsZero = [0;thetawithoutzero];

grad = X' * (X * theta .- y) / m + thetawithFirstIsZero * lambda / m;








% =========================================================================

grad = grad(:);

end
