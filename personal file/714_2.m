NFFT=2^nextpow2(L);
Y=fft(y,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(Y(1:NFFT/2+1)))
title('y��Ƶ�ʳɷ�')
xlabel('Ƶ��/Hz')
ylabel('|Y(f)|')