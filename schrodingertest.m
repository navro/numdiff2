%% Test for V(x) = 0
N = 499;
vvec = 0;
[~, eigenvecs] = schrodinger(vvec, N);

figure(1);
x = linspace(0,1,N+2);
bv = zeros(1,3);
plot(x,[bv; eigenvecs(:, end-2:end); bv]);

%% Test for a non-zero potential
N = 1500;
k = 10;
v = @(x) 700*(0.5 - abs(x-0.5));
vvec = arrayfun(v,linspace(0,1,N));
[eigenvals, eigenvecs] = schrodinger(vvec, N);
schrodingerplot(eigenvals, eigenvecs, 2, 3);

%% Another test potential
v = @(x) 800.*sin(pi.*x).^2;
vvec = arrayfun(v,linspace(0,1,N));
[eigenvals, eigenvecs] = schrodinger(vvec, N);
schrodingerplot(eigenvals, eigenvecs, 4, 5);