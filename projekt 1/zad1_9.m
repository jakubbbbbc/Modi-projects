T = 1;

%1
ulin = -1;
sim('dynamiczny_dyskretny_and_lin',100)
stairs(ans.ydisc.time(:),ans.ydisc.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.ydisc_lin.time(:),ans.ydisc_lin.signals.values(:), 'r','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
xlabel('t[s]');
ylabel('y(t)');
legend('model dyskretny', 'model dyskretny zlinearyzowany', 'Location','east')
print('rysunki/9c1.png','-dpng','-r500');

%2
ulin = 0.1;
sim('dynamiczny_dyskretny_and_lin',100)
stairs(ans.ydisc.time(:),ans.ydisc.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.ydisc_lin.time(:),ans.ydisc_lin.signals.values(:), 'r','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
xlabel('t[s]');
ylabel('y(t)');
legend('model dyskretny', 'model dyskretny zlinearyzowany', 'Location','east')
print('rysunki/9c2.png','-dpng','-r500');

%3
ulin = 0.5;
sim('dynamiczny_dyskretny_and_lin',100)
stairs(ans.ydisc.time(:),ans.ydisc.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.ydisc_lin.time(:),ans.ydisc_lin.signals.values(:), 'r','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
xlabel('t[s]');
ylabel('y(t)');
legend('model dyskretny', 'model dyskretny zlinearyzowany', 'Location','east')
print('rysunki/9c3.png','-dpng','-r500');

%4
ulin = 1;
sim('dynamiczny_dyskretny_and_lin',100)
stairs(ans.ydisc.time(:),ans.ydisc.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.ydisc_lin.time(:),ans.ydisc_lin.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
xlabel('t[s]');
ylabel('y(t)');
legend('model dyskretny', 'model dyskretny zlinearyzowany', 'Location','east')
print('rysunki/9c4.png','-dpng','-r500');