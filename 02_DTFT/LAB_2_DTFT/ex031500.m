subplot(1,1,1)

b = 1; a = [1,-0.8];

n=[0:100];

x=impseq(0,0,100);

h=filter(b,a,x);


x = cos(0.05*pi*n);

y = filter(b,a,x);

subplot(3,1,1); stem(n,x);

xlabel('n'); ylabel('x(n)'); title('Input sequence')

subplot(3,1,2);stem(n,h)

title('Impulse Response');xlabel('n');ylabel('h(n)')


subplot(3,1,3); stem(n,y);

xlabel('n'); ylabel('y(n)'); title('Output sequence')

