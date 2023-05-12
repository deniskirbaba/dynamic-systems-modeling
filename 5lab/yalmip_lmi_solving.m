Q = sdpvar(2);
P = sdpvar(2);
A = [-3 -1; 1 -3];
A1 = [-2 1; 0 -1];

Objective = [P, Q];
Constraints = [[A'*P+P*A+Q A1'*P;A1'*P -Q]<=0, Q>=0, P>=0];

sol = optimize(Constraints, Objective);

value(P), value(Q)