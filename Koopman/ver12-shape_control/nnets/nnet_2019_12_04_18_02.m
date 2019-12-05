function [Y,Xf,Af] = nnet_2019_12_04_18_02(X,~,~)
%NNET_2019_12_04_18_02 neural network simulation function.
%
% Auto-generated by MATLAB, 04-Dec-2019 18:02:49.
% 
% [Y] = nnet_2019_12_04_18_02(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 7xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.889827324617832;-0.160815301175504;-0.19433066674898;-0.252626659461866;-0.24849396953218;-1;-1];
x1_step1.gain = [1.77684159594764;2.38535721759753;4.36918859743054;3.88842902887517;4.38641791845876;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [4.7179313168652576849;-1.4937129484955622427;2.0946539658992739952;1.7849189230646147486;-0.89098989848965648441;1.9493191785619492506;2.4530985081351648347;1.6597339657388880951;-0.51875891975400723055;2.3137663438614772815;2.1561401230038614862;0.64212725318028640586;0.46883448006305011857;-3.918054180764998673;-2.9142280002023919216;-1.4320051799558131123;-0.88563343961375762259;-0.11185799094343445992;0.75075844857858486936;2.2461343853795523451;-2.3416368966885605651;-2.5381397111340020523;1.6447665756187954678;0.25492011146038889846;-1.888967477848769505;1.890980201986288467;-2.1536242890698358288;1.5028256633670096232;2.1063088205223459148;2.3127127809391714308];
IW1_1 = [-0.72662605898924503833 -0.026903079115433742308 1.899663231045973788 0.058767184184918525025 -0.18396520570758412294 -2.4790198033200838701 -4.1186886362157109076;0.13206261560910587116 -0.58213836872457103144 1.8166497791518512184 -0.10136939931152340322 -0.40826386667829261956 1.7081515514368836861 -1.1103895487266435271;-1.235815291882353284 -0.070573642779273637604 1.4786922856653477165 -0.091504353629193846409 -0.22880693176287095203 5.0850049599086153407 -2.5220419327748286875;-1.2191369093976949234 -0.34491794837604838886 1.6186132754936051192 0.058543208983963888892 -0.25893185397510437573 4.7548144548705204571 -2.7975683213780442316;-0.16496481543696908667 -0.28205176573676377094 1.5016692145291015148 -0.39834182377062343772 -0.25172863684854890343 1.2350500832836706078 -0.81755382933175102522;-0.3289068831609315291 0.41958124624328890784 -0.96225373194754337813 -0.3342506751345611371 0.12607731745517142263 -1.7109509303023771043 -0.52018796221141716529;-1.390050348974127159 -1.1010865995883982738 0.042779563032662483446 -0.25964788550720918625 -0.10013333945755702181 -1.265808231459604638 -2.7713771179079982332;-4.0754858696881122171 -2.1376932871186320462 -0.14059276654325897349 0.23886848749243602685 0.70328453925967282512 2.850659770802785431 -1.7199432930501743488;-0.12778292256087103729 -1.0313936750597205716 -0.47254177216673898254 -0.33030013646140005124 0.29266603496735366097 1.031859969797639609 3.3024550485319412729;-1.834065395630700479 -1.8444789649415667121 -0.064444170519672105968 -0.52279336772598006267 -0.14973317377520961591 -0.20860588645008140696 -2.5452923935923532639;-1.1725033903863435469 -1.1288510573144328042 -0.014632137032643672409 -0.40008502941565610156 -0.14349375112538476085 -1.1407749455853160025 -3.2866081832589242318;-2.4040268268705089483 -0.37043326570880963367 0.42135969512902032852 0.03530627370513086255 0.51080367443668517335 -1.3423125703291356459 0.58023962872963907866;-0.16053524487260656395 1.0014160242646381604 0.55164309710826442412 0.43236349165133697303 -0.29582121256552479371 -0.74715224192206020071 -3.8380270055485898872;0.88964523918965687788 0.44086044692849107873 -2.4629409338647274552 0.22849597620146713806 0.29286922126100123354 3.4677030540836444317 3.3646161769238789319;0.48332054203426844108 -0.21689977969720644624 -0.36611694007046746702 0.087693399581121059261 0.18086600681814149483 -0.68987289393598683063 4.0408044763369641572;0.98494667107967859287 0.43092594314896776053 -1.6463632627298501188 -0.18962513736558520017 0.26969342152429359727 -4.0758582471229818367 2.8746909992004181511;0.58452533992173250077 -0.71450290089666856908 0.4953340903082601443 1.3997885371251272968 0.12827835375067389578 -0.97990745080009933332 0.90624058792676509544;1.3480951420302242916 1.1807138338389862042 -0.15721353745192170881 -0.101250676049572233 -0.048381970273119613568 2.499908489281189361 0.43960321352153491903;-0.34709737958265174385 0.27958968017248880811 -0.18595191988792225679 -1.7935152678889703104 -0.020970849069755190947 0.77909754438857947711 -0.63254992336614213055;-0.1994529180167813609 0.62248658403982271015 0.35276091350106847377 0.070540452672061076944 -0.15712503501194993727 1.4222658410542712293 -3.595107251039638907;-2.6284137572446906184 -1.9521976132856986297 1.4828591526981567128 -0.83463588327285342938 0.39394386352744076296 -1.7563477173050840996 2.7987447993091185694;-0.11029457057042420243 -1.7439085866490309229 -0.4698651367150243896 -0.33221776248936218945 0.17383001133112185865 -1.6071532137289097353 3.7786193738730999847;0.28112715335413818174 0.73928786398042423134 -0.94692342216458502691 0.52336138056374559291 0.062787046414493702384 1.2834832510006151107 -0.98746411050293758649;-0.62172622869942251178 0.95985432554676253236 -0.9971430059984502936 0.5518288227151858516 0.22955468694640657201 1.4618761266496840268 2.7220945758372230294;-1.1061425496967520754 -0.23990756139618249487 -0.024045817989358793387 1.0322309032308005783 0.49894932287748045008 -0.35256564606528789652 -0.64466376217150245242;-0.42908832686627940145 0.74354667406506202987 -0.47326468642340346893 -1.1880295531159745792 0.14476800849705925844 2.2579914647880565681 2.0068523912403546383;-0.29326591166816340372 0.84870165305679168277 0.27873947269541232696 0.46493721329751724891 -0.41996817723903356878 -1.3238300959153461722 0.90135317631674227723;0.83665529241390368398 -0.78649614741172990673 1.5283058039678159012 -0.54025340243543429342 -0.5256841881322165122 -0.60913703029214205653 -0.1374534627605137338;2.93392894050550046 1.1476276180458382381 -0.21392085095767759961 -0.83995517256798712946 -0.96921688033235897652 0.47011328188605111533 0.39542586541174662429;0.23748831325594788044 -0.1864280134729770777 1.4182387672360450281 1.3263348584636756033 -0.63510024113112406585 0.72582801342506808595 -0.22150446340575630222];

% Layer 2
b2 = 0.36822102091779668198;
LW2_1 = [1.1504758577609499604 -0.82554389235784142453 -1.6515458543165151273 2.8117740791270220413 0.87615848872560075922 -1.0945937991728074135 4.0485807242531777206 -0.15808256876602988505 -1.3017496922454321329 -1.0983797605979772616 -2.2149082251279299527 -0.29689012890823462953 -0.92855464728652659101 0.60045448795497358141 3.6887903880905210663 1.3070569362556077042 0.5038234036666731086 0.20809083597949251665 0.63186232376796858112 4.0990346466994855845 0.22715934351025479643 1.0252044007069531784 0.81549596607830665551 0.33961844350807302018 1.4060610891240175047 -0.079756158369598012525 -0.054121760514954382615 0.42444903813735002096 0.61212379028241414858 -0.38656279388568087763];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 1;
y1_step1.xoffset = -1;

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
