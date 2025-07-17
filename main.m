clear; clc; close all;

% 1. Import audio
[y, Fs, t] = importaudio(); 

% 2. Preprocess signal
y = y - mean(y); % Remove DC offset
y = y/max(abs(y)); % Normalize
    
% 3. Apply adaptive filter
smooth_signal = adaptive_filter(y, Fs);

% 4. Convert to Morse
morse_code = convertor(smooth_signal, Fs);
disp(['Morse: ', morse_code]);

% 5. Decode with complete A-Z support
decoded_text = full_decoder(morse_code);
disp(['Text: ', decoded_text]);

%6. Visualization of frequencies
visualize_fft(y, Fs); 



