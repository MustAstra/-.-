a = 0.19;
b = 0.39;
c = 0.048;
d = 0.036;

function dx = syst(t, x)
    dx(1) = -a*x(1) + c*x(1)*x(2);
    dx(2) = b*x(2) - d*x(1)*x(2);
endfunction

t0 = 0;
x0 = [13; 18];
t = 0:0.1:100;
y = ode(x0, t0, t, syst);

n = size(y, "c");
for i = 1:n
    хищники(i) = y(1, i);
    жертвы(i) = y(2, i);
end

clf();
scf(0);
plot(хищники, жертвы);
xtitle('Фазовый портрет', 'Хищники (x)', 'Жертвы (y)');
xgrid(1);

scf(1);
subplot(2,1,1);
plot(t, хищники, 'r');
xtitle('Хищники во времени', 'Время', 'Численность');
xgrid(1);

subplot(2,1,2);
plot(t, жертвы, 'b');
xtitle('Жертвы во времени', 'Время', 'Численность');
xgrid(1);
