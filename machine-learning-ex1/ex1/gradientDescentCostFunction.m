function [jVal,gradient] = gradientDescentCostFunction(theta)  jVal = (theta(1) - 5 ) ^ 2 + (theta(2) - 5) ^ 2;  gradient = zeros(2,1)    gradient(1) = 2 * (theta(1) - 5); %导数  gradient(2) = 2 * (theta(2) - 5);  
end
