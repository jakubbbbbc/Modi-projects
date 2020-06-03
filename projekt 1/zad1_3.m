set(0,'defaultLineLineWidth',1.5);

%duży czas próbkowania
T=3;
sim('dynamiczny_ciagly_dyskretny',100)
%y(t) graph for continuous
plot(ans.ycont.time(:),ans.ycont.signals.values(:), 'b');
hold on;
stairs(ans.ydisc.time(:),ans.ydisc.signals.values(:), 'r','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
xlabel('t[s]');
ylabel('y(t)');
ylim([-1.2 0.05]);
legend('model ciągły', 'model dyskretny: T=3s', 'Location','northeast')
%print('rysunki/3a.png','-dpng','-r500');

%średni czas próbkowania
T=1;
sim('dynamiczny_ciagly_dyskretny',100)
%y(t) graph for continuous
plot(ans.ycont.time(:),ans.ycont.signals.values(:), 'b');
hold on;
stairs(ans.ydisc.time(:),ans.ydisc.signals.values(:), 'r','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
xlabel('t[s]');
ylabel('y(t)');
ylim([-1.2 0.05]);
legend('model ciągły', 'model dyskretny: T=1s', 'Location','northeast')
%print('rysunki/3b.png','-dpng','-r500');

%mały czas próbkowania
T=0.1;
sim('dynamiczny_ciagly_dyskretny',100)
%y(t) graph for continuous
plot(ans.ycont.time(:),ans.ycont.signals.values(:), 'b');
hold on;
stairs(ans.ydisc.time(:),ans.ydisc.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
xlabel('t[s]');
ylabel('y(t)');
ylim([-1.2 0.05]);
legend('model ciągły', 'model dyskretny: T=0.1s', 'Location','northeast')
%print('rysunki/3c.png','-dpng','-r500');