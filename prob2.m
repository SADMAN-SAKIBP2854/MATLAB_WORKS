clc;
clear all;
close all;
subplot 311
[x, n] = unit_step(0, 0, 8);
stem(n, x);
xlim([ -10 10 ])
title("Real Signal")
[xf, nf] = sigfold(x, n)
subplot 312
[Xe, Xef] = sigadd(n,x,nf,xf);
stem(Xef, 0.5*Xe);
xlim([ -10 10 ])
title("Even Signal")
subplot 313
[Xo, Xof] = sigsubstrac(n,x,nf,xf);
stem(Xof, 0.5*Xo);
xlim([ -10 10 ])
title("Odd Signal")
figure(2)
stem(Xef,0.5*Xe+0.5*Xo)
