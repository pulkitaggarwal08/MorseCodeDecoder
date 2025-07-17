function [morse_code] = convertor(signal, Fs)
    % Dynamic threshold with hysteresis
    threshold = 0.15 * max(signal);
    binary = zeros(size(signal));
    state = 0;
    
    for i = 1:length(signal)
        if state == 0 && signal(i) > threshold*1.3
            state = 1;
        elseif state == 1 && signal(i) < threshold*0.7
            state = 0;
        end
        binary(i) = state;
    end
    
    % Find transitions
    d = diff([0; binary(:); 0]);
    starts = find(d == 1);
    ends = find(d == -1);
    
    % Calculate durations
    beep_durs = (ends - starts)/Fs;
    silences = (starts(2:end) - ends(1:end-1))/Fs;
    
    % Adaptive classification
    dot_thresh = median(beep_durs) * 1.6; % 60% longer = dash
    letter_space = median(silences) * 3;
    word_space = median(silences) * 7;
    
    morse_code = '';
    for i = 1:length(starts)
        % Add symbol
        morse_code = [morse_code, ternary((ends(i)-starts(i))/Fs < dot_thresh, '.', '-')];
        
        % Add space if needed
        if i < length(starts)
            silence = (starts(i+1)-ends(i))/Fs;
            if silence > word_space
                morse_code = [morse_code, '/'];
            elseif silence > letter_space
                morse_code = [morse_code, ' '];
            end
        end
    end
end