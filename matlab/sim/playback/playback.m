%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% RIAA PREAMP SIMULATION 
% 
% Description:
%   Model for a RIAA pre-amplifier playback curve. Model is designed to 
%   simulate the filter curves prior to analog implementation (either passive,
%   or active implementation). Written for use with GNU Octave.
%
% Author: Jordan Clarke, jordan.clarke@usask.ca
% 
% Date: August 2017 (see commit log)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% DEPENDENCIES
pkg load control;

%%%%%%%%%%%%%%%%%%%% CONSTANTS
pole_1 = 75e-6; %Sec
pole_2 = 3.18e-3; %Sec
zero_1 = 318e-6; %Sec

%%%%%%%%%%%%%%%%%%%% METHODS / PROCESSING

s = tf('s');
H_preamp = (s*zero_1 + 1) / ((s*pole_1 + 1)*(s*pole_2 + 1));
dc_gain = abs(H_preamp(1000*2*pi))^-1;
H_preamp = dc_gain*H_preamp; %re-normalize to 0dB at 1kHz as per audio spec

%%%%%%%%%%%%%%%%%%%% PLOTTING

bode(H_preamp);
print -dpng playback.png;

