function [text] = full_decoder(morse)
    % Complete A-Z + 0-9 + punctuation dictionary
    symbols = {'.-','-...','-.-.','-..','.','..-.','--.','....','..',...
              '.---','-.-','.-..','--','-.','---','.--.','--.-','.-.',...
              '...','-','..-','...-','.--','-..-','-.--','--..',...
              '-----','.----','..---','...--','....-','.....',...
              '-....','--...','---..','----.','.-.-.-','--..--',...
              '..--..','.----.','-.-.--','-..-.','-.--.','-.--.-'};
    
    letters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N',...
              'O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1',...
              '2','3','4','5','6','7','8','9','.',',','?',"'",'!','/','(',')'};
    
    morse_dict = containers.Map(symbols, letters);
    
    words = strsplit(strtrim(morse), '/');
    text = '';
    
    for w = 1:length(words)
        chars = strsplit(strtrim(words{w}), ' ');
        for c = 1:length(chars)
            if morse_dict.isKey(chars{c})
                text = [text, morse_dict(chars{c})];
            else
                text = [text, '?']; % Unknown character
            end
        end
        text = [text, ' '];
    end
    text = strtrim(text);
end