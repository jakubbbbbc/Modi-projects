clear

global D N u w

% y0=0.036553745;
y0= 0;

D = 2; % rząd modelu (ile do tyłu)
N = 2; % rząd wielomianu

load danedynucz.txt;
u_ucz = danedynucz(:,1);
y_ucz = danedynucz(:,2);

P = length(y_ucz);
M = zeros(P-D, 2*N*D);
k=1;
for i=1:D
   for j=1:N
      M(:, k) =  u_ucz(D+1-i:P-i).^j;
      M(:, D*N+k) =  y_ucz(D+1-i:P-i).^j;
      k=k+1;
   end
end

w=M\y_ucz(D+1:P);


u_wart = linspace(-1,1,50);
%y_wart = zeros(1, length(u_wart));
for i=1:length(u_wart)
    u = u_wart(i);
    %y0 = 0;
    y_wart(i) = fsolve(@func, y0);
end

set(0, 'DefaultLineLineWidth', 1.5);
figure(1)
plot(u_wart, y_wart, '-')
set(gca,'fontsize',14);
xlabel('u');
ylabel('y (u)');
% print('rysunki/2d.png','-dpng','-r500');

function F=func(y)

global D N u w
F=-y;
k=1;
global u
for i=1:D
    for j=1:N
        F= F + w(k)*u^j + w(D*N+k)*y^j;
        k=k+1;
    end
end
end

