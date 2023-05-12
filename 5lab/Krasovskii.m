clc;
clear all;

A = [-3 -1; 1 -3];
A1 = [-2 1; 0 -1];
n=2;            

P=sdpvar(n);   
Q=sdpvar(n);
TH=blkvar;       
TH(1,1)=A'*P+P*A+Q;
TH(1,2)=P*A1;
TH(2,2)=-Q;
TH=sdpvar(TH);


F=[TH<=-0.0001,P>=0.0001,Q>=0.0001];
%������ ���������
options=sdpsettings('solver','sedumi','verbose',0);
%������ ������
sol=optimize(F)
%� ��������� ���� ������� ���������� � ���, ��������� �� �������� ���������
%����������. � ������ ������ �����: "info: 'Successfully solved
%(SeDuMi-1.3)'". ������ ������� ��������� ���������� ���������, � ��������
%������� ���������.

value(P), value(Q)
 