ystat = @(u) K*(a1*u+a2*u.^2+a3*u.^3+a4*u.^4);

ulin = -1;
%ulin = 0;
%ulin = 0.5;
%ulin = 1;
ystatlin = @(u) K*(a1*ulin+a2*ulin.^2+a3*ulin.^3+a4*ulin.^4)+ K*(a1+2*a2*ulin+3*a3*ulin.^2+4*a4*ulin.^3)*(u-ulin);

fplot(ystat, [-1 1], 'b','Linewidth',1.5);
hold on;
fplot(ystatlin, [-1 1], 'r','Linewidth',1.5);
hold off;
set(gca,'fontsize',12);
xlabel('u');
ylabel('y_s_t_a_t (u)');
ylim([-4 1]);
legend('charakterystyka statyczna y(u)', 'linearyzacja charakterystyki statycznej: u_l_i_n= -1', 'Location','southeast')

print('rysunki/6a.png','-dpng','-r500');