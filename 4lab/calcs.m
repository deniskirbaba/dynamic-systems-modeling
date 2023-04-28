num = [2 -1];
den = [1 3 2];

rts = roots(den)
h_critical = min(2*abs(real(rts))./abs(rts).^2)

h_low = h_critical-0.1
h_high = h_critical + 0.1

% sys = tf([2 -1], [1 3 2]);
% h = stepplot(sys);
% setoptions(h,'Grid','on');

h = h_high;
sys = tf(num, den);

numEuler = [2*h -(h^2+2*h)];
denEuler = [1 (3*h-2) (1-3*h+2*h^2)];
sysEuler = tf(numEuler, denEuler, h)

figure
stepplot(sys,25)
hold on
grid on
stepplot(sysEuler,25)