
subplot(2,1,1)
[x,n] = unit_impulse(2, -5, 5);
stem(n,x)
subplot(2,1,2)
[u,n]=unit_step(2, -5, 5);
stem(n,u)

