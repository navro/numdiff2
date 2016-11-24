%% Prints the first 6 eigenvalues and plots the first 6 eigenfunctions and their probabilty densities
function [] = schrodingerplot(eigenvals, eigenvecs, fig1, fig2)
k = 6;
N = length(eigenvals);
bv = zeros(1,k);

% Useful matrices
eigvals = eigenvals(end-k+1:end);
repvals = repmat(eigvals',N+2,1);
eigvecs = eigenvecs(:,end-k+1:end);

% Print the eigenvalues
flipud(eigvals)

% Plot the wavefunction
figure(fig1);
hold on;
x = linspace(0,1,N+2);
y = 100.*[bv; eigvecs; bv];
plot(x,y + repvals);
plot(x,repmat(eigvals', length(x), 1),':k');

% Plot the probabilty density
figure(fig2);
hold on;
z = abs(y).^2 +repvals;
plot(x,z);
plot(x,repmat(eigvals', length(x), 1),':k');
end