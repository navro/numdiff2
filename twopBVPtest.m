alpha = 0;
beta = 0;
L = 2*pi;
N = 1000;
x = linspace(0,L,N+2);
fvec = sin(x(2:N+1));

y = twopBVP(fvec', alpha, beta, L, N);

figure(1);
hold on;
plot(x,y);

% Plot the analytic solution
plot(x,-sin(x));

%% Plot the global error as a function of N
k = 4:12;
Ns = 2.^k;
vals = zeros(1,length(k));

for i = 1:length(k)
    x = linspace(0,L,Ns(i)+2);
    
    fv = sin(x(2:Ns(i)+1));
    
    anal = -sin(x);
    t = twopBVP(fv', alpha, beta, L, Ns(i));
    vals(i) = norm(t'-anal)./sqrt(Ns(i)+1);
end

% Fit to a power function
f = fit(Ns(5:end)', vals(5:end)', 'power1')
int = Ns(1):Ns(end);

figure(2);
loglog(Ns, vals, '*');
hold on;
loglog(int, feval(f, int));