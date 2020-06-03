init_stat;

P = length(stat_ucz);
M = [stat_ucz(:,1), ones(P,1)];
w=M\stat_ucz(:,2);
a1 = w(1);
a0 = w(2);

%rysowanie
uRys = linspace(-1, 1);
yRys = a1*uRys + a0;

figure(1);
plot(stat_ucz(:,1), stat_ucz(:, 2), 'o', 'LineWidth', 1);
hold on;
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
hold off;
set(gca,'fontsize',14);
legend('dane uczące', 'wyjście modelu liniowego', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1b_ucz.png','-dpng','-r500');

figure(2)
plot(stat_wer(:,1), stat_wer(:, 2), 'ro', 'LineWidth', 1);
hold on;
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
hold off;
set(gca,'fontsize',14);
legend('dane weryfiujące', 'wyjście modelu liniowego', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1b_wer.png','-dpng','-r500');

figure(3)
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
set(gca,'fontsize',14);
ylim([-6 2]);
legend('wyjście modelu liniowego', 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print('rysunki/1b_mod.png','-dpng','-r500');



%błędy

%dane uczące
ymod = zeros(P);
for i = 1:P
    ymod(i) = a1*stat_ucz(i,1) + a0;
end

Eucz=0;
for i=1:P
    Eucz = Eucz+(ymod(i)-stat_ucz(i,2))^2;
end
Eucz = Eucz/P

%dane weryfikujące
ymodw = zeros(P);
for i = 1:P
    ymodw(i) = a1*stat_wer(i,1) + a0;
end

Ewer=0;
for i=1:P
    Ewer = Ewer+(ymodw(i)-stat_wer(i,2))^2;
end
Ewer = Ewer/P


