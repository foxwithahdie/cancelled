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

function frequencies_from_audio(audio_file, show_plot, hear_sound)
    arguments
        % The path to the audio file.
        audio_file (1, 1) string
        % 1 to show plot, otherwise 0
        show_plot (1, 1) double
        % 1 to hear sound, otherwise 0
        hear_sound (1, 1) double
    end
    % Load in birdcall (source: https://www.xeno-canto.org/403881).
    [data, sample_rate] = audioread(audio_file);

    % Configuration params for Fourier transforms.
    freq_range = [0, 8000]; % Hz
    dft_loop_reduction = 50; % set to 1 for no reduction (Hint: takes a long time)

    % To hear sound:
    if (hear_sound)
        soundsc(data, sample_rate);
    end

    data_len = length(data);
    steps = floor(data_len / 2) + 1;
    hz = 0:steps:(sample_rate/2);

    % Smooth birdcall audio audio for fft & dft
    signal = detrend(data(:,1))'; % transpose here for DFT loop later
    
    time = (0:data_len-1) / sample_rate;

    if (show_plot)
        % Plot the data from the two audio file channels.
        figure(1);
        clf;
        subplot(3, 1, 1);
        % Include a small offset for left and right audio channels.
        plot(time, bsxfun(@plus, data, [.2, 0]));
        xlabel('Time (sec)');
        title('Time Domain');
        set(gca, YTick=[], XLim=time([1, end]));
    end

    bcpow_fft = abs(fft( signal )/data_len).^2;

    if (show_plot)
        subplot(3, 1, 2);
        plot(hz, bcpow_fft(1:length(hz)), LineWidth=2);
        xlabel('Frequency (Hz)'); ylabel('Power');
        title(['Frequency Domain using FFT with ', ...
                num2str(length(bcpow_fft)), ...
                ' points']);
        xlim(freq_range);
        % Make fft and dft y-limits be the same for comparison.
        ylim_fft = get(gca,'ylim');
    end
    
    fourier_time = (0:data_len - 1) / data_len;
    fourier_coefs = zeros(size(signal));
    h = waitbar(0,'Please wait for DFT loop...');
    % DFT loop is very inefficient, it is used here for demonstration only.
    for f_i = 1:dft_loop_reduction:data_len
        
        % Create complex sine wave.
        csw = exp( -1i * 2*pi * (f_i-1) * fourier_time );
        
        % Compute dot product between sine wave and signal (Fourier coefficients).
        fourier_coefs(f_i) = sum( signal .* csw );
        
   
        % GUI to show progress for long calculation times.
        waitbar(f_i / data_len);
    end
    close(h);

    bcpow_dft = abs(fourier_coefs / data_len).^2;
    
    if (show_plot)
        subplot(3, 1, 3);
        plot(hz, bcpow_dft(1:length(hz)), LineWidth=2);
        xlabel('Frequency (Hz)'); ylabel('Power');
        title(['Frequency domain using DFT loop with ', ...
                num2str(floor(length(bcpow_dft) / dft_loop_reduction)), ...
                ' points']);
        xlim(freq_range); ylim(ylim_fft);
    end

    save(["data/dft_analysis_", audio_file, ".mat"], ...
        "bcpow_dft");
end