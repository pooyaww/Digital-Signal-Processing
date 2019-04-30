function [X,w]=dft_for(x,N)


w = [0:1:N-1]*2*pi/N;
X = zeros(1,length(w));
n = [0:1:N-1]

  
f_index=1;
for omega = w
    t_index=1;
    for t = n
        X(f_index)=X(f_index)+ x(t_index)*exp(-1i*(t)*(omega));
        t_index=t_index+1;
    end
    f_index=f_index+1;
end

