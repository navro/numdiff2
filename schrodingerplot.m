%% Prints the first 6 eigenvalues and plots the first 6 eigenfunctions and their probabilty densities
%  Also plots the potential with the eigenfunctions
function [] = schrodingerplot(eigenvals, eigenvecs, fig1, fig2, v)
k = 6;
N = length(eigenvals);
bv = zeros(1,k);

% Useful matrices
eigvals = -eigenvals(end-k+1:end);
repvals = repmat(eigvals',N+2,1);
eigvecs = eigenvecs(:,end-k+1:end);

% Print the eigenvalues
flipud(-eigvals)

% Create legend strings for the eigenvalues
for i = 1:k
    legstr(i,:) = ['$\lambda = ', num2str(eigvals(i), '%.6g'), '$'];
end

% Plot the wavefunction
figure(fig1);
hold on;
x = linspace(0,1,N+2);
y = 140.*[bv; eigvecs; bv];
plot(x,4.*y + repvals);
plot(x,repmat(eigvals', length(x), 1),':k');

% Plot commands...
xlabel('Position', 'Interpreter', 'latex', 'fontsize', 13);
ylabel('Energi', 'Interpreter', 'latex', 'fontsize', 13);
l = legend(legstr, 'Location', 'NorthEast');
set(l, 'Interpreter', 'latex');

% Plot the potential V(x)
plot(x,v(x), 'k');

% Plot the probabilty density
figure(fig2);
hold on;
z = abs(y).^2 +repvals;
plot(x,z);
plot(x,repmat(eigvals', length(x), 1),':k');

% Plot the potential V(x)
plot(x,v(x), 'k');

% Plot commands...
xlabel('Position', 'Interpreter', 'latex', 'fontsize', 13);
ylabel('Energi', 'Interpreter', 'latex', 'fontsize', 13);
l = legend(legstr, 'Location', 'NorthEast');
set(l, 'Interpreter', 'latex');
end