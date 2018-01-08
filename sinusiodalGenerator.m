function sineWave = sinusiodalGenerator (varargin)
% Hari Maruthachalam - Updated on Jan 8, 2018
% Usage : sinusiodalGenerator(frequency, samplingRate,
% timeDurationInMilliSec, phaseShift)
% These parameters are powered with default values as well. Default values
% are as follows,
% frequency = 100 Hz
% samplngRate = 1024 Hz
% timeDurationInMilliSec = 1000 ms
% phaseShift = 0 - PhaseShift in radians

switch (nargin)
    case 0
        frequency = 100;
        samplngRate = 1024;
        timeDurationInMilliSec = 1000;
        phaseShift = 0;
    case 1
        frequency = varargin{1};
        samplngRate = 1024;
        timeDurationInMilliSec = 1000;
        phaseShift = 0;
    case 2
        frequency = varargin{1};
        samplngRate = varargin{2};
        timeDurationInMilliSec = 1000;
        phaseShift = 0;
    case 3
        frequency = varargin{1};
        samplngRate = varargin{2};
        timeDurationInMilliSec = varargin{3};
        phaseShift = 0;
    case 4
        frequency = varargin{1};
        samplngRate = varargin{2};
        timeDurationInMilliSec = varargin{3};
        phaseShift = varargin{4};
    otherwise
        error('Invalid number of input parameters! Usage is sinusiodalGenerator(frequency, samplingRate, timeDurationInMilliSec, phaseShift)');
end
time = 0 : 1/samplngRate : timeDurationInMilliSec/1000;
sineWave = sin(2 * pi * frequency * time + phaseShift);
end