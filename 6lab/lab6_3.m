
%% Homework 6: exercise 3.3

%% Finding K

load('Pval');
P = Pval;
AplusK = sdpvar(2,2);
A = [2 -2; 1 3];
A1 = [-4 0; -1 -5];
Q = sdpvar(2,2);


TH=blkvar;

TH(1,1) = ((AplusK)')*P + P*AplusK+Q;
TH(1,2) = (A1')*P;
TH(2,2) = -Q;

F = [TH<=-0.0001, Q>=0.0001];

options=sdpsettings('solver','sedumi','verbose',0);

sol=optimize(F)

AplusK = value(AplusK);
K = AplusK - A;




