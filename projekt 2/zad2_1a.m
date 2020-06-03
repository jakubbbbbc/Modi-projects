
init_stat;

set(0, 'DefaultLineLineWidth', 1);

figure(1);
plot(stat(:,1), stat(:, 2), 'o');
set(gca,'fontsize',14);
xlabel('u');
ylabel('y (u)');
%print('rysunki/1a1.png','-dpng','-r500');

figure(2);
plot(stat_ucz(:,1), stat_ucz(:, 2), 'o');
set(gca,'fontsize',14);
xlabel('u');
ylabel('y (u)');
%print('rysunki/1a_ucz.png','-dpng','-r500');

figure(3);
plot(stat_wer(:,1), stat_wer(:, 2), 'ro');
set(gca,'fontsize',14);
xlabel('u');
ylabel('y (u)');
%print('rysunki/1a_wer.png','-dpng','-r500');