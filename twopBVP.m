function y = twopBVP( fvec, alpha, beta, L, N )
%% Solves y''=fvec with BCs y(0)=α, y(L)=β using a grid with N interior points

dx = L/(N+1);
R = [-2, 1, zeros(1,N-2)];
A = toeplitz(R) ./ (dx.^2);
fvec(1) = fvec(1) - alpha./(dx.^2);
fvec(end) = fvec(end) - beta./(dx.^2);

y = A \ fvec;
y = [alpha; y; beta];

end

