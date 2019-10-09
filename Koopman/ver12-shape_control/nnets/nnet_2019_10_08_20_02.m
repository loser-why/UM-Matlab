function [Y,Xf,Af] = nnet_2019_10_08_20_02(X,~,~)
%NNET_2019_10_08_20_02 neural network simulation function.
%
% Auto-generated by MATLAB, 08-Oct-2019 20:02:56.
% 
% [Y] = nnet_2019_10_08_20_02(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.859033895143921;-0.74354874134685;-0.698078735279085];
x1_step1.gain = [1.21530921354353;1.38188418294065;1.33405215389882];
x1_step1.ymin = -1;

% Layer 1
b1 = [-6.7686660425963793841;0.39543596204539133154;-0.034958530211020188982;-0.10016435098023264427;-1.5308012979698797373;-0.40595659767610570157;2.7265127844593353146;-0.0010009067140767363008;-7.639324628336057188;-2.81168414436919889];
IW1_1 = [-6.3103065716898356641 5.7880199890730956724 9.014837916099859072;1.0669511599665828516 -0.87045737971106840192 1.7514685605067399354;0.60961110522201289452 -0.53921990588788626386 -0.28498318352508156259;0.651855424664083416 0.52688771699618042188 -0.39232163777153622464;2.611129469302063022 -1.9695392372536313363 4.5757422498862734273;-0.093919047621208867627 -1.4775460723836650878 -5.4734881756862856506;1.3506486877594128249 3.9213375813883932786 1.2999291958701402194;-1.06125790116188079 -0.3679172957584183612 -0.39803682108823357222;5.704458129977282077 -4.9030815814573101008 -7.9035865000441818395;0.66435064573463264992 1.7152343625174080177 0.088765938273323463648];

% Layer 2
b2 = [-0.30888010491144290981;-0.62366360966127976084;-0.91779745621984043513];
LW2_1 = [-0.084193370057189187428 0.67724341871691828842 0.18170457633183595414 -0.4466284185162464615 0.14267177177389170351 -0.065819450849899333034 -0.0067480501663801130408 -0.44233301353636350628 0.053021241344296199394 -0.20916315034101126691;-0.10026680770236899576 0.16764949791667119183 -2.1903833878236587118 -0.13129859564957288565 0.04354827629124666255 -0.072755727507671980048 -0.052429581528687173309 -0.21404717744876722296 0.10549232623806176212 -0.66208277566212059284;-0.020985578013191140412 0.011605976400804860274 -0.47493350537497108776 1.4229367527598062448 0.0029717949986735668448 -0.018007081922752798953 -0.073841970760284869613 -0.7302773619620716028 -0.0227993781629396014 -0.97651346028467211902];

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
