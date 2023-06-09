%plot V(t)+M
eps = 0.01;
c = (1-eps)/eps;
t_para = 0:0.5:20;
V_all1 = zeros(1,length(t_para));
V_all2 = zeros(1,length(t_para));
V_all3 = zeros(1,length(t_para));
for i=1:length(t_para)
    disp(t_para(i))
    t = t_para(i);
    V_all1(i) = 1/(1+c*exp(-t));
    V_all2(i) = eps;
    V_all3(i) = 1/(1+c*exp(t));
end
figure;
plot(t_para,log(V_all1),'b-','LineWidth',2);
hold on;
plot(t_para,log(V_all2),'g-','LineWidth',2);
hold on;
plot(t_para,log(V_all3),'r-','LineWidth',2);
legend('Random Matching','Textbook Network','Our Network');
xlabel('t');
ylabel('log(V(t))');
title('Plot of V(t) with Monogamy');
ylim([-10 0]);

%plot X(t)+M
eps = 0.01;
d = 1; %M dis
c = (1-eps)/eps;
t_para = 0:0.5:20;
X_all1 = zeros(1,length(t_para));
X_all2 = zeros(1,length(t_para));
X_all3 = zeros(1,length(t_para));
for i=1:length(t_para)
    disp(t_para(i))
    t = t_para(i);
    syms s
    vpart1 = int(1/(1+c*exp(-s)),s,0,t);
    vpart3 = int(1/(1+c*exp(s)),s,0,t);
    X_all1(i) = 1-(1-eps)*exp(-d*vpart1);
    X_all2(i) = 1-(1-eps)*exp(-d*eps*t);
    X_all3(i) = 1-(1-eps)*exp(-d*vpart3);
end

figure;
plot(t_para,log(X_all1),'b-','LineWidth',2);
hold on;
plot(t_para,log(X_all2),'g-','LineWidth',2);
hold on;
plot(t_para,log(X_all3),'r-','LineWidth',2);
legend('Random Matching','Textbook Network','Our Network');
xlabel('t');
ylabel('log(X(t))');
title('Plot of X(t) with Monogamy');
ylim([-10 0]);