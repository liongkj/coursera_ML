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


theta_others = theta(2:end);

lamb = (lambda / (2*m)) *sum( theta_others.^2) ;
[cost, gradient] = costFunction(theta,X,y) ;
J = cost+lamb;

% seperate update for feature 0
grad(1) =gradient(1)*X(1,1);
grad(2:end) = theta_others-( theta_others* (1-lambda/m) - gradient(2:end));

% =============================================================

end
