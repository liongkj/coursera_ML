function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
pos = find(y == 1);
neg = find(y==0);
% x(pos,1) => get x vector
% x(pos,2) => get y vector
% plot(X,Y) => pair up xy
plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7)
% y = yellow
% markerfacecolor = fill color
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','y','MarkerSize',7)








% =========================================================================



hold off;

end
