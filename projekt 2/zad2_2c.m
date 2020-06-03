clear

D = 4; % rząd modelu (ile do tyłu)
N = 4; % rząd wielomianu

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

%dane uczące
y_arx = zeros(P,1);
y_arx(1:D) = y_ucz(1:D);
y_oe = zeros(P,1);
y_oe(1:D) = y_ucz(1:D);

for k=D+1:P
    y_arx(k) = 0;
    y_oe(k) = 0;
    licz=1;
    for i=1:D
        for j=1:N
            y_arx(k) = y_arx(k) + u_ucz(k-i).^j*w(licz) + y_ucz(k-i)^j*w(D*N+licz);
            y_oe(k) = y_oe(k) + u_ucz(k-i).^j*w(licz) + y_oe(k-i)^j*w(D*N+licz);
            licz=licz+1;
        end
    end
end

%błędy
Eucz_arx=0;
for k=D+1:P
    Eucz_arx = Eucz_arx+(y_arx(k)-y_ucz(k))^2;
end
Eucz_arx = Eucz_arx/(P-D)

Eucz_oe=0;
for k=D+1:P
    Eucz_oe = Eucz_oe+(y_oe(k)-y_ucz(k))^2;
end
Eucz_oe = Eucz_oe/(P-D)

%rysowanie
set(0, 'DefaultLineLineWidth', 1.5);
figure(1)
% set(gcf,'Position',get(gcf,'Position')+[0 -50 560 80]);
tiledlayout(2,1)
nexttile
plot(y_ucz)
hold on
plot(y_arx, '--r')
hold off
set(gca,'fontsize',14)
ylabel('y(k)')
nexttile
plot(y_ucz)
hold on
plot(y_oe, '--r')
hold off
set(gca,'fontsize',14)
xlabel('k')
ylabel('y(k)')
% print(['rysunki/2c', num2str(D), num2str(N),'_uczącego.png'],'-dpng','-r500');

% dane weryfikujące
load danedynwer.txt;
u_wer = danedynwer(:,1);
y_wer = danedynwer(:,2);

y_arx = zeros(P,1);
y_arx(1:D) = y_wer(1:D);
y_oe = zeros(P,1);
y_oe(1:D) = y_wer(1:D);

for k=D+1:P
    y_arx(k) = 0;
    y_oe(k) = 0;
    licz=1;
    for i=1:D
        for j=1:N
            y_arx(k) = y_arx(k) + u_wer(k-i).^j*w(licz) + y_wer(k-i)^j*w(D*N+licz);
            y_oe(k) = y_oe(k) + u_wer(k-i).^j*w(licz) + y_oe(k-i)^j*w(D*N+licz);
            licz=licz+1;
        end
    end
end
%błędy
Ewer_arx=0;
for k=D+1:P
    Ewer_arx = Ewer_arx+(y_arx(k)-y_wer(k))^2;
end
Ewer_arx = Ewer_arx/(P-D)

Ewer_oe=0;
for k=D+1:P
    Ewer_oe = Ewer_oe+(y_oe(k)-y_wer(k))^2;
end
Ewer_oe = Ewer_oe/(P-D)

%rysowanie
figure(2)
% set(gcf,'Position',get(gcf,'Position')+[0 -50 560 80]);
tiledlayout(2,1)
nexttile
plot(y_wer)
hold on
plot(y_arx, '--r')
hold off
set(gca,'fontsize',14)
ylabel('y(k)')
nexttile
plot(y_wer)
hold on
plot(y_oe, '--r')
hold off
set(gca,'fontsize',14)
xlabel('k')
ylabel('y(k)')
% print(['rysunki/2c', num2str(D), num2str(N),'_weryfikującego.png'],'-dpng','-r500');

