B_inf=[];
%K=100
L = 900;
l = 0.00228;
k = 0.00014;
B_inf(11) = k*(1000-L)+l*L;

%K=70
L = 930;
l = 0.00250;
k = 0.00010;
B_inf(10) = k*(1000-L)+l*L;

%K=40
L = 960;
l = 0.00295;
k = 0.00006;
B_inf(9) = k*(1000-L)+l*L;

%K=30
L = 970;
l = 0.00328;
k = 0.00004;
B_inf(8) = k*(1000-L)+l*L;

%K=25
L = 975;
l = 0.00356;
k = 0.00003;
B_inf(7) = k*(1000-L)+l*L;

%K=20
L = 980;
l = 0.00404;
k = 0.00002;
B_inf(6) = k*(1000-L)+l*L;

%K=15
L = 985;
l = 0.00511;
k = 0.00001;
B_inf(5) = k*(1000-L)+l*L;

%K=10
L = 990;
l = 0.00885;
k = 0;
B_inf(4) = k*(1000-L)+l*L;

%K=5
L = 995;
l = 0.02653;
k = 0;
B_inf(3) = k*(1000-L)+l*L;

%K=2
L = 998;
l = 0.09393;
k = 0;
B_inf(2) = k*(1000-L)+l*L;

%K=1
L = 999;
l = 0.2032;
k = 0;
B_inf(1) = k*(1000-L)+l*L;

x1 = [1, 2, 5, 10, 15, 20, 25, 30, 40, 70, 100];
y1 = B_inf;

figure;
scatter(x1,log(y1),40,'filled');
%ylim([0 0.6]);
%hold on;
%plot(x1,benchmark,'r--','LineWidth',1);
%legend('V','V_{benchmark}');
%legend('V(tau_l,B_l)');
xlabel('K');
ylabel('log(B_{total})');
title('Plot of B_{total} for different K');
