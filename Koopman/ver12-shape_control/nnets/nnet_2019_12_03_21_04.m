function [Y,Xf,Af] = nnet_2019_12_03_21_04(X,~,~)
%NNET_2019_12_03_21_04 neural network simulation function.
%
% Auto-generated by MATLAB, 03-Dec-2019 21:04:23.
% 
% [Y] = nnet_2019_12_03_21_04(X,~,~) takes these arguments:
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
x1_step1.xoffset = [-0.874694131559391;-0.161875883392559;-0.20309444007697;-0.283320367578247;-0.27350118617363;-1;-1];
x1_step1.gain = [1.79041310145981;2.32698450383655;4.1943768353531;3.64367853660417;4.17366751336571;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [-3.0061338615570218913;-0.27870795011635024485;-6.3749241785288344175;-0.86789549979540325797;-2.589165178948017676;2.8346211172764177455;-1.2857763922230991405;-1.8256856360815574281;-3.9153322866628794685;-2.1415943752450123938;2.2841041655430278645;2.2097493986973422153;-3.5338698275459834441;0.13571545598309422975;2.0545080611288901729;-0.36993769024700862147;2.9221514923717246681;-0.43968015333699861369;3.3061494699763556149;-0.86993961331697478023;-2.1366818393305759827;4.6211204911886891722;1.202455873502723982;2.5543787574350167446;-1.1581313415853837778;-3.3565666306915953321;-6.1785110331217181212;-3.1636574187769173072;-0.6712913335154162553;-3.3558550637572359676];
IW1_1 = [4.0128607449313138389 0.89293882942539348768 -0.13917203771379957344 -0.15660357689479117993 -0.30775578349794729949 -0.9112582876896787587 0.19353752461319623235;-0.11129848125544695991 -0.4349673921483604988 -0.16503365406390468895 0.16586496268530012688 0.03319601174574773883 -3.0004886979102787237 -0.64166664618246338492;0.95991040460407950352 0.44269813279775355186 -2.6028200973232991089 -0.50350829631659543839 0.42680909242127840209 -2.0839396775603300505 7.2962270970878977394;2.9574662174427466255 1.2810127961055641777 0.34066416074785399459 0.25161284769506292447 -0.14672382347362494803 -2.34958174375307971 0.14836136147322070977;1.096968525719583587 0.63037051031306301496 -0.30673575130492547469 0.23279865138909275335 0.078232756741306544446 0.77603701006174818922 3.4825122767465206408;-0.7137984195144613242 -0.44650089916504148713 -0.048716956785475565295 -0.065396410263441742683 -0.24387957963600326305 0.32971901716892487721 -3.9556949421788512034;0.26840096140224412036 -0.57976836832803257948 -0.33067515996302315751 -0.38286626215097219195 0.15487839140747913791 -4.0730497107050815941 0.6897846102980229599;-1.6935344414227277987 0.044915822420259259029 -4.1473899642899461071 4.9948536517158732551 0.94119783866657191762 1.0516620590029832627 3.0835263681350544296;0.22877723683955458744 -1.5018137993914149053 -0.2771849288975386516 -3.6401246798669029126 0.054617797549380391053 6.749629946284392723 2.3106141941571451959;0.76589732256224429818 0.4383720571076705208 -0.15513788010441953436 -0.056113778232029856707 0.23474501160420879753 -0.2441373837378804923 2.7789840157719454261;-0.8116942615036087938 -0.72999433256973900175 2.7833131936220136815 0.43400330621737376324 -0.35792006634706285961 4.6496785714578852122 -3.2067057302146171338;1.5145400430065778519 0.0014368585064852491991 4.3472373426102066674 -5.9444344532765684974 -0.94341236941650241654 -0.73651569798112925813 -3.3363894548228607562;0.93910781065133797085 -0.19932122106410901652 -1.0900332121537605889 -0.55910681660373495738 0.49724138180983257218 -6.5262677409413836216 2.1012509357479278727;-0.3723108221779295457 -1.1325677364649959777 3.3371377488544182732 -0.34976546177775769131 -0.65741829504051285671 2.7680131774306149239 0.44992689422579834613;-7.5009289721130301132 -2.5584835523900535392 -0.36802727835955928448 -0.1289593693868522073 0.37224863587502210471 5.4578172265500253246 -0.48047981047303878199;0.94631515280432021431 0.20927852520837419981 0.6126017856983274612 0.62427907813681149385 -0.11687005527240018621 -0.99563172431316937505 -2.884138859267991517;-1.0857955450518335105 -0.51245377716900097909 2.1505589023573201679 0.40208171182207852468 -0.30112444591324022403 6.6723362027620334302 -4.4847845416377829508;0.51137078247496592365 -0.18335830339364150854 0.58393967444106997799 0.57318738047029627047 -0.0055622465379807188579 -0.58971028000597658369 -3.0678945252389202558;0.46720312960484128295 0.46523802481914100504 1.2095487806876605852 0.98615866411953723158 -0.92438800905656359763 5.4648843701905889247 -2.5500876050322531796;-0.62429916889872272279 -0.40494915612798898508 -0.43694132710851313339 0.21467461065277870791 0.15371541349512884977 -2.1024304070855102111 -2.2286902780721771222;0.053780628869316116081 0.62944797784115524841 -1.4451859326994622723 -0.36125176241289824741 0.058455763090845914987 -6.784781017203630249 6.3772652330711387947;-0.97355457844692860903 -0.68926217102174047735 1.4220593302869983798 0.081476488997550319815 -0.17972421589786097273 2.3114334923397565902 -6.6804097471968892918;-0.026033226120547956622 0.60548472621437088304 0.49829209005932878496 0.38320972516755852366 -0.16088265823841504942 2.5543122164915024186 -0.46337992544291906061;1.3518270786595734112 -0.7372909514343782833 0.52057007640201247156 -1.9707943458543060178 0.0078752327641540831316 0.78369219810355839062 1.0684658821928858519;-0.14034788918632307153 0.48996744098546579638 -2.005989205310850565 -0.40167106756218573516 0.29669371356153895203 -1.6302475154101498944 1.5124795121655030261;1.1645530492152125213 0.39145141279517975397 -2.0611503309917442728 -0.40419178098554220391 0.3389998490014777266 -7.647379299826461363 4.7217546977192883517;0.83131430850954357581 0.17571061457340930723 -0.77241632635639856375 -0.0039787214115311747564 0.17219939488514260373 -3.8557201831771692468 5.1292402503066307773;1.1573046486564770863 0.84307563023009612913 -0.26100811575798638087 0.3023247679467725435 -0.15489017841204047454 1.4559093602742296802 3.7905614048236739855;-0.1588753289685445047 -0.56255407260616041576 -0.16406890052347281039 0.076146095480500095021 0.027029748381812407354 -2.834640591482847416 -1.2421279377137064426;-3.4443394238253310924 -3.5620791739182613433 -1.3929182467002705348 -1.6826293154379721173 0.051309953893648355128 5.0525732107838576823 1.416176017325913028];

% Layer 2
b2 = 1.5115977717625856958;
LW2_1 = [-0.48839570978859214723 -2.4264523085002394076 -1.4637312909980058073 0.87067651142749147297 3.3346972464559101468 -1.8430030069401115433 -1.4395982825869781951 0.35472026391775396403 0.12859289513160998553 -4.4870878550047308408 -1.5816004059090542633 0.33257087913026373016 -1.6869994657841713703 -0.14118538570564456713 0.24557107980814271708 1.4611447248796951559 3.9902242035658219699 -1.4445251671598595689 -0.64686491775665111437 -0.62211506151311246615 -0.29920919575866822271 -1.6462410857923390761 -2.4011746036389154391 -0.17606037051124337478 -1.0281923911975656694 3.4688634798343143117 3.4182442101471237628 -2.0452876250190539231 2.2615185392552690224 -0.29927563614651220281];

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
