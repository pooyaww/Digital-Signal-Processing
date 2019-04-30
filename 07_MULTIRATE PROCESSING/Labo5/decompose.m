function e = decompose(h, M)

N = length(h); 
K = ceil(N/M);      %Find the number of samples in each subfilter
L = M*K;
h=[h;zeros(L-N,1)];   % zero pad
e = zeros(K,M);

for k = 0:K-1
    for  m=0:M-1
        e(k+1,m+1) = h(k*M + m + 1);
    end;
end;