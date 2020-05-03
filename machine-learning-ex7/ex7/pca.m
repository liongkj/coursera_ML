function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix. 
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%
% Where Sigma is the covariance matrix. The output values U and V are unitary matrices and the columns of U are the eigenvectors of the transformation. S is a diagonal matrix, containing the corresponding eigenvalues in decreasing order. In order words, the SVD has done the work to figure out which dimensions are the most significant and gives us the results in that order. 
Sigma = 1/m * (X') * X;
% U = pricipal components
% S = diagonal matrix
[U,S,V] = svd(Sigma);






% =========================================================================

end
