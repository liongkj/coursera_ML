function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%
h = sigmoid(X*theta);
sum_cost =  (-y' * log(h)) - ((1-y)' * log(1-h));

J =  sum_cost / m;

% I was confused about this and kept trying to return the updated theta values . . .

% UPDATE (the above was really helpful, thank you for putting it here) As an additional hint: the instructions say: "[...] the gradient of the cost with respect to the parameters" - you're only asked for a gradient, don't overdo it (see above). The fact that you're not given alpha should be a hint in itself. You don't need it. You won't be iterating neither.

grad = (X'* (h-y))/m;

% =============================================================

end
