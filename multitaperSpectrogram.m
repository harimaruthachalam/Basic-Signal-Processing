function spectrogram = multitaperSpectrogram(signal, windowSamples, noOverlappingSamples, sampleRate, toShow)
% Hari Maruthachalam - Updated on Jan 9, 2018
% Usage : spectrogram = multitaperSpectrogram(signal, windowSamples, noOverlappingSamples, sampleRate, toShow)
% Currently, toShow parameter is not functioning well. I am working on it.
% The issue is on showing the imagesc properly. If you have any suggestions, let me know

spectrogram = [];
for window = 1 : (windowSamples - noOverlappingSamples) : length(signal)
    if length(signal) < window + windowSamples
        % Fix given for padding trailing zeros
        % Still improvement needed
        samples = [signal(window : end) zeros(1, windowSamples - length(signal(window : end)))];
    else
        samples = signal(window : window + windowSamples - 1);
    end
    % Second parameter in pmtm is nw. The visual inference is that nw
    % parameter sharpens the spectogram.
    % Value of nw, which I have given as 1.25.
    % But, I am not sure of the configuration.
    % Please let me know you are aware of that.
    powerSpectralEstimateVector = flipud(pmtm(samples, 1.25, length(samples), sampleRate));
    %plot(powerSpectralEstimateVector);
    spectrogram = [spectrogram powerSpectralEstimateVector];
end

%{
freqRange = sampleRate / 2;
if toShow == 1
    figure;
    imagesc(spectrogram);
    colormap bone;
    yticks([0 : 2 : freqRange])
    %set(gca,'YTick',linespace(1,10,200));
end
%}
end
