function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
y_matrix = eye(num_labels)(y,:);
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
% a = activated neurons, normally add 1 in front as bias
% z = something like process of activation
a1 = [ones(m,1) X];
z2 = a1 * Theta1';
a2 = [ones(m,1) sigmoid(z2)];
z3 = a2 * Theta2';
a3 = sigmoid(z3);
J1 = (- y_matrix).*log(a3);
J2 = (1 - y_matrix).* log( 1 - a3);
cost_matrix = J1 - J2; %to remove the sum(sum()) syntax, cause sum() returns by row/column only
sum_of_cost = sum (cost_matrix(:));
unreg_cost = sum_of_cost / m;

%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
    
    % hidden layer 2
    delta_3 = a3 - y_matrix;
    Theta2_grad = Theta2_grad +  (delta_3' * a2 );
    % hidden layer 1
    delta2_1 = delta_3 * Theta2(:,2:end);
    delta_2 =  delta2_1 .* sigmoidGradient(z2);
    Theta1_grad = Theta1_grad  + (delta_2' * a1);


    unreg_Theta1_grad = Theta1_grad  / m;
    unreg_Theta2_grad = Theta2_grad / m;
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%note: need to remove the bias, which is the first column of each matrix
    reg_cost = sum((Theta1(:,2:end).^2)(:)) + sum((Theta2(:,2:end).^2)(:));

    reg_grad1 = (lambda/m)*Theta1;
    reg_grad2 = (lambda/m)*Theta2;
    reg_grad1(:,1) = 0;
    reg_grad1(:,1);
    reg_grad2(:,1) = 0;


    Theta1_grad = unreg_Theta1_grad + reg_grad1;
    Theta2_grad = unreg_Theta2_grad + reg_grad2;
    J = unreg_cost + (lambda/(2*m))*reg_cost;



% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
