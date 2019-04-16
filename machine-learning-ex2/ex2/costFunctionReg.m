function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% theta（1）不用序列化
theta_no_0 = theta(2:length(theta),:);

h_theta = sigmoid(X*theta);
J = ((-y)'*log(h_theta)-(1-y)'*log(1-h_theta))/m + (lambda * (theta_no_0'*theta_no_0))/(2*m);


grad(1) = X(:,1)'*(sigmoid(X*theta) - y)/m;
grad(2:length(theta),:) = (X'*(sigmoid(X*theta)- y))(2:length(theta),:)/m + (lambda * theta_no_0)/m;

 
%another implement method ======================================= 

% 因为theta0 不正则化，所以我们可以假设theta0为0，在计算的是欧
theta_0_0 = [0;theta(2:size(theta),:)];
h_theta = sigmoid(X*theta);%用的是原始的theta

p = lambda*(theta_0_0'*theta_0_0)/(2*m); % 因为第一个为0 所以避免了把theta0计算进来
J = ((-y)'*log(h) - (1-y)'*log(1-h))/m + p;

% calculate grads  其中lambda*theta1中，theta0为0 所以等于没有计算
grad = (X'*(h - y)+lambda*theta1)/m;
%
% 
% =============================================================

end
