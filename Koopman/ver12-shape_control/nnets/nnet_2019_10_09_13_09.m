function [Y,Xf,Af] = nnet_2019_10_09_13_09(X,~,~)
%NNET_2019_10_09_13_09 neural network simulation function.
%
% Auto-generated by MATLAB, 09-Oct-2019 13:09:34.
% 
% [Y] = nnet_2019_10_09_13_09(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 2xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1.14526360229741;-0.986308605304403];
x1_step1.gain = [0.930332023708739;1.01971393711927];
x1_step1.ymin = -1;

% Layer 1
b1 = [-6.4627226671039652572;1.9803003270308798811;3.3658688612935740991;1.2800625744397375882;-5.2569654396129852358;0.55282775479707635391;2.0837718421523625523;8.4204803164076658106;-7.6574364650702158031;7.5364519348215877059];
IW1_1 = [3.7232263462132211274 -5.4347591012591784931;-1.54672510611847569 -1.0386412982828912011;-3.7563047076548015113 -4.1538489537649869732;-2.1400860955357074999 2.7170037708075218674;13.649883948936906819 -29.681315939664873582;65.497170557789743839 5.2508325358034539931;8.3338296188039517887 10.355343178330672416;11.302676039368147798 -9.4257465915146347868;-10.191779176373955806 8.5527084507084261134;7.8663587023828061007 4.5378507756310231258];

% Layer 2
b2 = [0.23034796865619025508;0.70617950459118705719;-0.096873500927297573337];
LW2_1 = [0.11450451723683824357 -0.43042472101343576263 -0.085756896238336238758 -0.18425369981875461267 0.02723306381681130095 0.097890274388220788193 0.088980151012551841894 1.0113778755794484709 0.86556103295431285893 0.28668991478513805582;0.33049554425897764709 -0.72993744463148757529 0.0047877479438711012527 -0.21391428493260494781 -0.068415407302750586016 -0.018781190551367666491 0.031482003286852487667 -5.2140802241974935072 -5.4651902319980907308 0.12707559103889862206;0.076689455276882895207 0.0012161644830576551213 -0.12481492415510843375 -0.07419659288796827401 -0.0075850937703699312584 -0.014959556756369856226 0.038415285625890360777 2.1389694941646633097 2.1058673982992415219 0.2829680219030462629];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [1;1;1];
y1_step1.xoffset = [-1;-1;-1];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end
