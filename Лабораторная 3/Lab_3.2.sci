x0 = 19300;
y0 = 39000;
t0 = 0;
tmax = 2;
dt = 0.01;
t = t0:dt:tmax;

a = 0.38;
b = 0.73;
c = 0.5;
h = 0.28;

function p = P(t)
    p = sin(2*t) + 1;
endfunction

function q = Q(t)
    q = cos(2*t);
endfunction

function dy = syst(t, y)
    dy(1) = -a*y(1) - b*y(2) + P(t);
    dy(2) = -c*y(1)*y(2) - h*y(2) + Q(t);
endfunction

v0 = [x0; y0];
y = ode(v0, t0, t, syst);

clf;
plot2d(t, y(1,:), style=2);
plot2d(t, y(2,:), style=5);
xtitle('Модель боевых действий с партизанскими отрядами', 'Время, t', 'Численность армии');
legend('Армия X', 'Армия Y', 1);
xgrid(1);
