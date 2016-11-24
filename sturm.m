%% Solves the Sturm-Liouville problem u''=λu, u(x1)=u(x2)=0 using a grid with N interior points

function [lambdas, eigenvecs] = sturm( x1, x2, N )
L = x2 - x1;
dx = L/(N+1);
R = [-2, 1, zeros(1,N-2)];
A = toeplitz(R) ./(dx.^2);
[eigenvecs, lambdas] = eig(A, 'vector');
end