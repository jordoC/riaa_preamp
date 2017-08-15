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
dc_gain = 10;

%%%%%%%%%%%%%%%%%%%% METHODS / PROCESSING

s = tf('s');
H_preamp = dc_gain*(s*zero_1 + 1) / ((s*pole_1 + 1)*(s*pole_2 + 1));

%%%%%%%%%%%%%%%%%%%% PLOTTING

bode(H_preamp);
print -dpng playback.png;

