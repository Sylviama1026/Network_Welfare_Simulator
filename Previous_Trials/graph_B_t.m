I = 1000;
y_last = []; %record the final B of each K

%graph B_t: K=1
t_para = 0:0.05:2;
L = 999;
k = 0;
l = 0.20323;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=1');
ylim([0 10])

%graph B_t: K=2
t_para = 0:0.05:2;
L = 998;
l = 0.09393;
k = 0;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=2');
ylim([0 10])

%graph B_t: K=5
t_para = 0:0.05:2;
L = 995;
l = 0.02653;
k = 0;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=5');
ylim([0 10])

%graph B_t: K=10
t_para = 0:0.05:2;
L = 990;
k = 0;
l = 0.00885;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=10');
ylim([0 10])

%graph B_t: K=15
t_para = 0:0.05:2;
L = 985;
l = 0.00511;
k = 0.00001;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=15');
ylim([0 10])

%graph B_t: K=20
t_para = 0:0.05:2;
L = 980;
l = 0.00404;
k = 0.00002;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=20');
ylim([0 10])

%graph B_t: K=25
t_para = 0:0.05:2;
L = 975;
l = 0.00356;
k = 0.00003;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=25');
ylim([0 10])

%graph B_t: K=30
t_para = 0:0.05:2;
L = 970;
l = 0.00328;
k = 0.00004;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=30');
ylim([0 10])

%graph B_t: K=40
t_para = 0:0.05:2;
L = 960;
l = 0.00295;
k = 0.00006;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=40');
ylim([0 10])

%graph B_t: K=70
t_para = 0:0.05:2;
L = 930;
l = 0.00250;
k = 0.00010;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=70');
ylim([0 10])


%graph B_t: K=100
t_para = 0:0.05:2;
L = 900;
k = 0.00014;
l = 0.00228;
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;
if f_B_val(end-1) == f_B_val(end)
    y_last(end+1) = f_B_val(end);
else
    y_last(end+1) = inf;
end

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title('Plot of B_t for K=100');
ylim([0 10])

%plot B_total vs K
x1 = [1, 2, 5, 10, 15, 20, 25, 30, 40, 70, 100];
y1 = y_last;
y1(y1==Inf) = 3.5;
figure;
%scatter(x1,y1,40,'filled');
plot(x1,y1,'b-','LineWidth',2);
%legend('B_t');
xlabel('K');
ylabel('B_{total}');
text(-3,3.37,'≈','FontSize',14);
text(-3,3.5,'∞','FontSize',14);
yticks(2:0.25:3.25);
title('Plot of B_{total} vs K');
xlim([0 100])
ylim([2 3.5])

