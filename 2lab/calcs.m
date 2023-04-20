A_lin = [-3 1; -1 -3];

B = eye(2);
C = eye(2);
D = zeros(2);

x_initial = [-3; 2];
t = [0 5]; 

% [t, X] = ode45(@lin, t, x_initial); 
% buildPlot(t, X); 

[t, X] = ode45(@non_lin, t, x_initial); 
buildPlot(t, X); 

% Linearized system
function dxdt = lin(~, X) 
 dx1 = -3*X(1) + 1*X(2); 
 dx2 = -1*X(1) - 3*X(2); 
 dxdt = [dx1; dx2]; 
end 

% Non-linear system
function dxdt = non_lin(~, X) 
 dx1 = -3*X(1) + X(2); 
 dx2 = -X(1) - 2*X(2) - X(2)/(1 + abs(X(2))); 
 dxdt = [dx1; dx2]; 
end 

function buildPlot(t, x) 
 grid on; 
 xlabel('\bf Time (seconds)'); 
 ylabel('\bf States'); 
 hold on; 
 plot(t, x(:,1), 'LineStyle', '-', 'LineWidth', 1, 'color', 'blue'); 
 plot(t, x(:,2), 'LineStyle', '--', 'LineWidth', 1, 'color', 'magenta'); 
 hold off; 
 legend('x','y','Location','northeast');
end