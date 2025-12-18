function gather_data_types(data_folder)
    arguments
        % Folder of data.
        data_folder (1, 1) string
    end
    files = dir(fullfile(data_folder, "*.wav"));
    for file_index = 1:length(files)
        file = files(file_index);
        file = file.name;
        frequencies_from_audio(data_folder.append("/").append(file), 1000, 0, 0);
    end
end