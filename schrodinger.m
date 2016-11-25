%% Solves the Schrödinger equation ψ''-V(x)ψ=-Eψ for a potential V(x)
% Uses N internal points. Returns eigenvalues and eigenvectors

function [lambdas, eigenvecs] = schrodinger(vvec, N)
dx = 1/(N+1);
R = [-2, 1, zeros(1,N-2)];
A = toeplitz(R) ./(dx.^2);
B = A - diag(vvec);
[eigenvecs, lambdas] = eig(B, 'vector');
end