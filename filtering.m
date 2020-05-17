

Fs = 500;
t = 0:1/Fs:10; 
x = 2*sin(100*pi*t) + 3*cos(400*pi*t + pi/8)-2*cos(200*pi*t);

N = 4*2^nextpow2(length(x));
f1 = 0:Fs/N:Fs/2;
X = fft(x,N)/length(x); 
X1 = abs(X(1:N/2+1));
X1(2:N/2+1) = 2*X1(2:N/2+1); 
Xphase = unwrap(angle(X(1:N/2+1))); 

figure(1);
subplot(2, 2, 1:2)
    plot(t, x); 
    xlabel('t[s]'); ylabel('x(t)');
    title('Signal x(t)'); grid on;
subplot(2, 2, 3)
    plot(f1, X1);
    xlabel('f[Hz]'); ylabel('|X(jf)|');
    title('Amplitudska karakteristika'); grid on;
subplot(2,2,4)
    plot(f1, Xphase);
    xlabel('f[Hz]'); ylabel('arg{X(jf)}');
    title('Fazna karakteristika'); grid on

    
    

Fs = 500;  % Sampling Frequency

Fpass1 = 65;              % First Passband Frequency
Fstop1 = 75;              % First Stopband Frequency
Fstop2 = 125;             % Second Stopband Frequency
Fpass2 = 135;             % Second Passband Frequency
Dpass1 = 0.028774368332;  % First Passband Ripple
Dstop  = 0.001;           % Stopband Attenuation
Dpass2 = 0.057501127785;  % Second Passband Ripple

[N,Wn,BETA,TYPE] = kaiserord([Fpass1 Fstop1 Fstop2 Fpass2]/(Fs/2), [1 ...
                             0 1], [Dpass1 Dstop Dpass2]);

b  = fir1(N, Wn, TYPE, 'scale');

figure(2);
freqz(b,1,1024,fsamp);
y = filtfilt(b,1,x);



N = 4*2^nextpow2(length(y));
f2 = 0:Fs/N:Fs/2;
Y = fft(y,N)/length(y); 
Y1 = abs(Y(1:N/2+1));
Y1(2:N/2+1) = 2*Y1(2:N/2+1); 
Yphase = unwrap(angle(Y(1:N/2+1))); 
figure(3);
subplot(2, 2, 1:2)
    plot(t, y); 
    xlabel('t[s]'); ylabel('y(t)');
    title('Signal y(t)'); grid on;
subplot(2, 2, 3)
    plot(f2, Y1);
    xlabel('f[Hz]'); ylabel('|X(jf)|');
    title('Amplitudska karakteristika'); grid on;
subplot(2,2,4)
    plot(f2, Yphase);
    xlabel('f[Hz]'); ylabel('arg{Y(jf)}');
    title('Fazna karakteristika'); grid on


