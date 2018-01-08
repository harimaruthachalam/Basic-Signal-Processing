function shortFourierTransform = spectrogramVisualization (signal, windowSamples, nOverLapSamples, samplingRate, varargin)
% Hari Maruthachalam - Updated on Jan 8, 2018
% Usage : spectrogramVisualization(signal, windowSamples, nOverLapSamples, samplingRate, toVisualize, freqRange)
% Following are necessary parameters
% signal
% Length of Single Window, windowSamples
% Length of Overlapping samples in a Window, nOverLapSamples
% samplingRate
% Following parameters are having default values are as follows,
% toVisulaize = 1
% Frequency Range, freqRange = []

switch (nargin)
    case 4
        toVisulaize = 1;
        freqRange = [];
    case 5
        toVisulaize = varargin{1};
        freqRange = [];
    case 3
        toVisulaize = varargin{1};
        freqRange = varargin{2};
    otherwise
        error('Invalid number of input parameters! Usage is spectrogramVisualization(signal, windowSamples, nOverLapSamples, samplingRate, toVisualize, freqRange)');
end

shortFourierTransform = spectrogram(signal, windowSamples, nOverLapSamples, freqRange, samplingRate);

if toVisulaize == 1
    figure;
    spectrogram(signal, windowSamples, nOverLapSamples, freqRange, samplingRate, 'yaxis');
end
end
