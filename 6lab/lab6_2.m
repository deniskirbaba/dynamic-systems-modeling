% Descriptor method

A = [2 -2; 1 3];
A1 = [-4 0; -1 -5];
Q = A+A1;

%Variables
P = sdpvar(2,2);
R = sdpvar(2,2);
P2 = sdpvar(2,2);
P3 = sdpvar(2,2);


%delay
h=0.221;

TH = blkvar;

TH(1,1) = (P2')*Q+(Q')*P2;
TH(1,2) = P - P2'+(Q')*P3;
TH(1,3) = -h*(P2')*A1;
TH(2,2) = -P3-P3'+h*R;
TH(2,3) = -h*(P3')*A1;
TH(3,3) = -h*R;

TH=sdpvar(TH);

F=[TH<=-0.0001, R>=0.0001, P>=0.0001];

options=sdpsettings('solver','sedumi','verbose',0);

sol=optimize(F)

Pval = value(P);

save('Pval');

eig(Pval)