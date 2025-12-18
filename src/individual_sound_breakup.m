function individual_sound_breakup(sound_type, max_freq)
    arguments
        % mariah-carey, no-sound, feedback, talking, vacuum
        sound_type (1, 1) string
        % max frequency
        max_freq (1, 1) double
    end

    switch (sound_type)
        case "mariah_carey"
            load("data/matlab/fft_data.mat", ...
                "closed_wh1000xm4_mariah_carey_fft", ...
                "open_wh1000xm4_mariah_carey_fft", ...
                "closed_wh1000xm4_anc_mariah_carey_fft", ...
                "closed_wh1000xm4_mariah_carey_hz", ...
                "open_wh1000xm4_mariah_carey_hz", ...
                "closed_wh1000xm4_anc_mariah_carey_hz" ...
            );
    
            max_val = max([length(open_wh1000xm4_mariah_carey_hz), length(closed_wh1000xm4_mariah_carey_hz), length(closed_wh1000xm4_anc_mariah_carey_hz)]);
            
            open_wh1000xm4_mariah_carey_fft = open_wh1000xm4_mariah_carey_fft(1:max_val);
            closed_wh1000xm4_mariah_carey_fft = closed_wh1000xm4_mariah_carey_fft(1:max_val);
            closed_wh1000xm4_anc_mariah_carey_fft = closed_wh1000xm4_anc_mariah_carey_fft(1:max_val);
    
            if (max_val == length(open_wh1000xm4_mariah_carey_hz))
                % figure();
                % plot(open_wh1000xm4_mariah_carey_hz, open_wh1000xm4_mariah_carey_fft, DisplayName="Open"); hold on
                % plot(open_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_mariah_carey_fft, DisplayName="Closed");
                % plot(open_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_anc_mariah_carey_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                %  subplot is chosen
                figure();
                sgtitle("Playing Mariah Carey Song with Different Headphone States");
                subplot(3, 1, 1);
                plot(open_wh1000xm4_mariah_carey_hz, open_wh1000xm4_mariah_carey_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                subplot(3, 1, 2);
                plot(open_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_mariah_carey_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                subplot(3, 1, 3);
                plot(open_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_anc_mariah_carey_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
    
            elseif (max_val == length(closed_wh1000xm4_mariah_carey_hz))
                % figure();
                % plot(closed_wh1000xm4_mariah_carey_hz, open_wh1000xm4_mariah_carey_fft, DisplayName="Open"); hold on
                % plot(closed_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_mariah_carey_fft, DisplayName="Closed");
                % plot(closed_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_anc_mariah_carey_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
                % If subplot is chosen
    
                figure();
                sgtitle("Playing Mariah Carey Song with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_mariah_carey_hz, open_wh1000xm4_mariah_carey_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_mariah_carey_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_anc_mariah_carey_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
            elseif (max_val == length(closed_wh1000xm4_anc_mariah_carey_hz))
                % figure();
                % plot(closed_wh1000xm4_anc_mariah_carey_hz, open_wh1000xm4_mariah_carey_fft, DisplayName="Open"); hold on
                % plot(closed_wh1000xm4_anc_mariah_carey_hz, closed_wh1000xm4_mariah_carey_fft, DisplayName="Closed");
                % plot(closed_wh1000xm4_anc_mariah_carey_hz, closed_wh1000xm4_anc_mariah_carey_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % If subplot is chosen
                sgtitle("Playing Mariah Carey Song with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_anc_mariah_carey_hz, open_wh1000xm4_mariah_carey_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_anc_mariah_carey_hz, closed_wh1000xm4_mariah_carey_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_anc_mariah_carey_hz, closed_wh1000xm4_anc_mariah_carey_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            end
    
            % xlabel("Frequency (Hz)"); ylabel("Magnitude");
            % title("Playing Mariah Carey Song with Different Headphone States");
            % legend();
            % hold off
        case "no_sound"
            load("data/matlab/fft_data.mat", ...
                "closed_wh1000xm4_no_sound_fft", ...
                "open_wh1000xm4_no_sound_fft", ...
                "closed_wh1000xm4_anc_no_sound_fft", ...
                "closed_wh1000xm4_no_sound_hz", ...
                "open_wh1000xm4_no_sound_hz", ...
                "closed_wh1000xm4_anc_no_sound_hz" ...
            );
    
            max_val = max([length(open_wh1000xm4_no_sound_hz), length(closed_wh1000xm4_no_sound_hz), length(closed_wh1000xm4_anc_no_sound_hz)]);
            
            open_wh1000xm4_no_sound_fft = open_wh1000xm4_no_sound_fft(1:max_val);
            closed_wh1000xm4_no_sound_fft = closed_wh1000xm4_no_sound_fft(1:max_val);
            closed_wh1000xm4_anc_no_sound_fft = closed_wh1000xm4_anc_no_sound_fft(1:max_val);
    
            if (max_val == length(open_wh1000xm4_no_sound_hz))
                % figure();
                % plot(open_wh1000xm4_no_sound_hz, open_wh1000xm4_no_sound_fft, DisplayName="Open"); hold on
                % plot(open_wh1000xm4_no_sound_hz, closed_wh1000xm4_no_sound_fft, DisplayName="Closed");
                % plot(open_wh1000xm4_no_sound_hz, closed_wh1000xm4_anc_no_sound_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
                % If subplot is chosen
                figure();
                sgtitle("No Sound Playing with Different Headphone States");
                subplot(3, 1, 1);
                plot(open_wh1000xm4_no_sound_hz, open_wh1000xm4_no_sound_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(open_wh1000xm4_no_sound_hz, closed_wh1000xm4_no_sound_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(open_wh1000xm4_no_sound_hz, closed_wh1000xm4_anc_no_sound_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            elseif (max_val == length(closed_wh1000xm4_no_sound_hz))
                % figure();
                % plot(closed_wh1000xm4_no_sound_hz, open_wh1000xm4_no_sound_fft, DisplayName="Open"); hold on
                % plot(closed_wh1000xm4_no_sound_hz, closed_wh1000xm4_no_sound_fft, DisplayName="Closed");
                % plot(closed_wh1000xm4_no_sound_hz, closed_wh1000xm4_anc_no_sound_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % % If subplot is chosen
                figure();
                sgtitle("No Sound Playing with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_no_sound_hz, open_wh1000xm4_no_sound_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_no_sound_hz, closed_wh1000xm4_no_sound_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_no_sound_hz, closed_wh1000xm4_anc_no_sound_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            elseif (max_val == length(closed_wh1000xm4_anc_no_sound_hz))
                % figure();
                % plot(closed_wh1000xm4_anc_no_sound_hz, open_wh1000xm4_no_sound_fft, DisplayName="Open"); hold on
                % plot(closed_wh1000xm4_anc_no_sound_hz, closed_wh1000xm4_no_sound_fft, DisplayName="Closed");
                % plot(closed_wh1000xm4_anc_no_sound_hz, closed_wh1000xm4_anc_no_sound_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % If subplot is chosen
                sgtitle("No Sound Playing with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_anc_no_sound_hz, open_wh1000xm4_no_sound_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_anc_no_sound_hz, closed_wh1000xm4_no_sound_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_anc_no_sound_hz, closed_wh1000xm4_anc_no_sound_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            end
    
            % xlabel("Frequency (Hz)"); ylabel("Magnitude");
            % title("No Sound Playing with Different Headphone States");
            % legend();
            % hold off
        case "feedback"
            load("data/matlab/fft_data.mat", ...
                "closed_wh1000xm4_feedback_fft", ...
                "open_wh1000xm4_feedback_fft", ...
                "closed_wh1000xm4_anc_feedback_fft", ...
                "closed_wh1000xm4_feedback_hz", ...
                "open_wh1000xm4_feedback_hz", ...
                "closed_wh1000xm4_anc_feedback_hz" ...
            );
            max_val = max([length(open_wh1000xm4_feedback_hz), length(closed_wh1000xm4_feedback_hz), length(closed_wh1000xm4_anc_feedback_hz)]);
            
            open_wh1000xm4_feedback_fft = open_wh1000xm4_feedback_fft(1:max_val);
            closed_wh1000xm4_feedback_fft = closed_wh1000xm4_feedback_fft(1:max_val);
            closed_wh1000xm4_anc_feedback_fft = closed_wh1000xm4_anc_feedback_fft(1:max_val);
    
            if (max_val == length(open_wh1000xm4_feedback_hz))
                % figure();
                % plot(open_wh1000xm4_feedback_hz, open_wh1000xm4_feedback_fft, DisplayName="Open"); hold on
                % plot(open_wh1000xm4_feedback_hz, closed_wh1000xm4_feedback_fft, DisplayName="Closed");
                % plot(open_wh1000xm4_feedback_hz, closed_wh1000xm4_anc_feedback_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
                % If subplot is chosen
    
                figure();
                sgtitle("Playing Feedback with Different Headphone States");
                subplot(3, 1, 1);
                plot(open_wh1000xm4_feedback_hz, open_wh1000xm4_feedback_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(open_wh1000xm4_feedback_hz, closed_wh1000xm4_feedback_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(open_wh1000xm4_feedback_hz, closed_wh1000xm4_anc_feedback_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            elseif (max_val == length(closed_wh1000xm4_feedback_hz))
                % figure();
                % plot(closed_wh1000xm4_feedback_hz, open_wh1000xm4_feedback_fft, DisplayName="Open"); hold on
                % plot(closed_wh1000xm4_feedback_hz, closed_wh1000xm4_feedback_fft, DisplayName="Closed");
                % plot(closed_wh1000xm4_feedback_hz, closed_wh1000xm4_anc_feedback_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % If subplot is chosen
                figure();
                sgtitle("Playing Feedback with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_feedback_hz, open_wh1000xm4_feedback_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_feedback_hz, closed_wh1000xm4_feedback_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_feedback_hz, closed_wh1000xm4_anc_feedback_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            elseif (max_val == length(closed_wh1000xm4_anc_feedback_hz))
                % figure();
                % plot(closed_wh1000xm4_anc_feedback_hz, open_wh1000xm4_feedback_fft, DisplayName="Open"); hold on
                % plot(closed_wh1000xm4_anc_feedback_hz, closed_wh1000xm4_feedback_fft, DisplayName="Closed");
                % plot(closed_wh1000xm4_anc_feedback_hz, closed_wh1000xm4_anc_feedback_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % If subplot is chosen
                figure();
                sgtitle("Playing Feedback with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_anc_feedback_hz, open_wh1000xm4_feedback_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_anc_feedback_hz, closed_wh1000xm4_feedback_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_anc_feedback_hz, closed_wh1000xm4_anc_feedback_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            end
    
            % xlabel("Frequency (Hz)"); ylabel("Magnitude");
            % title("Playing Feedback with Different Headphone States");
            % legend();
            % hold off
        case "talking"
            load("data/matlab/fft_data.mat", ...
                "closed_wh1000xm4_talking_fft", ...
                "open_wh1000xm4_talking_fft", ...
                "closed_wh1000xm4_anc_talking_fft", ...
                "closed_wh1000xm4_talking_hz", ...
                "open_wh1000xm4_talking_hz", ...
                "closed_wh1000xm4_anc_talking_hz" ...
            );
            max_val = max([length(open_wh1000xm4_talking_hz), length(closed_wh1000xm4_talking_hz), length(closed_wh1000xm4_anc_talking_hz)]);
            
            open_wh1000xm4_talking_fft = open_wh1000xm4_talking_fft(1:max_val);
            closed_wh1000xm4_talking_fft = closed_wh1000xm4_talking_fft(1:max_val);
            closed_wh1000xm4_anc_talking_fft = closed_wh1000xm4_anc_talking_fft(1:max_val);
    
            if (max_val == length(open_wh1000xm4_talking_hz))
                % figure();
                % plot(open_wh1000xm4_talking_hz, closed_wh1000xm4_talking_fft, DisplayName="Closed"); hold on
                % plot(open_wh1000xm4_talking_hz, open_wh1000xm4_talking_fft, DisplayName="Open"); 
                % plot(open_wh1000xm4_talking_hz, closed_wh1000xm4_anc_talking_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
                
                % If subplot is chosen
                figure();
                sgtitle("Talking with Different Headphone States");
                subplot(3, 1, 1);
                plot(open_wh1000xm4_talking_hz, open_wh1000xm4_talking_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(open_wh1000xm4_talking_hz, closed_wh1000xm4_talking_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(open_wh1000xm4_talking_hz, closed_wh1000xm4_anc_talking_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            elseif (max_val == length(closed_wh1000xm4_talking_hz))
                % figure();
                % plot(closed_wh1000xm4_talking_hz, closed_wh1000xm4_talking_fft, DisplayName="Closed"); hold on
                % plot(closed_wh1000xm4_talking_hz, open_wh1000xm4_talking_fft, DisplayName="Open"); 
                % plot(closed_wh1000xm4_talking_hz, closed_wh1000xm4_anc_talking_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % If subplot is chosen
                figure();
                title("Talking with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_talking_hz, open_wh1000xm4_talking_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_talking_hz, closed_wh1000xm4_talking_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_talking_hz, closed_wh1000xm4_anc_talking_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            elseif (max_val == length(closed_wh1000xm4_anc_talking_hz))
                % figure();
                % plot(closed_wh1000xm4_anc_talking_hz, closed_wh1000xm4_talking_fft, DisplayName="Closed"); hold on
                % plot(closed_wh1000xm4_anc_talking_hz, open_wh1000xm4_talking_fft, DisplayName="Open"); 
                % plot(closed_wh1000xm4_anc_talking_hz, closed_wh1000xm4_anc_talking_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % % If subplot is chosen
                figure();
                sgtitle("Talking with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_anc_talking_hz, open_wh1000xm4_talking_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_anc_talking_hz, closed_wh1000xm4_talking_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_anc_talking_hz, closed_wh1000xm4_anc_talking_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            end
    
            % xlabel("Frequency (Hz)"); ylabel("Magnitude");
            % title("Talking with Different Headphone States");
            % legend();
            % hold off
        case "vacuum"
            load("data/matlab/fft_data.mat", ...
                "closed_wh1000xm4_vacuum_fft", ...
                "open_wh1000xm4_vacuum_fft", ...
                "closed_wh1000xm4_anc_vacuum_fft", ...
                "closed_wh1000xm4_vacuum_hz", ...
                "open_wh1000xm4_vacuum_hz", ...
                "closed_wh1000xm4_anc_vacuum_hz" ...
            );
            max_val = max([length(open_wh1000xm4_vacuum_hz), length(closed_wh1000xm4_vacuum_hz), length(closed_wh1000xm4_anc_vacuum_hz)]);
            
            open_wh1000xm4_vacuum_fft = open_wh1000xm4_vacuum_fft(1:max_val);
            closed_wh1000xm4_vacuum_fft = closed_wh1000xm4_vacuum_fft(1:max_val);
            closed_wh1000xm4_anc_vacuum_fft = closed_wh1000xm4_anc_vacuum_fft(1:max_val);
    
            if (max_val == length(open_wh1000xm4_vacuum_hz))
                % figure();
                % plot(open_wh1000xm4_vacuum_hz, open_wh1000xm4_vacuum_fft, DisplayName="Open"); hold on
                % plot(open_wh1000xm4_vacuum_hz, closed_wh1000xm4_vacuum_fft, DisplayName="Closed");
                % plot(open_wh1000xm4_vacuum_hz, closed_wh1000xm4_anc_vacuum_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % If subplot is chosen
                figure();
                sgtitle("Vacuuming with Different Headphone States");
                subplot(3, 1, 1);
                plot(open_wh1000xm4_vacuum_hz, open_wh1000xm4_vacuum_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(open_wh1000xm4_vacuum_hz, closed_wh1000xm4_vacuum_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(open_wh1000xm4_vacuum_hz, closed_wh1000xm4_anc_vacuum_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            elseif (max_val == length(closed_wh1000xm4_vacuum_hz))
                % figure();
                % plot(closed_wh1000xm4_vacuum_hz, open_wh1000xm4_vacuum_fft, DisplayName="Open"); hold on
                % plot(closed_wh1000xm4_vacuum_hz, closed_wh1000xm4_vacuum_fft, DisplayName="Closed");
                % plot(closed_wh1000xm4_vacuum_hz, closed_wh1000xm4_anc_vacuum_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % % If subplot is chosen
                figure();
                sgtitle("Vacuuming with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_vacuum_hz, open_wh1000xm4_vacuum_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_vacuum_hz, closed_wh1000xm4_vacuum_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_vacuum_hz, closed_wh1000xm4_anc_vacuum_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            elseif (max_val == length(closed_wh1000xm4_anc_vacuum_hz))
                % figure();
                % plot(closed_wh1000xm4_anc_vacuum_hz, open_wh1000xm4_vacuum_fft, DisplayName="Open"); hold on
                % plot(closed_wh1000xm4_anc_vacuum_hz, closed_wh1000xm4_vacuum_fft, DisplayName="Closed");
                % plot(closed_wh1000xm4_anc_vacuum_hz, closed_wh1000xm4_anc_vacuum_fft, DisplayName="Closed, with ANC");
                % xlim([0, max_freq]);
    
                % % If subplot is chosen
                figure();
                sgtitle("Vacuuming with Different Headphone States");
                subplot(3, 1, 1);
                plot(closed_wh1000xm4_anc_vacuum_hz, open_wh1000xm4_vacuum_fft);
                subtitle("Open");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim_orig = get(gca, "ylim");
                subplot(3, 1, 2);
                plot(closed_wh1000xm4_anc_vacuum_hz, closed_wh1000xm4_vacuum_fft);
                subtitle("Closed");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
                subplot(3, 1, 3);
                plot(closed_wh1000xm4_anc_vacuum_hz, closed_wh1000xm4_anc_vacuum_fft);
                subtitle("Closed, with ANC");
                xlabel("Frequency (Hz)"); ylabel("Magnitude");
                xlim([0, max_freq]);
                ylim(ylim_orig);
            end
            % xlabel("Frequency (Hz)"); ylabel("Magnitude");
            % title("Vacuuming with Different Headphone States");
            % legend();
            
            % hold off
    end
end
