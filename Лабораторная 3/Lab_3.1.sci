x0 = 19300;
y0 = 39000;
t0 = 0;
tmax = 2;
dt = 0.01;
t = t0:dt:tmax;

a = 0.46;
b = 0.7;
c = 0.82;
h = 0.5;

function p = P(t)
    p = sin(0.5*t);
endfunction

function q = Q(t)
    q = cos(1.5*t);
endfunction

function dy = syst(t, y)
    dy(1) = -a*y(1) - b*y(2) + P(t);
    dy(2) = -c*y(1) - h*y(2) + Q(t);
endfunction

v0 = [x0; y0];
y = ode(v0, t0, t, syst);

clf;
plot2d(t, y(1,:), style=2);
plot2d(t, y(2,:), style=5);
xtitle('Модель боевых действий между регулярными войсками', 'Время, t', 'Численность армии');
legend('Армия X', 'Армия Y', 1);
xgrid(1);
