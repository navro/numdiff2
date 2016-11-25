alpha = 0;
beta = 0;
L = 10;
N = 999;
E = 1.9E11;
I = @(x) 1E-3 * (3 - 2.*cos(pi.*x./L).^12);
q = @(x) -50E3;
x = linspace(0,L,N+2);

%% Solve M''=q(x), M(0)=M(L)=0
fvec = arrayfun(q,x(2:N+1))';
M = twopBVP(fvec, alpha, beta, L, N);
figure(1);
plot(x,M);

% Plot settings
xlabel('Position', 'Interpreter', 'latex', 'fontsize', 13);
ylabel('B\"ojmoment', 'Interpreter', 'latex', 'fontsize', 13);
set(gcf, 'PaperUnits', 'normalized');
set(gcf,'Paperposition',[0, 0, 1, 0.4]);
saveas(gcf, 'beamM', 'epsc');

%% Solve u''=M(x)/(EI(x))=H(x), M(0)=M(L)=0
fvec = M(2:end-1)./(E.*I(x(2:end-1)))';
u = twopBVP(fvec, alpha, beta, L, N);
figure(2);
plot(x,u);

% Plot settings
xlabel('Position', 'Interpreter', 'latex', 'fontsize', 13);
ylabel('Deflektion', 'Interpreter', 'latex', 'fontsize', 13);
set(gcf, 'PaperUnits', 'normalized');
set(gcf,'Paperposition',[0, 0, 1, 0.4]);
saveas(gcf, 'beamU', 'epsc');

%% Deflection at the midpoint
u(501)