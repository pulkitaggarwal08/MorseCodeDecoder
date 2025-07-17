function [y, Fs, t] = importaudio()
    [y, Fs] = audioread('names_morse.wav');
    t = (0:length(y)-1)/Fs;
    plot(t, y);
    title('Original Signal'); xlabel('Time (s)'); grid on;
end
