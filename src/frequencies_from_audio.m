%
%     PURPOSE: Compare fft with dft loop for an audio file
%  AUDIO FILE: Use a public domain birdcall from xeno-canto.org
%      RESULT: Produce 3 plots: 1) Time domain, 2) FFT, and 3) DFT
%   DEVELOPER: http://www.biophysicslab.com/portfolio/matlab-projects/
%        DATE: June 6, 2020
%
%  REFERENCES:
%   "Signal Processing Problems" hosted on Udemy.com
%       by Dr. Mike X Cohen, sigprocMXC_SpectBirdcall.m
%   "Master the Fourier transform and its applications" hosted on Udemy.com 
%       by Dr. Mike X Cohen, Fourier_DTFT.m
%   "wav file dft without fft" - MathWorks forum post:
%   https://www.mathworks.com/matlabcentral/answers/
%   544352-wav-file-dft-without-fft
%

function frequencies_from_audio(audio_file, max_freq, show_plot, hear_sound)
    arguments
        % The path to the audio file.
        audio_file (1, 1) string
        % Maximum frequency to view.
        max_freq (1, 1) double
        % 1 to show plot, otherwise 0
        show_plot (1, 1) double
        % 1 to hear sound, otherwise 0
        hear_sound (1, 1) double
    end
    % Load in birdcall (source: https://www.xeno-canto.org/403881).
    [data, sample_rate] = audioread(audio_file);

    % Configuration params for Fourier transforms.
    freq_range = [0, max_freq]; % Hz
    
    % To hear sound:
    if (hear_sound)
        soundsc(data, sample_rate);
    end

    data_len = length(data);
    steps = floor(data_len / 2) + 1;
    hz = linspace(0, sample_rate/2, steps);

    % Smooth birdcall audio audio for fft & dft
    signal = detrend(data(:,1))'; % transpose here for DFT loop later
    
    time = (0:data_len-1) / sample_rate;

    if (show_plot)
        % Plot the data from the two audio file channels.
        figure(1);
        clf;
        subplot(2, 1, 1);
        % Include a small offset for left and right audio channels.
        plot(time, bsxfun(@plus, data, [.2, 0]));
        xlabel('Time (sec)');
        title('Time Domain');
        set(gca, YTick=[], XLim=time([1, end]));
    end

    bcpow_fft = abs(fft(signal)/data_len).^2;

    if (show_plot)
        subplot(2, 1, 2);
        plot(hz, bcpow_fft(1:length(hz)), LineWidth=2, Color=[1, 0.5, 0]);
        xlabel('Frequency (Hz)'); ylabel('Power');
        title(['Frequency Domain using FFT with ', ...
                num2str(length(bcpow_fft)), ...
                ' points']);
        xlim(freq_range);
        % Make fft and dft y-limits be the same for comparison.
    end

    fr_len = 2*length(hz);
    
    if (length(bcpow_fft) > fr_len)
        bcpow_fft = bcpow_fft(1:length(fr_len));
    end
    
    save("data/dft_analysis.mat", ...
        "hz", ...
        "bcpow_fft" ...
    );
end