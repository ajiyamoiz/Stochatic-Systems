% Ajiya Fatima Moiz      399946

% Generate random variable and plot bivariate Gaussian distribution (PDF) in 3D plan alongwith contours.

%% Define the parameters mu and Sigma.
mu = [0 0];
Sigma = [0.25 0.3; 0.3 1];

%% Generate Multivariate Normal Random Numbers.
rng('default')  % For reproducibility
R = mvnrnd(mu,Sigma,100);
plot(R(:,1),R(:,2),'+')

%% Create a grid of evenly spaced points in two-dimensional space.
x1 = -3:0.2:3;
x2 = -3:0.2:3;
[X1,X2] = meshgrid(x1,x2);
X = [X1(:) X2(:)];

%% Evaluate the pdf of the normal distribution at the grid points.
y = mvnpdf(X,mu,Sigma);
y = reshape(y,length(x2),length(x1));

%% Plot the pdf values.
figure
surf(x1,x2,y)
clim([min(y(:))-0.5*range(y(:)),max(y(:))])
axis([-3 3 -3 3 0 0.4])
xlabel('x1')
ylabel('x2')
zlabel('Probability Density')

%% Finally, create a contour plot of the multivariate normal distribution.
figure
contour(x1,x2,y,[0.0001 0.001 0.01 0.05 0.15 0.25 0.35])
xlabel('x')
ylabel('y')