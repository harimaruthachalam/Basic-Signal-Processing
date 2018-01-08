function [freqBins, freqBinsShift] = fourierTransform (signal, varargin)
% Hari Maruthachalam - Updated on Jan 8, 2018
% Usage : fourierTransform(signal, NoOfFFTPoints, isShowPlots)
% signal is necessary parameter
% Following parameters are having default values are as follows,
% NoOfFFTPoints = Length of Signal
% isShowPlots = 0

switch (nargin)
    case 1
        isShowPlots = 0;
        NFFT = length(signal);
    case 2
        NFFT = varargin{1};
        isShowPlots = 0;
    case 3
        NFFT = varargin{1};
        isShowPlots = varargin{2};
    otherwise
        error('Invalid number of input parameters! Usage is fourierTransform(signal, NoOfFFTPoints, isShowPlots)');
end

freqBins = fft(signal, NFFT);
freqBinsShift = fftshift(freqBins);

if isShowPlots == 1
    figure;
    nVals = 0 : NFFT-1;
    plot(nVals,abs(freqBins));
    title('Double Sided FFT - without FFTShift');
    xlabel('Sample points (N-point DFT)')
    ylabel('DFT Values');
    
    figure;
    nVals = (0 : NFFT-1) / NFFT;
    plot(nVals,abs(freqBins));
    title('Double Sided FFT - without FFTShift');
    xlabel('Normalized Frequency')
    ylabel('DFT Values');
    
    figure;
    fVals=(-NFFT/2:NFFT/2-1)/NFFT;
    plot(fVals,abs(freqBinsShift));
    title('Double Sided FFT - with FFTShift');
    xlabel('Normalized Frequency')
    ylabel('DFT Values');
end
end