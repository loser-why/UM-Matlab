function [Y,Xf,Af] = nnet_2019_10_01_13_00(X,~,~)
%NNET_2019_10_01_13_00 neural network simulation function.
%
% Auto-generated by MATLAB, 01-Oct-2019 13:00:39.
% 
% [Y] = nnet_2019_10_01_13_00(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 3xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1.61801073792437;-1.39324170158587;-1.38506603682853];
x1_step1.gain = [0.62315006704972;0.699300701266655;0.658357661876592];
x1_step1.ymin = -1;

% Layer 1
b1 = [3.9862672458204841952;2.0085195240445385956;-0.70890713752893819155;-0.45892569278935463339;0.035644605797900630328;0.053956813581169757454;-1.1195647767924428173;1.4876041367864825116;1.347520573443862224;-2.6693793191676760124];
IW1_1 = [-3.012279604564329194 -2.5710669773694743157 1.9241380832751100449;-1.6739070151280810439 0.44985698066503687631 2.9308322228776346741;-0.50695885392554496107 0.0067258223487115850053 0.6370223424103031995;0.29245546741105327149 -0.03176785170095590416 -0.33038246967751405681;-0.091610888263631423678 0.054978233560493125487 -0.13481965132784562433;-0.03758743703690593102 0.32868430083123822971 0.19139282551396707976;1.015421756421080568 -1.674305023010419724 -0.43391411087749981457;2.219819107494551691 -2.6072308820713536726 -0.66767880166356419203;1.8804546641843873367 -2.3547804135048804319 -0.5912670344156557567;-0.57628034824277118986 1.5934268171023637795 -0.26772359151640395813];

% Layer 2
b2 = [-0.19247355578153138578;0.68842656275475511141;0.50789369534366191061];
LW2_1 = [-0.047986708196904911961 -0.012329380090949599441 0.093054479068843815037 -0.64015515169500647463 -0.17692456331214584386 2.7922584807963182207 -0.11100665017333603835 0.38819400837444784091 -0.49938353627429676873 0.012199056880736816599;-0.022714054389979521781 -0.035150107143442736735 -0.92817975115241091455 2.8530954382415640858 0.87541249894451333979 2.7683774800668476956 0.050159110476153428992 -0.0093965013323160841846 0.067489980712216846026 0.21702442417547446185;-0.011645294461088161186 -0.017254282564131435268 -0.43676055780523348471 1.1095218521795460198 -8.7289316132825955918 0.87309334540261118729 -0.0095473595155944942364 0.032502899487300958292 -0.040436427216901972559 -0.054211568024174358604];

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