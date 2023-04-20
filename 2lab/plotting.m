X = linspace(0, 6, 1000);
Y = X.^2./3;

buildPlot(X, Y)

function buildPlot(t, x) 
 grid on; 
 xlabel('x'); 
 ylabel('y'); 
 hold on; 
 xlim([-0.5, 10])
 ylim([-0.5, 10])
 plot(t, x, 'LineStyle', '-', 'LineWidth', 1, 'color', 'blue','DisplayName','x^2/3');
 plot(t, x.*0, 'LineStyle','--','color','green','DisplayName','\mu_1=0')
 plot([0 0], [0 10], 'LineStyle','--','color','red','DisplayName','\mu_2=\infty')
 hold off; 
 legend()
end