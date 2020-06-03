clear

D = 2; % rząd modelu (ile do tyłu)
N = 4; % rząd wielomianu

typ = 10*D + N; %typ modelu

load danedynucz.txt;
u_ucz = danedynucz(:,1);
y_ucz = danedynucz(:,2);

P = length(y_ucz);
if typ == 12
    M = [u_ucz(1:P-1) u_ucz(1:P-1).^2 y_ucz(1:P-1) y_ucz(1:P-1).^2];
end
if typ == 13
    M = [u_ucz(1:P-1) u_ucz(1:P-1).^2 u_ucz(1:P-1).^3 y_ucz(1:P-1) y_ucz(1:P-1).^2 y_ucz(1:P-1).^3];
end
if typ == 14
    M = [u_ucz(1:P-1) u_ucz(1:P-1).^2 u_ucz(1:P-1).^3 u_ucz(1:P-1).^4 y_ucz(1:P-1) y_ucz(1:P-1).^2 y_ucz(1:P-1).^3 y_ucz(1:P-1).^4];
end
if typ == 15
    M = [u_ucz(1:P-1) u_ucz(1:P-1).^2 u_ucz(1:P-1).^3 u_ucz(1:P-1).^4 u_ucz(1:P-1).^5 y_ucz(1:P-1) y_ucz(1:P-1).^2 y_ucz(1:P-1).^3 y_ucz(1:P-1).^4 y_ucz(1:P-1).^5];
end
if typ == 22
    M = [u_ucz(2:P-1) u_ucz(2:P-1).^2 u_ucz(1:P-2) u_ucz(1:P-2).^2 y_ucz(2:P-1) y_ucz(2:P-1).^2 y_ucz(1:P-2) y_ucz(1:P-2).^2];
end
if typ == 23
    M = [u_ucz(2:P-1) u_ucz(2:P-1).^2 u_ucz(2:P-1).^3 u_ucz(1:P-2) u_ucz(1:P-2).^2 u_ucz(1:P-2).^3 y_ucz(2:P-1) y_ucz(2:P-1).^2 y_ucz(2:P-1).^3 y_ucz(1:P-2) y_ucz(1:P-2).^2 y_ucz(1:P-2).^3];
end
if typ == 24
    M = [u_ucz(2:P-1) u_ucz(2:P-1).^2 u_ucz(2:P-1).^3 u_ucz(2:P-1).^4 u_ucz(1:P-2) u_ucz(1:P-2).^2 u_ucz(1:P-2).^3 u_ucz(1:P-2).^4 y_ucz(2:P-1) y_ucz(2:P-1).^2 y_ucz(2:P-1).^3 y_ucz(2:P-1).^4 y_ucz(1:P-2) y_ucz(1:P-2).^2 y_ucz(1:P-2).^3 y_ucz(1:P-2).^4];
end

w=M\y_ucz(D+1:P);

%dane uczące
y_arx = zeros(P,1);
y_arx(1:D) = y_ucz(1:D);
y_oe = zeros(P,1);
y_oe(1:D) = y_ucz(1:D);

for k=D+1:P
    if typ == 12
        y_arx(k) = [u_ucz(k-1) u_ucz(k-1).^2 y_ucz(k-1) y_ucz(k-1).^2]*w;
        y_oe(k) = [u_ucz(k-1) u_ucz(k-1).^2 y_oe(k-1) y_oe(k-1).^2]*w;
    end
    if typ == 13
        y_arx(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 y_ucz(k-1) y_ucz(k-1).^2 y_ucz(k-1).^3]*w;
        y_oe(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3]*w;
    end
    if typ == 14
        y_arx(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 u_ucz(k-1).^4 y_ucz(k-1) y_ucz(k-1).^2 y_ucz(k-1).^3 y_ucz(k-1).^4]*w;
        y_oe(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 u_ucz(k-1).^4 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3 y_oe(k-1).^4]*w;
    end
    if typ == 15
        y_arx(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 u_ucz(k-1).^4 u_ucz(k-1).^5 y_ucz(k-1) y_ucz(k-1).^2 y_ucz(k-1).^3 y_ucz(k-1).^4 y_ucz(k-1).^5]*w;
        y_oe(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 u_ucz(k-1).^4 u_ucz(k-1).^5 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3 y_oe(k-1).^4 y_oe(k-1).^5]*w;
    end
    if typ == 22
        y_arx(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-2) u_ucz(k-2).^2 y_ucz(k-1) y_ucz(k-1).^2 y_ucz(k-2) y_ucz(k-2).^2]*w;
        y_oe(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-2) u_ucz(k-2).^2 y_oe(k-1) y_oe(k-1).^2 y_oe(k-2) y_oe(k-2).^2]*w;
    end
    if typ == 23
        y_arx(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 u_ucz(k-2) u_ucz(k-2).^2 u_ucz(k-2).^3 y_ucz(k-1) y_ucz(k-1).^2 y_ucz(k-1).^3 y_ucz(k-2) y_ucz(k-2).^2 y_ucz(k-2).^3]*w;
        y_oe(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 u_ucz(k-2) u_ucz(k-2).^2 u_ucz(k-2).^3 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3 y_oe(k-2) y_oe(k-2).^2 y_oe(k-2).^3]*w;
    end
    if typ == 24
        y_arx(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 u_ucz(k-1).^4 u_ucz(k-2) u_ucz(k-2).^2 u_ucz(k-2).^3 u_ucz(k-2).^4 y_ucz(k-1) y_ucz(k-1).^2 y_ucz(k-1).^3 y_ucz(k-1).^4 y_ucz(k-2) y_ucz(k-2).^2 y_ucz(k-2).^3 y_ucz(k-2).^4]*w;
        y_oe(k) = [u_ucz(k-1) u_ucz(k-1).^2 u_ucz(k-1).^3 u_ucz(k-1).^4 u_ucz(k-2) u_ucz(k-2).^2 u_ucz(k-2).^3 u_ucz(k-2).^4 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3 y_oe(k-1).^4 y_oe(k-2) y_oe(k-2).^2 y_oe(k-2).^3 y_oe(k-2).^4]*w;
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
%print(['rysunki/2b', num2str(N), num2str(W),'_ucz.png'],'-dpng','-r500');

% dane weryfikujące
load danedynwer.txt;
u_wer = danedynwer(:,1);
y_wer = danedynwer(:,2);

y_arx = zeros(P,1);
y_arx(1:D) = y_wer(1:D);
y_oe = zeros(P,1);
y_oe(1:D) = y_wer(1:D);

for k=D+1:P
    if typ == 12
        y_arx(k) = [u_wer(k-1) u_wer(k-1).^2 y_wer(k-1) y_wer(k-1).^2]*w;
        y_oe(k) = [u_wer(k-1) u_wer(k-1).^2 y_oe(k-1) y_oe(k-1).^2]*w;
    end
    if typ == 13
        y_arx(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 y_wer(k-1) y_wer(k-1).^2 y_wer(k-1).^3]*w;
        y_oe(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3]*w;
    end
    if typ == 14
        y_arx(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 u_wer(k-1).^4 y_wer(k-1) y_wer(k-1).^2 y_wer(k-1).^3 y_wer(k-1).^4]*w;
        y_oe(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 u_wer(k-1).^4 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3 y_oe(k-1).^4]*w;
    end
    if typ == 15
        y_arx(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 u_wer(k-1).^4 u_wer(k-1).^5 y_wer(k-1) y_wer(k-1).^2 y_wer(k-1).^3 y_wer(k-1).^4 y_wer(k-1).^5]*w;
        y_oe(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 u_wer(k-1).^4 u_wer(k-1).^5 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3 y_oe(k-1).^4  y_oe(k-1).^5]*w;
    end
    if typ == 22
        y_arx(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-2) u_wer(k-2).^2 y_wer(k-1) y_wer(k-1).^2 y_wer(k-2) y_wer(k-2).^2]*w;
        y_oe(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-2) u_wer(k-2).^2 y_oe(k-1) y_oe(k-1).^2 y_oe(k-2) y_oe(k-2).^2]*w;
    end
    if typ == 23
        y_arx(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 u_wer(k-2) u_wer(k-2).^2 u_wer(k-2).^3 y_wer(k-1) y_wer(k-1).^2 y_wer(k-1).^3 y_wer(k-2) y_wer(k-2).^2 y_wer(k-2).^3]*w;
        y_oe(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 u_wer(k-2) u_wer(k-2).^2 u_wer(k-2).^3 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3 y_oe(k-2) y_oe(k-2).^2 y_oe(k-2).^3]*w;
    end
    if typ == 24
        y_arx(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 u_wer(k-1).^4 u_wer(k-2) u_wer(k-2).^2 u_wer(k-2).^3 u_wer(k-2).^4 y_wer(k-1) y_wer(k-1).^2 y_wer(k-1).^3 y_wer(k-1).^4 y_wer(k-2) y_wer(k-2).^2 y_wer(k-2).^3 y_wer(k-2).^4]*w;
        y_oe(k) = [u_wer(k-1) u_wer(k-1).^2 u_wer(k-1).^3 u_wer(k-1).^4 u_wer(k-2) u_wer(k-2).^2 u_wer(k-2).^3 u_wer(k-2).^4 y_oe(k-1) y_oe(k-1).^2 y_oe(k-1).^3 y_oe(k-1).^4 y_oe(k-2) y_oe(k-2).^2 y_oe(k-2).^3 y_oe(k-2).^4]*w;
    end
end

%błędy
Eucz_arx=0;
for k=D+1:P
    Eucz_arx = Eucz_arx+(y_arx(k)-y_wer(k))^2;
end
Eucz_arx = Eucz_arx/(P-D)

Eucz_oe=0;
for k=D+1:P
    Eucz_oe = Eucz_oe+(y_oe(k)-y_wer(k))^2;
end
Eucz_oe = Eucz_oe/(P-D)

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
%print(['rysunki/2b', num2str(N), num2str(W),'_wer.png'],'-dpng','-r500');

