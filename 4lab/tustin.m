num = [2 -1];
den = [1 3 2];

h = 1.2;
sys = tf(num, den);

numTustin = [(4*h-h^2) (4-4*h) (-11.22)];
denTustin = [(2*h^2+6*h+4) (h+2) 0];
sysTustin = tf(numTustin, denTustin, h);

figure
stepplot(sys,25)
hold on
grid on
stepplot(sysTustin,25)