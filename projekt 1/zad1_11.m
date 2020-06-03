func = @(ulin) 3.2*ulin.^3-3*ulin.^2-6.4*ulin+2.24;
fplot(func, [-1.5 2], 'b','Linewidth',1.5);
set(gca,'fontsize',12);
xlabel('u_l_i_n');
ylabel('K_s_t_a_t (u_l_i_n)');
ylim([-6 5]);
%print('rysunki/11.png','-dpng','-r500');