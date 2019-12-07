%% THIS IS THE RUN FILE
%% Inputs
M = 176;
N = 218;
border = 2; 
n = 20;
w1 = 5;
w2 = 10;
alpha = 2;
max_iterations=1000;
Vb = 100:230;
Vf = 25:50;

random_rectangles(M,N,border,n,w1,w2,alpha,max_iterations,Vf,Vb);
