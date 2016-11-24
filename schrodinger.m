%% Solves the Schrödinger equation ψ''-V(x)ψ=-Eψ for a potential V(x)
%  in ther interval [0,1], where ψ(0)=ψ(1)=0. Uses N internal points.
%  Prints the first k eigenvalues and plots the first k eigenvectors

function [lambdas, eigenvecs] = schrodinger(vvec, N)
dx = 1/(N+1);
R = [-2, 1, zeros(1,N-2)];
A = toeplitz(R) ./(dx.^2);
B = A - diag(vvec);
[eigenvecs, lambdas] = eig(B, 'vector');
end
