load danedynucz.txt;
u_ucz = danedynucz(:,1);
y_ucz = danedynucz(:,2);

load danedynwer.txt;
u_wer = danedynwer(:,1);
y_wer = danedynwer(:,2);

set(0, 'DefaultLineLineWidth', 1);

figure(1);
tiledlayout(2,1)
nexttile
plot(u_ucz)
set(gca,'fontsize',14);
ylabel('u(k)');
nexttile
plot(y_ucz)
set(gca,'fontsize',14);
xlabel('k');
ylabel('y(k)');
%print('rysunki/2a_ucz.png','-dpng','-r500');

figure(2);
tiledlayout(2,1)
nexttile
plot(u_wer)
set(gca,'fontsize',14);
ylabel('u(k)');
nexttile
plot(y_wer)
set(gca,'fontsize',14);
xlabel('k');
ylabel('y(k)');
%print('rysunki/2a_wer.png','-dpng','-r500');