init_stat;
P = length(stat_ucz);

%N=2
M = [ones(P,1), stat_ucz(:,1), stat_ucz(:,1).^2];
w=M\stat_ucz(:,2);

%rysowanie
uRys = linspace(-1, 1);
yRys = w(1) + w(2)*uRys + w(3)*uRys.^2;

figure(1);
plot(stat_ucz(:,1), stat_ucz(:, 2), 'o', 'LineWidth', 1);
hold on;
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
hold off;
set(gca,'fontsize',14);
legend('dane uczące', 'wyjście modelu nieliniowego, N=2', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1c2_ucz.png','-dpng','-r500');

figure(2)
plot(stat_wer(:,1), stat_wer(:, 2), 'ro', 'LineWidth', 1);
hold on;
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
hold off;
set(gca,'fontsize',14);
legend('dane weryfiujące', 'wyjście modelu nieliniowego, N=2', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1c2_wer.png','-dpng','-r500');

figure(3)
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
set(gca,'fontsize',14);
ylim([-6 2]);
legend('wyjście modelu nieliniowego, N=2', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1c2_mod.png','-dpng','-r500');

%błędy
%dane uczące
%ymod = zeros(P);
ymod = M*w;
%for i = 1:P
%    ymod(i) = w(1)*stat_ucz(i,1).^2 + w(2)*stat_ucz(i,1) + w(3);
%end
Eucz2=0;
for i=1:P
    Eucz2 = Eucz2+(ymod(i)-stat_ucz(i,2))^2;
end
Eucz2 = Eucz2/P

%dane weryfikujące
ymodw = zeros(P);
for i = 1:P
    ymodw(i) = w(1) + w(2)*stat_wer(i,1) + w(3)*stat_wer(i,1).^2;
end
Ewer2=0;
for i=1:P
    Ewer2 = Ewer2+(ymodw(i)-stat_wer(i,2))^2;
end
Ewer2 = Ewer2/P

%{
%N=3
M = [stat_ucz(:,1).^3 ,stat_ucz(:,1).^2 ,stat_ucz(:,1), ones(P,1)];
w=M\stat_ucz(:,2);

%rysowanie
uRys = linspace(-1, 1);
yRys = w(1)*uRys.^3 + w(2)*uRys.^2 + w(3)*uRys + w(4);

figure(4);
plot(stat_ucz(:,1), stat_ucz(:, 2), 'o', 'LineWidth', 1);
hold on;
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
hold off;
set(gca,'fontsize',14);
legend('dane uczące', 'wyjście modelu nieliniowego, N=3', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1c3_ucz.png','-dpng','-r500');

figure(5)
plot(stat_wer(:,1), stat_wer(:, 2), 'ro', 'LineWidth', 1);
hold on;
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
hold off;
set(gca,'fontsize',14);
legend('dane weryfiujące', 'wyjście modelu nieliniowego, N=3', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1c3_wer.png','-dpng','-r500');

figure(6)
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
set(gca,'fontsize',14);
ylim([-6 2]);
legend('wyjście modelu nieliniowego, N=3', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1c3_mod.png','-dpng','-r500');

%błędy
%dane uczące
ymod = zeros(P);
for i = 1:P
    ymod(i) = w(2)*stat_ucz(i,1).^2 + w(3)*stat_ucz(i,1) + w(4);
end
Eucz2=0;
for i=1:P
    Eucz2 = Eucz2+(ymod(i)-stat_ucz(i,2))^2;
end
Eucz2 = Eucz2/P

%dane weryfikujące
ymodw = zeros(P);
for i = 1:P
    ymodw(i) = w(1)*stat_wer(i,1).^2 + w(2)*stat_wer(i,1) + w(3);
end
Ewer2=0;
for i=1:P
    Ewer2 = Ewer2+(ymodw(i)-stat_wer(i,2))^2;
end
Ewer2 = Ewer2/P
%}




