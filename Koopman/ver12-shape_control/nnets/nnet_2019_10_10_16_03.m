function [Y,Xf,Af] = nnet_2019_10_10_16_03(X,~,~)
%NNET_2019_10_10_16_03 neural network simulation function.
%
% Auto-generated by MATLAB, 10-Oct-2019 16:03:04.
% 
% [Y] = nnet_2019_10_10_16_03(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 17xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-1.14442667416478;-1.49800716766805;-0.876484583540691;-0.855644998545353;-1.13564271540671;-1.04113275505998;-0.811526037092027;-0.856171254012849;-1.19423582522909;-0.707091217865759;-0.389546953691334;-0.136331823500732;-0.378657799778873;-1.09313373138022;-4.2667542292719e-10;-1;-1];
x1_step1.gain = [0.998153031776509;0.911662006183333;1.04684758694583;0.953856800828394;1.10622818088202;0.973502215890809;1.53660959025819;1.45451186985087;1.30555976824371;1.39242913809499;2.42091154889535;7.77016739435578;2.19385653119377;1.33828906940758;1836724482.44544;1;1];
x1_step1.ymin = -1;

% Layer 1
b1 = [0.95888536387127898397;-16.379268120206315729;-0.61254301758136764366;3.610021054005378538;-3.5413301935798782161;-3.5598482396018242824;4.7925742261823245371;5.3348521139650078027;3.4169145380391787725;-15.537723254678763141];
IW1_1 = [0.61431409776025247549 2.0315610746124237451 1.3985744823360746203 -29.206825565281775425 -3.0023032434270136015 -0.66936665025404318285 4.9267255706487080857 -0.46342327331741317575 -5.4585833127922729346 2.3264732183996823522 19.088310104740720874 -2.3817097981586634603 11.640489886553520904 11.241448938329011042 -5.0837940342702463425 0.98566722341210921687 -4.525881440934414357;28.649298018876542926 12.040434257668760409 -27.694233030100807724 12.50016303981788468 -4.3721627892250936043 -33.56437113737990785 -1.4062751298492770502 -14.579092765715760294 1.3243481219008643723 17.798894384656520629 -1.2609259561701056107 -3.8389446801166426937 -12.337595864247763444 10.638143668331888847 2.0591392157933947615 0.49728746805039003576 -4.318388847951155185;-11.780060893773375952 7.6418923640156659616 -7.6252372566304282842 9.402608803953167893 -2.9481836740932245711 9.8160740097417136241 -4.7547652976433010252 3.6339289799374965284 -3.7802472310706973779 6.494770036049271944 -5.3404934127344860784 1.7292691863474742853 -1.7094570523740770795 3.436856138803682903 -0.3422579466529785952 -0.044638910952178235958 1.2703947748183403998;4.0586932869360206055 2.419117233795685884 17.663977640321952833 -3.7059989414558529575 18.221514801772809022 -3.5657509105407574346 -3.2012215923892397562 -1.8953584354492933883 5.4964960829341329429 -15.970779750932079466 1.4341085379252618281 2.2353731077415690542 -0.23874918340319825627 -20.102076389642355991 3.7704553130513973613 4.2340685043880670335 1.6409113049280534824;9.364061278908598851 1.0735226546802516534 -5.4615437107594795307 -1.3568486826422163638 -3.1899664158781089185 -9.6099618023547339618 -0.53791275559837925524 2.7505388426125794155 -0.57626305037325531444 4.7885534141561283406 7.7017557391096325148 3.2254983865369455387 -13.076701059646284264 1.2566383241199310383 -0.89035484930567887485 1.3199061163774528094 -0.61945023558225342786;-20.890474704154989638 -11.775020000193142877 16.726735599524111819 -14.28903701384486169 2.886094951868972025 25.104637092805763388 7.2479153996363079315 10.025090755442441548 12.387675079261656563 -14.392561599839503117 0.43622438037074090511 -3.2095061632174726185 14.196257328622250427 -0.37783512898338450503 1.2501107947064855619 -0.26225810359827150808 0.87419220014257958962;12.166018218050904665 -4.3110705365628216867 19.250589457630905343 -7.653190237515659966 9.3554809939832033194 -10.300523835165254383 1.8779673402463639142 -8.8086137812984688367 1.3050456694582359685 -15.01296757055662745 1.3976900214037555337 -4.5997206170906244083 8.1266336585514302726 -6.8696583377259914371 1.5884203203130342619 -0.68987151829406656578 -1.0381659445828506083;6.7782246342107885795 -1.7635741745999633512 21.66240841022426622 3.3089899236553819151 11.893414538060643082 -4.1146423158171021583 0.062547239860206632622 -4.3073073895659659271 2.4758856998841469732 -14.125889462824499532 -2.8983450099568464076 -3.2458326660346732417 1.2523142671723017649 -8.3199573932371748697 1.2119516425295266959 1.9821345253642026485 0.35365130390829718765;3.8279540455345517636 3.0184658770502705849 17.174340206452683333 -3.9555835605064229021 18.092742299517443172 -3.2862828243421726704 -3.3078113505596822286 -1.6698064426322751785 4.5741713542491417854 -14.891194403183316552 1.7680424716894111992 1.8534395804236809546 -0.32881434091839278899 -19.115933112197577515 3.5603774047726770569 4.0183863466210310023 1.508478118311520344;-35.186904750769762984 4.6378392229670808433 -55.412441251335316394 -14.510308130248322556 3.7404543267504064552 36.417454450131998556 0.42641108907468550093 26.415746914751551344 -2.3364878217816142936 38.282340311650351339 9.7754717844968759266 1.7888610049180078132 0.62781905583089925305 -5.6335729633538864647 -0.63600324312391942616 -6.8897682049903199442 1.6106055387643947174];

% Layer 2
b2 = [3.8652833800124657415;-5.7545308868706941396;-2.9056178938349805918];
LW2_1 = [-3.3874921450559050129 -0.68088851802185634821 1.462030258769650759 -0.78839679691080266632 0.6998275327940354229 0.24439743169082872587 1.6467314492371711854 -1.3142049468909169363 0.99649882363647945827 0.21062362603071238532;6.0226606789097623107 -0.73005277794725220719 1.2903304740595060718 9.4125473749798942436 0.64620064237702490306 -0.10852561197904740664 0.81721302905419046514 0.42396476256949106043 -9.8462255547018884272 1.0379058484954657438;2.9331124220187767548 -0.28564551588012765393 0.58163748495561173879 7.8260820435072675494 0.35837873537244702149 0.045463109440740653855 0.25653366614736161644 0.8515596453534296506 -8.1515863723175225886 0.80479760630453667236];

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