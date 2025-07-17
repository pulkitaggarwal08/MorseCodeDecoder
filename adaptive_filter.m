function [smooth_signal] = adaptive_filter(y, Fs)
    % Dynamic window size based on expected Morse speed
    window_size = round(Fs * 0.06); % 60ms window
    kernel = gausswin(window_size);
    kernel = kernel/sum(kernel);
    smooth_signal = conv(abs(y), kernel, 'same');
    
    figure; 
    plot(smooth_signal); 
    title('Filtered Signal'); 
    xlabel('Samples'); 
    grid on;
end
