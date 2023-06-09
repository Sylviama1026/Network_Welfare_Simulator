I = 1000;
x = 2;
c = 1;
r = 1;
y = (x-c)/r;
benchmark = repelem((0.5*(x+y)-c),11) ;

k_star = r*y/(c/0.5-x)-r;
V_all = zeros(1,length(11));

%K=100
L = 900;
l = 0.00228;
k = 0.00014;
V_all(11) = double(f_V(l, k, I, L, x, c, r));

%K=70
L = 930;
l = 0.00250;
k = 0.00010;
V_all(10) = double(f_V(l, k, I, L, x, c, r));

%K=40
L = 960;
l = 0.00295;
k = 0.00006;
V_all(9) = double(f_V(l, k, I, L, x, c, r));

%K=30
L = 970;
l = 0.00328;
k = 0.00004;
V_all(8) = double(f_V(l, k, I, L, x, c, r));

%K=25
L = 975;
l = 0.00356;
k = 0.00003;
V_all(7) = double(f_V(l, k, I, L, x, c, r));

%K=20
L = 980;
l = 0.00404;
k = 0.00002;
V_all(6) = double(f_V(l, k, I, L, x, c, r));

%K=15
L = 985;
l = 0.00511;
k = 0.00001;
V_all(5) = double(f_V(l, k, I, L, x, c, r));

%K=10
L = 990;
l = 0.00885;
k = 0;
V_all(4) = double(f_V(l, k, I, L, x, c, r));

%K=5
L = 995;
l = 0.02653;
k = 0;
V_all(3) = double(f_V(l, k, I, L, x, c, r));

%K=2
L = 998;
l = 0.09393;
k = 0;
V_all(2) = double(f_V(l, k, I, L, x, c, r));

%K=1
L = 999;
l = 0.2032;
k = 0;
V_all(1) = double(f_V(l, k, I, L, x, c, r));

x1 = [1, 2, 5, 10, 15, 20, 25, 30, 40, 70, 100];
y1 = V_all;

figure;
scatter(x1,y1,40,'filled');
ylim([0 0.6]);
hold on;
plot(x1,benchmark,'r--','LineWidth',1);
legend('V','V_{benchmark}');
%legend('V(tau_l,B_l)');
xlabel('K');
ylabel('Welfare:V');
title('Plot of welfare for different K');