function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%
unreg_cost = (1/2) * sum((( ((X * Theta') - Y).^2 ) .* R),'all');
reg_cost = (lambda /2 ) *( sum((Theta.^2),'all') + sum((X.^2),'all'));
J = unreg_cost + reg_cost;

unreg_X_grad = (((X * Theta') - Y).* R) * Theta;
reg_X_grad = lambda * X;
X_grad = unreg_X_grad + reg_X_grad;

unreg_Theta_grad = (((X * Theta') - Y).* R)' * X;
reg_Theta_grad = lambda * Theta;
Theta_grad = unreg_Theta_grad + reg_Theta_grad;

% Calculate the regularized cost:

% - Using the formula on the top of Page 13 of ex8.pdf, compute the regularization term as the scaled sum of the squares of all terms in Theta and X. The result should be a scalar. Note that for Recommender Systems there are no bias terms, so regularization should include all columns of X and Theta.

% - Add the regularized and un-regularized cost terms.

% - Test your code, then submit this portion.

% Calculate the gradient regularization terms (ref: the formulas in the middle of Page 13 of ex8.pdf)

% - The X gradient regularization is the X matrix scaled by lambda.

% - The Theta gradient regularization is the Theta matrix scaled by lambda.

% - Add the regularization terms to their unregularized values.

% - Test your code, then submit this portion.

% Done.














% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
