clear

D = 3; %rząd modelu

load danedynucz.txt;
u_ucz = danedynucz(:,1);
y_ucz = danedynucz(:,2);

P = length(y_ucz);
M = zeros(P-D, 2*D);
for i=1:D
    M(:,i) = u_ucz(D+1-i:P-i);
    M(:,D+i) = y_ucz(D+1-i:P-i);
end
w=M\y_ucz(D+1:P);

y_arx = zeros(P,1);
y_arx(1:D) = y_ucz(1:D);
y_oe = zeros(P,1);
y_oe(1:D) = y_ucz(1:D);

for i=D+1:P
    y_arx(i) = M(i-D,:)*w;
    y_oe(i) = 0;
    for j=1:D
        y_oe(i) = y_oe(i) + u_ucz(i-j)*w(j) + y_oe(i-j)*w(D+j);
    end
end

%błędy
Eucz_arx=0;
for i=D+1:P
    Eucz_arx = Eucz_arx+(y_arx(i)-y_ucz(i))^2;
end
Eucz_arx = Eucz_arx/(P-D);

Eucz_oe=0;
for i=D+1:P
    Eucz_oe = Eucz_oe+(y_oe(i)-y_ucz(i))^2;
end
Eucz_oe = Eucz_oe/(P-D);

%rysowanie
set(0, 'DefaultLineLineWidth', 1.5);

figure(1)
%set(gcf,'Position',[-1200 100 1120 500])
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
%print(['rysunki/2b', num2str(D), '_ucz.png'],'-dpng','-r500');


%dane weryfikujące
load danedynwer.txt;
u_wer = danedynwer(:,1);
y_wer = danedynwer(:,2);

y_arx = zeros(P,1);
y_arx(1:D) = y_wer(1:D);
y_oe = zeros(P,1);
y_oe(1:D) = y_wer(1:D);

for i=D+1:P
    y_arx(i) = 0;
    y_oe(i) = 0;
    for j=1:D
        y_arx(i) = y_arx(i) + u_wer(i-j)*w(j) + y_wer(i-j)*w(D+j);
        y_oe(i) = y_oe(i) + u_wer(i-j)*w(j) + y_oe(i-j)*w(D+j);
    end
end

%błędy
Ewer_arx=0;
for i=D+1:P
    Ewer_arx = Ewer_arx+(y_arx(i)-y_wer(i))^2;
end
Ewer_arx = Ewer_arx/(P-D)

Ewer_oe=0;
for i=D+1:P
    Ewer_oe = Ewer_oe+(y_oe(i)-y_wer(i))^2;
end
Ewer_oe = Ewer_oe/(P-D)

%rysowanie
figure(2)
%set(gcf,'Position',[-1200 100 1120 500])
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
%print(['rysunki/2b', num2str(D), '_wer.png'],'-dpng','-r500');
