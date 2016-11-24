%% Error (λ_(Δx) - λ) vs N
x1 = 0;
x2 = 1;
Ns = 2.^(2:12);
anal = -pi.^2 .* [3; 2; 1].^2;
errs = [];

for i = 1:length(Ns)
    lambdas = sturm(x1, x2, Ns(i));
    errs = [errs, lambdas(end-2:end) - anal];
end

figure(1)
loglog(Ns,errs,'*');
hold on;
loglog(Ns(1:end),Ns(1:end).^(-2));

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