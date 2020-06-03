init_stat;
P = length(stat_ucz);
N=4;

M = zeros(P, N+1);
M(:,1) = 1;
 for i=1:N
     M(:,i+1) = stat_ucz(:,1).^i;
 end
 w=M\stat_ucz(:,2);

%rysowanie
uRys = linspace(-1, 1);
yRys = 0;
for i=1:N+1
   yRys = yRys +  w(i)*uRys.^(i-1);
end

figure(1);
plot(stat_ucz(:,1), stat_ucz(:, 2), 'o', 'LineWidth', 1);
hold on;
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
hold off;
set(gca,'fontsize',14);
legend('dane uczące', ['wyjście modelu nieliniowego, N=', num2str(N)], 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print(['rysunki/1c', num2str(N), '_ucz.png'],'-dpng','-r500');

figure(2)
plot(stat_wer(:,1), stat_wer(:, 2), 'ro', 'LineWidth', 1);
hold on;
plot(uRys, yRys, 'b', 'LineWidth', 1.5);
hold off;
set(gca,'fontsize',14);
legend('dane weryfikujące', ['wyjście modelu nieliniowego, N=', num2str(N)], 'Location', 'southeast');
xlabel('u');
ylabel('y (u)');
%print(['rysunki/1c', num2str(N), '_wer.png'],'-dpng','-r500');

%błędy
%dane uczące
ymod = M*w;
Eucz=0;
for i=1:P
    Eucz = Eucz+(ymod(i)-stat_ucz(i,2))^2;
end
Eucz = Eucz/P

%dane weryfikujące
Mwer = zeros(P, N+1);
Mwer(:,1) = 1;
 for i=1:N
     Mwer(:,i+1) = stat_wer(:,1).^i;
 end
ymod_wer = Mwer*w;
Ewer=0;
for i=1:P
    Ewer = Ewer+(ymod_wer(i)-stat_wer(i,2))^2;
end
Ewer = Ewer/P




