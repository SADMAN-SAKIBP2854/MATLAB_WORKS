clc;
clear all;
close all;

f_c=1/8;                        %DEFINING FREQUENCY VARIABLE FOR SINC PULSE
n=-40:40;                       %DEFINING THE INDEX FOR SINC PULSE
x=sinc(2*f_c*n);
%END OF SINC PULSE

figure(1)
stem(n,x)
title('Discrete sinc function')
xlabel('Index (n)')
ylabel('x(n)')

M=101;                          %NUMBER OF POINTS IN DIGITAL FREQUENCY GRID
w=linspace(-pi, pi, M);         %DEFINING THE DIGITAL FREQUENCY GRID
dw=w(2)-w(1);                   %RESOLUTION OF DIGITAL FREQUENCY
X=zeros(1,M);                   %INITIALIZING THE DTFT OF x(n)
for i1=1:M
    for i2=1:length(x)
        X(i1)=X(i1)+x(i2)*exp(-i*w(i1)*n(i2));     %EQUATION NO  OF THE LABSHEET
       end
end

figure(2)
plot(w,abs(X))
title('Amplitude Spectrum')
xlabel('Frequency (rad/sec)')
ylabel('|X(w)|')



% %RECONSTRUCTION OF SIGNAL
% n_re=-80:80;
% x_re=zeros(1,length(n_re));         %INITIALIZING RECONSTRUCTED SIGNAL
% for i1=1:M
%     for i2=1:length(x_re)
%         x_re(i2)=x_re(i2)+1/(2*pi)*X(i1)*exp(-i*w(i1)*n_re(i2))*dw;  %EQUATION NO  OF THE LABSHEET
%         
%     end
% end
% 
% 
% figure(3)
% stem(n_re,x_re)
% title('Reconstructed Discrete Signal')
% xlabel('Index (n)')
% ylabel('x_{reconstructed}(n)')
