clear all;
close all;
clc;

%Input patterns
I=[1 1 1 -1 1 -1 1 1 1];
O=[1 1 1 1 -1 1 1 1 1];

%Target 
t=[1; -1];

%training Phase 
n=length(I);

%Conversion of Input Patterns into a single matrix 'x'
x(1,1:n)=I;
x(2,1:n)=O;

%Intitialization of weights of inputs
w_old=zeros(1,n);

%Intialization of bias weight 
w0_old=0;

%Bias input
x0=1;

%Computaton of new weights
for i=1:2
    w_new=w_old + x(i,1:n) * t(i)
    w0_new=w0_old + x0*t(i)
    
    w_old=w_new;
    w0_old=w0_new;
end;
disp(w0_new)
disp(w_new)

%Testing Phase
pattern=input('Enter the pattern (I or O)=');
ynet = pattern*w_new' + x0*w0_new
disp(pattern)

if ynet >=0
    output=1;
else
    output=-1;
end

disp (output);
    
    