%plot V(t)+Poisson
eps = 0.01;
c = (1-eps)/eps;
lambda = 3;
t_para = 0:0.05:20;
V_all1 = zeros(1,length(t_para));
V_all2 = zeros(1,length(t_para));
for i=1:length(t_para)
    disp(t_para(i))
    t = t_para(i);
    V_all1(i) = 1/(1+c*exp(-(lambda+1)*t));
    V_all2(i) = 1/(1+c*exp(-lambda*t));
end

%Second-Order ODE with Initial Conditions:numerically
syms v(x)
[V] = odeToVectorField(diff(v, 2) == (3*exp(-v)-1)*diff(v)*(1-diff(v)));
M = matlabFunction(V,'vars', {'t','Y'});
sol = ode45(M,[0 20],[0 0.01]); %(@myODE, tspan, y0);
x_v = linspace(0,20,length(t_para));
y_v = deval(sol,x_v);

figure;
plot(t_para,log(V_all1),'b-','LineWidth',2);
hold on;
plot(t_para,log(V_all2),'g-','LineWidth',2);
hold on;
plot(x_v, log(y_v(2,:)),'r-','LineWidth',2);
legend('Random Matching','Textbook Network','Our Network');
xlabel('t');
ylabel('log(V(t))');
title('Plot of V(t) with Poisson');
ylim([-5 0]);

%plot X(t)+Poisson
eps = 0.01;
lambda = 3;
d = 3;
c = (1-eps)/eps;
t_para = 0:0.05:20;
X_all1 = zeros(1,length(t_para));
X_all2 = zeros(1,length(t_para));
X_all3 = zeros(1,length(t_para));
for i=1:length(t_para)
    disp(t_para(i))
    t = t_para(i);
    syms s
    vpart1 = int(1/(1+c*exp(-(lambda+1)*s)),s,0,t);
    vpart2 = int(1/(1+c*exp(-lambda*s)),s,0,t);
    vpart3 = y_v(1,i);
    X_all1(i) = 1-(1-eps)*exp(-d*vpart1);
    X_all2(i) = 1-(1-eps)*exp(-d*vpart2);
    X_all3(i) = 1-(1-eps)*exp(-d*vpart3);
end

figure;
plot(t_para,X_all1,'b-','LineWidth',2);
hold on;
plot(t_para,X_all2,'g-','LineWidth',2);
hold on;
plot(t_para, X_all3,'r-','LineWidth',2);
legend('Random Matching','Textbook Network','Our Network');
xlabel('t');
ylabel('X(t)');
title('Plot of X(t) with Poisson');
%ylim([-5 0]);