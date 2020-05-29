function Y= RL_CM(a)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
n=length(a);
x=linspace(0,1,n);
E=0;
Ex=0;
Ey=0;
for i=1:n
    E=E+(a(i)*i);
    Ex=Ex+i;
    Ey=Ey+a(i);
end

m=(n*E-Ex*Ey)/(n*(Ex)^2 - abs((Ex)^2));
b=(Ey*(Ex)^2 -Ex*E)/(n*(Ex)^2 - abs((Ex)^2));

y=m*x+b;

subplot (2,1,1)
plot(a)
subplot(2,1,2)
plot(y)
end

