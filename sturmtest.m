%% Error (λ_(Δx) - λ) vs N
x1 = 0;
x2 = 1;
Ns = 2.^(2:12);
anal = -pi.^2 .* [3; 2; 1].^2;
errs = [];

for i = 1:length(Ns)
    lambdas = sturm(x1, x2, Ns(i));
    errs = [errs, abs(lambdas(end-2:end) - anal)];
end

%% Error plot
figure(1)
loglog(Ns,errs,'*');
hold on;
loglog(Ns(1:end),Ns(1:end).^(-2));

% Plot settings
grid on;
xlabel('Antal steg $N$', 'Interpreter', 'latex', 'fontsize', 13);
ylabel('Felet $|\lambda_{\Delta x} - \lambda|$', 'Interpreter', 'latex', 'fontsize', 13);

%% Print the first three eigenvalues for N=499
N = 499;
[lambdas, eigenvecs] = sturm(x1, x2, N);
flipud(lambdas(end-2:end))

%% Plot the first three eigenmodes for N=499
figure(2)
hold on;
bv = zeros(1,3);
x = linspace(x1,x2,N+2);
y = [bv; eigenvecs(:,end-2:end); bv];
plot(x,y);

% Plot settings
xlabel('Position', 'Interpreter', 'latex', 'fontsize', 13);
ylabel('', 'Interpreter', 'latex', 'fontsize', 13);
s1 = ['$\lambda = ' num2str(lambdas(end-2), '%.6g') '$'];
s2 = ['$\lambda = ' num2str(lambdas(end-1), '%.6g') '$'];
s3 = ['$\lambda = ' num2str(lambdas(end), '%.6g') '$'];
l = legend(s1, s2, s3, 'Location', 'SouthEast');
set(l, 'Interpreter', 'latex');