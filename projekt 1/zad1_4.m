func = @(u) K*(a1*u+a2*u.^2+a3*u.^3+a4*u.^4);
fplot(func, [-1 1], 'b','Linewidth',1.5);
set(gca,'fontsize',12);
xlabel('u');
ylabel('y_s_t_a_t (u)');
ylim([-4 1]);
print('rysunki/4.png','-dpng','-r500');