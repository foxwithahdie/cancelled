function all_sounds_overlay_zoom(max_freq)
    arguments
        % Maximum frequency displayed.
        max_freq (1, 1) double
    end

    load("data/matlab/fft_data.mat");
    
    open_hz_list = {open_wh1000xm4_feedback_hz, open_wh1000xm4_vacuum_hz, open_wh1000xm4_mariah_carey_hz, open_wh1000xm4_no_sound_hz, open_wh1000xm4_talking_hz};
    closed_hz_list = {closed_wh1000xm4_feedback_hz, closed_wh1000xm4_vacuum_hz, closed_wh1000xm4_mariah_carey_hz, closed_wh1000xm4_no_sound_hz, closed_wh1000xm4_talking_hz};
    closed_anc_hz_list = {closed_wh1000xm4_anc_feedback_hz, closed_wh1000xm4_anc_vacuum_hz, closed_wh1000xm4_anc_mariah_carey_hz, closed_wh1000xm4_anc_no_sound_hz, closed_wh1000xm4_anc_talking_hz};

    open_max_val = max([length(open_wh1000xm4_talking_hz), length(open_wh1000xm4_feedback_hz), length(open_wh1000xm4_vacuum_hz), length(open_wh1000xm4_mariah_carey_hz), length(open_wh1000xm4_no_sound_hz)]);
    open_wh1000xm4_talking_fft = open_wh1000xm4_talking_fft(1:open_max_val);
    open_wh1000xm4_feedback_fft = open_wh1000xm4_feedback_fft(1:open_max_val);
    open_wh1000xm4_vacuum_fft = open_wh1000xm4_vacuum_fft(1:open_max_val);
    open_wh1000xm4_no_sound_fft = open_wh1000xm4_no_sound_fft(1:open_max_val);
    open_wh1000xm4_mariah_carey_fft = open_wh1000xm4_mariah_carey_fft(1:open_max_val);

    closed_max_val = max([length(closed_wh1000xm4_talking_hz), length(closed_wh1000xm4_feedback_hz), length(closed_wh1000xm4_vacuum_hz), length(closed_wh1000xm4_mariah_carey_hz), length(closed_wh1000xm4_no_sound_hz)]);
    closed_wh1000xm4_talking_fft = closed_wh1000xm4_talking_fft(1:closed_max_val);
    closed_wh1000xm4_feedback_fft = closed_wh1000xm4_feedback_fft(1:closed_max_val);
    closed_wh1000xm4_vacuum_fft = closed_wh1000xm4_vacuum_fft(1:closed_max_val);
    closed_wh1000xm4_no_sound_fft = closed_wh1000xm4_no_sound_fft(1:closed_max_val);
    closed_wh1000xm4_mariah_carey_fft = closed_wh1000xm4_mariah_carey_fft(1:closed_max_val);

    closed_anc_max_val = max([length(closed_wh1000xm4_anc_talking_hz), length(closed_wh1000xm4_anc_feedback_hz), length(closed_wh1000xm4_anc_vacuum_hz), length(closed_wh1000xm4_anc_mariah_carey_hz), length(closed_wh1000xm4_anc_no_sound_hz)]);
    closed_wh1000xm4_anc_talking_fft = closed_wh1000xm4_anc_talking_fft(1:closed_anc_max_val);
    closed_wh1000xm4_anc_feedback_fft = closed_wh1000xm4_anc_feedback_fft(1:closed_anc_max_val);
    closed_wh1000xm4_anc_vacuum_fft = closed_wh1000xm4_anc_vacuum_fft(1:closed_anc_max_val);
    closed_wh1000xm4_anc_no_sound_fft = closed_wh1000xm4_anc_no_sound_fft(1:closed_anc_max_val);
    closed_wh1000xm4_anc_mariah_carey_fft = closed_wh1000xm4_anc_mariah_carey_fft(1:closed_anc_max_val);
    clf;
    figure();
    subplot(3, 1, 1);
    plot(longest_list(open_hz_list), open_wh1000xm4_mariah_carey_fft, DisplayName="Mariah Carey Song"); hold on
    plot(longest_list(open_hz_list), open_wh1000xm4_no_sound_fft, DisplayName="No Sound");
    plot(longest_list(open_hz_list), open_wh1000xm4_vacuum_fft, DisplayName="Vacuuming");
    plot(longest_list(open_hz_list), open_wh1000xm4_feedback_fft, DisplayName="Feedback");
    plot(longest_list(open_hz_list), open_wh1000xm4_talking_fft, DisplayName="Talking");
    xlim([0, max_freq]);
    subtitle("Open");
    ylim([0, 0.3*10^-5]);
    legend();
    hold off
    subplot(3, 1, 2);
    plot(longest_list(closed_hz_list), closed_wh1000xm4_mariah_carey_fft, DisplayName="Mariah Carey Song"); hold on
    plot(longest_list(closed_hz_list), closed_wh1000xm4_no_sound_fft, DisplayName="No Sound");
    plot(longest_list(closed_hz_list), closed_wh1000xm4_vacuum_fft, DisplayName="Vacuuming");
    plot(longest_list(closed_hz_list), closed_wh1000xm4_feedback_fft, DisplayName="Feedback");
    plot(longest_list(closed_hz_list), closed_wh1000xm4_talking_fft, DisplayName="Talking");
    xlim([0, max_freq]);
    ylim([0, 0.3*10^-5]);
    legend();
    subtitle("Closed");
    hold off
    subplot(3, 1, 3);
    plot(longest_list(closed_anc_hz_list), closed_wh1000xm4_anc_mariah_carey_fft, DisplayName="Mariah Carey Song"); hold on
    plot(longest_list(closed_anc_hz_list), closed_wh1000xm4_anc_no_sound_fft, DisplayName="No Sound");
    plot(longest_list(closed_anc_hz_list), closed_wh1000xm4_anc_vacuum_fft, DisplayName="Vacuuming");
    plot(longest_list(closed_anc_hz_list), closed_wh1000xm4_anc_feedback_fft, DisplayName="Feedback");
    plot(longest_list(closed_anc_hz_list), closed_wh1000xm4_anc_talking_fft, DisplayName="Talking");
    xlim([0, max_freq]);
    ylim([0, 0.3*10^-5]);
    legend();
    subtitle("Closed, with ANC");
    hold off
    sgtitle("All Sounds in their Respective Category Overlay")

end

function [list] = longest_list(lists)
    arguments
        lists cell
    end
    [~, cols] = size(lists);
    smallest_dim = cols;

    lengths = zeros([smallest_dim, 1]);
    for i = 1:smallest_dim
        lengths(i) = length(lists{i});
    end


    for i = 1:smallest_dim
        if length(lists{i}) == max(lengths)
            list = lists{i};
        end
    end
end