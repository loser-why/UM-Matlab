function [Y,Xf,Af] = nnet_2019_10_01_17_51(X,~,~)
%NNET_2019_10_01_17_51 neural network simulation function.
%
% Auto-generated by MATLAB, 01-Oct-2019 17:51:05.
% 
% [Y] = nnet_2019_10_01_17_51(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 15xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.75258863933836;-0.892633102893141;-0.655166233842252;-0.613104085424094;-0.680436265622047;-0.587325302110363;-0.472477703309736;-0.437231370854815;-0.676997573173574;-0.688174691291315;-0.466646636427724;-0.202384247153872;-0.382197020430664;-0.654247318043954;-2.43161046853402e-12];
x1_step1.gain = [1.22945329997642;1.18713342873691;1.60944108919057;1.50781626378487;1.45743783715796;1.57373391962336;1.9873390276458;1.95682293453643;1.39779411507934;1.55728373678492;2.20500346986723;4.90256198654818;2.29112384220507;1.35827934347617;441248187661.833];
x1_step1.ymin = -1;

% Layer 1
b1 = [1.4777159219381719168;0.80103035144872791751;-1.3022805602072462516;-1.3008187876866788013;0.48004540845689569473;-1.5241937185298064517;-0.80646694167085786198;1.036485856694712826;0.43826700911827926044;-1.0852368861360492946];
IW1_1 = [-6.1367082425456978001 0.5487683783439817331 0.85316682294378121121 -3.7802580162458401247 2.2798463846140868405 3.9863274855454258194 0.25650629965602761429 2.7903880589126508482 0.36552052956609115686 0.66266675336866298629 3.3601497893306966347 0.19568933829398138524 2.1379045053226963802 -0.49986269442417291531 -0.3518547995752537294;-2.0834464540175274827 0.15568647056834419851 -7.3293003851016598205 1.0006652542057925537 -1.7378111420106683305 1.9117227717120084396 0.94178955287827381682 3.0149499782953692595 2.4047668429059041451 4.0833353221408215106 -0.37167930918504910043 0.83301094607385095525 -0.069103975601754324964 -3.215069508470108417 -1.4332530389058946163;9.2882758127363995726 1.0852253423949966837 6.8144126870340473445 -0.63859952964387489693 3.4340475149653282294 -1.5715778806557851865 -5.0650104767209223056 -3.7702177705235380145 -3.5754231197188928171 -1.7429746172933475723 -3.8071816906763893407 -0.31410928569533963506 0.22359966647789278338 0.63844588869476748272 1.181069215198847111;-2.6449691441955569537 2.8571869398205702595 -8.8390495575377237003 1.174953889248863792 -5.2512799247262824665 0.89140303116356944813 -0.51799660192191943064 1.0223716119872525709 -0.0034303131421020982561 5.9822897170293964919 -1.0046759306382468946 2.9182521697718670772 -0.76963877622122189859 2.7351238625783373948 2.6295075250505068887;-0.37671613604438602962 1.1622911098914476824 5.3072395163366952175 -2.3019918229392604125 -0.054803571810504214668 2.1048077681861849797 -3.8071456320996031053 -3.3320056187818254401 -4.0624861138707730746 1.5324293041525880454 -0.0033760442804232626557 2.7177095506241761846 6.3901263819330198501 5.1249862325432395949 -6.1622567461428250368;0.5136825203033356102 6.4427393370230223724 9.6545662986509146464 2.18711088566525369 7.5337994764249023305 -1.4027334921705862936 -4.1541699414131070256 -0.67541874409964963721 -6.2359352933487377513 -6.5940280835280331573 -0.91218549149309779978 -2.4439163020785628078 -1.5176055688655509801 -1.3458232948930035633 2.3153341604191028935;-2.6918682877373005802 1.8078651026669796398 -8.4174690267191074611 1.7461948731289325121 -4.3937125673452417374 1.0372768953593392016 0.14426321268733904857 1.5019722673400723867 0.66518312575056504077 5.4310554961124557494 -1.0497412659656548684 2.4285956577269960377 -1.3435185371399813725 1.7909036471399191193 2.0568219226278467993;3.6475700346065296209 -2.5307915906840694475 -6.3803717622818973965 -3.1743411844718996129 -3.2193296432493654358 -2.5346760268677090977 5.0675367928541881213 -1.6535854358599810787 10.568033177512756282 -1.0646924918052547149 4.1436481676192258305 -1.5924615411913516372 4.480994745813181801 -9.9742710237907132864 -2.1602451027226248215;-0.33342904274915613483 -4.222156580657722813 -4.3488148666451866831 -0.20953085727235226665 -5.7035055058043679921 -0.33023637149917722811 3.0001973843032727629 -0.26605895233337589767 3.2806982121333008173 1.846020119877176402 0.084469447721013932173 0.92804200003620518356 -0.89260264049551496512 2.7739989707255054974 1.8043647367874080523;6.9690978365114037985 0.13751569278062483748 -2.9095940120346823754 2.9130086542214286283 -4.394057140769912273 -4.3350211737105048826 -0.32659242594125537096 -3.9842521361010558856 -0.31098162487426528333 0.60836771419612734046 -2.2471793310683572109 1.1754166601285245264 -1.3771131404230227968 2.4830444982906163531 -0.33396311760889568765];

% Layer 2
b2 = [0.03897986280007654375;0.34997662743922280937;0.30104452618722338242];
LW2_1 = [-0.64793806326391001349 0.037913117563784896891 0.61311595021578058073 -2.3852861744574487268 0.36036081842918954443 0.28440150393321617095 2.8158503169990005688 0.22840979371003414244 0.38583297185820752961 -1.0044083213838557178;-1.0956095245106558522 -0.70592337848731145922 0.29099233616219843945 -2.4584849629363620949 -0.020011582966611790591 -0.45129418755690492437 3.1381354607000684354 0.2503453264067057038 -0.50502991320589718516 -1.0545773153556028401;-0.66482970717136191663 -0.62256026643588191494 0.095894370158764993817 -0.74477524565299246806 -0.22809195149335964592 -0.52383804942643474867 1.1964173069022676632 0.16266691883398165519 -0.62537245281525088991 -0.60155809710657992539];

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