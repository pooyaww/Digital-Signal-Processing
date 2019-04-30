% Example 2.6
clc
close all
clear all

%

% input x(n)

x = [3,11,7,0,-1,4,2]; nx = [-3:3];

% impulse response h(n)

h = [2,3,0,-5,2,1]; nh = [-1:4];



for n=7:-1:-4
    % n_min = min(nx)+min(nh)
    % n_max = max(nx)+max(nh)

% plot x(k) and h(n-k)

figure, stem(nx-0.05,x); axis([-5,5,-6,12]);

hold on; stem(-fliplr(nh)+0.05+n,fliplr(h),'m:')

title(['x(k) and h(', num2str(n),'-k)']);
xlabel('k');
text(-0.5,11,'solid: x    dashed: h'); hold off

end


% plot x(k) and h(k)

figure, subplot(2,1,1), stem(nx-0.05,x); axis([-5,5,-6,12]);

hold on; stem(nh+0.05,h,'m:')

title('x(k) and h(k)');xlabel('k');

text(-0.5,11,'solid: x    dashed: h'); hold off


% plot x(k) and h(-k)

subplot(2,1,2), stem(nx-0.05,x); axis([-5,5,-6,12]);

hold on; stem(-fliplr(nh)+0.05,fliplr(h),'m:')

title('x(k) and h(-k)');xlabel('k');

text(-0.5,-1,'n=0')

text(-0.5,11,'solid: x    dashed: h'); hold off