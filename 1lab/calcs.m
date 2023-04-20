A = [-2 8 2;
     3 -4 6;
     3 5 -4];
eig_A = eig(A);
B = eye(3);
C = eye(3);
D = zeros(3);

x_initial = [-1; 4; 10];
u = [0; 0; 0];
k = -max(eig_A);

A_new = A + k*B
eig_new_A = eig(A_new)