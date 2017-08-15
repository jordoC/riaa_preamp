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
pole_1 = 2.122e3; %Hz
pole_2 = 50; %Hz
zero_1 = 500; %Hz

%%%%%%%%%%%%%%%%%%%% METHODS / PROCESSING

s = tf('s');
H_preamp = (s - zero_1) / ((s - pole_1)*(s - pole_2))

%%%%%%%%%%%%%%%%%%%% PLOTTING

bode(H_preamp)
print -dpng playback.png

