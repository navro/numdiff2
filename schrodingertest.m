%% Test for V(x) = 0
N = 499;
vvec = 0;
[lambdas, eigenvecs] = schrodinger(vvec, N);

figure(1);
x = linspace(0,1,N+2);
bv = zeros(1,3);
plot(x,[bv; eigenvecs(:, end-2:end); bv]);

% Plot settings
xlabel('Position', 'Interpreter', 'latex', 'fontsize', 13);
ylabel('V\r{a}gfunktion', 'Interpreter', 'latex', 'fontsize', 13);
s1 = ['$\lambda = ' num2str(lambdas(end-2), '%.6g') '$'];
s2 = ['$\lambda = ' num2str(lambdas(end-1), '%.6g') '$'];
s3 = ['$\lambda = ' num2str(lambdas(end), '%.6g') '$'];

l = legend(s1, s2, s3, 'Location', 'SouthEast');
set(l, 'Interpreter', 'latex');
set(gcf, 'PaperUnits', 'normalized');
set(gcf,'Paperposition',[0, 0, 1, 0.4]);
saveas(gcf, 'schrodingerTest', 'epsc');

%% Test for a non-zero potential
N = 1500;
v = @(x) 700*(0.5 - abs(x-0.5));
vvec = arrayfun(v,linspace(0,1,N));
[eigenvals, eigenvecs] = schrodinger(vvec, N);
schrodingerplot(eigenvals, eigenvecs, 2, 3, v, 'triangelpotentialen');

%% Another test potential
v = @(x) 800.*sin(pi.*x).^2;
vvec = arrayfun(v,linspace(0,1,N));
[eigenvals, eigenvecs] = schrodinger(vvec, N);
schrodingerplot(eigenvals, eigenvecs, 4, 5, v, 'kullen');

%% Triple well
v = @(x) 950.*cos(3.*pi.*x).^2;
vvec = arrayfun(v,linspace(0,1,N));
[eigenvals, eigenvecs] = schrodinger(vvec, N);
schrodingerplot(eigenvals, eigenvecs, 6, 7, v, 'trippelbrunnen');