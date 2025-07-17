function visualize_fft(y, Fs)
    % Take only one channel if stereo
    if size(y,2) > 1
        y = y(:,1);
    end

    % Length and FFT
    N = length(y);
    Y = fft(y);
    f = (0:N-1)*(Fs/N); % Frequency vector
    
    % Take magnitude and normalize
    magnitude = abs(Y)/N;
    
    % Plot only up to Nyquist frequency
    half = 1:floor(N/2);

    figure;
    plot(f(half), magnitude(half));
    title('Frequency Spectrum of the Signal');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
grid on;
end