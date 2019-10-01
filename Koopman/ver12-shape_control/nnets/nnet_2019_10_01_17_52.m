function [Y,Xf,Af] = nnet_2019_10_01_17_52(X,~,~)
%NNET_2019_10_01_17_52 neural network simulation function.
%
% Auto-generated by MATLAB, 01-Oct-2019 17:52:33.
% 
% [Y] = nnet_2019_10_01_17_52(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 36xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-0.748541107908522;-0.892019848528496;-0.641738310503583;-0.605963650344587;-0.69140750011311;-0.591097061673078;-0.470132015963128;-0.429316553158915;-0.659635967868346;-0.653772985252629;-0.469152319686375;-0.199287165026846;-0.381223221126774;-0.629193952016312;-0.637019534284049;-0.385171390069799;-0.15500731618812;-0.170656982962068;-0.347425150076684;-0.665097429921406;-0.639853066294843;-0.403368931597596;-0.137394396021885;-0.109348011607686;-0.112277521053254;-0.313622768028927;-0.676904898297232;-0.67431605169766;-0.339329353219688;-0.104006734252551;-0.0824620488332557;-0.0789873230610012;-0.13610212867656;-0.287559532363587;-0.695386534539406;-6.43929354282591e-14];
x1_step1.gain = [1.24525971072022;1.18008310092651;1.62033960423586;1.55665513176403;1.45759781944266;1.60824965435678;2.00490168728322;2.03669199081076;1.44131590761785;1.59011948424056;2.2026693461815;5.05921930116205;2.37704555578225;1.40016735876948;1.5718868741932;2.44655556334296;6.32865649885376;6.3143946169452;2.76206732757031;1.32637394979416;1.5395742750393;2.65608933922358;8.05431060379506;9.24641542547359;7.43164304620347;3.13758149269422;1.28898977457584;1.48588447737683;2.80199195783216;9.14041920921549;12.2302164007317;11.4204251174789;8.32363910141344;3.45403754701494;1.26180109126196;24147987278126];
x1_step1.ymin = -1;

% Layer 1
b1 = [9.7911364275003727187;3.402808198252868177;0.098660506187008917278;2.9117699935795320343;0.183308991071474775;0.24696085800276881828;-6.338386705144468003;2.5196659999658410634;7.6569269334894096701;-5.9450075374552495688];
IW1_1 = [-18.171490743648924138 -4.4649752304339154207 -0.88720021749154132085 15.379042898172309961 -7.0801403320646709716 68.313849426341164417 19.036274578394682067 54.308436476729021081 26.865532736414291293 6.9183933895672860004 -17.744113285059576413 0.94246877720095911801 -20.322221745018904215 8.3106110326859301551 -92.523776107843843874 -1.5834803288809897737 -49.310352789802522011 -14.762408726680051885 -63.177494914700801587 -44.906179454662854766 -4.3756131177886361527 5.194135305873413877 -2.2731531487872578268 6.0226350118762512764 -1.4023773257369371859 10.73683322670967577 -2.5870200371629192837 44.134189524847272423 -12.182574676335724106 22.39718157973163315 1.2963526194896701771 18.74471532745853608 9.962675414895203474 24.693749525631883301 26.023367614210656029 -0.85451540011357940418;-6.5566474512844292732 -9.7131066659132461183 10.611035183944823146 6.0929048169391624157 -5.0976692497330979847 19.728677100978913472 12.826581986081738052 20.514793250946901537 27.8394310296187939 -18.726046531370098336 -4.1901524240831893309 -5.4920617340920632188 -15.74825700232906911 12.057266253461436989 -17.462293678372404315 -11.094865922978536688 -13.370747554095006038 -11.24148227003287559 -13.415638145427394079 -34.58700325641544282 9.5613162693629352162 0.33196664341260562203 4.4119896675989833668 2.694758645944842268 2.2180271189208351501 9.7388241856860169321 -6.7349205018063820205 4.4173368749750627771 4.4077222658061705474 3.6762878096745570389 3.3919006230976922467 3.3530768097174514786 5.022561782492271476 2.478130098095822742 13.410054244905293075 -1.9040879007616544616;5.8695196008055097181 6.5939242338122188158 -12.658058910961342391 -0.035306217896207719997 -0.96416878816769902016 5.1271667594237531063 -7.2029420787482685284 -1.7816428545014901808 -12.51292652469833655 17.021730596902777677 -1.2481265771403879938 1.4794463308666025991 2.8819260343037140792 -9.3263923905723284946 -14.745222007490125904 3.4155425605766494002 -0.56702712519518616574 3.2938063362559417691 -5.2976522390431801668 25.842228473782370202 -8.007021064991587167 1.1402363648921054473 -0.76828234200685818767 -0.81721174444223732003 1.2448015496678450642 -4.131893815109855872 11.173839723679773073 8.4551722628988539299 -0.70544874290287462593 1.2501127847450421715 -0.32973881864117887686 1.7929888397082374141 -2.2607272112511886952 5.7941831996325259269 -16.752064224267805059 -0.77022092751380411002;1.9951503502838905391 13.834850458049563926 -3.2372517201791897179 6.4126070460062631895 0.95591648437357135126 7.5158358481751132985 -23.868825829233831115 2.6616733252894189121 -32.455298205339879303 9.4581580018767983375 0.97275173186303498518 -4.1517572227549415231 -3.1534209048051033975 -5.15081029613799668 -14.794925916814857914 28.871779844848084906 -7.4777915460038473228 27.03210421983251166 -14.994547285780033263 44.690335407401825307 -5.0860777338840037487 -6.493355686246559344 1.9349111984268199116 0.32114197403790178953 1.8289098043637779245 0.52961075686910097371 2.042472960711106289 8.964148509690719635 -14.887355733680854186 4.2955751584095693829 -11.502432285326921857 4.3211731789218772448 -13.917003335624098526 8.9131405143012081282 -17.408769125406735157 -3.415457884493083629;-8.3450551054641373128 -7.2934287374038238028 -9.2755456282304944438 2.6076122187183248258 5.1221851497326795766 -7.1287713714539338028 20.723621398723039988 7.8092075315077824627 36.754047485354917058 25.383945210314969643 2.4521960519952377133 -1.1477865443407524459 7.6067082099486444946 -15.391208386468710145 30.372327090346370682 -19.568067400891088425 3.2701541187404350453 -15.353181783492708234 -14.558982822316881567 -53.387138698518299407 -17.496688336335878944 -5.0136843686472101211 -2.933706164059604049 -1.6932034966773505946 3.8936407300646918017 -3.4462186644275303316 7.3037487604445816558 -21.823509889953342622 5.7238406251095108601 -6.4392592334165321688 4.1287850772220906492 -0.032000980801374756535 6.1407640704572852286 4.9048867516889362861 27.371182497076929963 0.092993710891756037329;-6.6119923192837726234 -5.3799932654587045988 -10.298066770020849248 0.67900880354642612069 7.1441372745919373699 -11.730927705252824467 12.652463917887674327 4.8200775132776749743 29.330194473268218047 28.548564253422753723 6.15016626205160577 -0.7334223897813185733 12.433633788220612715 -19.844715250332161105 37.7278992404574538 -7.6300029562594140486 4.0099654242293913953 -8.4665457079597636891 -12.992236332392920417 -41.159322594149479357 -19.753594146238839357 -6.7792651605985527752 -3.8575262704916446488 -3.1102646643585516451 3.5270843497705155478 -5.7844731884206650463 10.204817718067150878 -26.14772694349574067 -0.37402331372784125563 -6.6976440861391690618 1.4738440479105077152 0.2566611232639514073 2.8983433320592757454 4.4332131282597755373 21.189437825451445718 -0.86258541380649433883;-4.1106061354459253465 -13.255838312664559808 -8.6568271008781643161 0.86867094399607225341 0.69773016735585247083 -9.267503248624345602 39.974583599873632522 -23.101147288179841865 40.673673359531072435 13.525399408498181231 23.402258065941076381 7.6950909208483624369 -15.93921734955738323 -24.737334627677601162 33.30561290363471727 -17.042018929526619786 24.60844781791526259 -51.828641949279500523 57.805028873320736693 -42.526226072992834304 -5.2570566289105782332 -25.513082456451890323 -1.0623989837255609636 -5.396987579931424861 -6.9818164369122195367 24.257049421930794608 33.990282347925287354 -21.646032121630948808 -14.632844621790967565 -8.9123589035610226716 14.934402302664256723 -18.69745687476055096 34.679811282290685881 -40.517316488835696475 1.2998790863764899672 0.48352656696682927429;-4.384741512582771783 9.0103645783027239702 -2.9133534536165983653 7.8926887850799873902 1.0860889910525957092 37.179794808019359209 -10.356579479027136159 23.302733335187948427 -13.748504633787618445 7.4856159452918893393 -14.622149893769936568 -4.3778987023278297386 -12.043769538222953486 -5.9239980715619173779 -56.700762734268600695 3.7092605240866269867 -22.755776476406051501 1.1567417914657165401 -27.328010179138360058 28.41991128594488103 -6.4846219487059375552 8.5610537274864650925 2.4065147080897482113 4.0202923356618391892 3.5296674386018156433 3.8767800317670544352 6.941264505763664161 28.26038839390296431 -0.046497187070595691338 10.3506183907128122 0.77019430526435739282 10.585019534724667167 -0.92927044149879178825 11.165892363338475235 -19.943614933551849333 -0.72977532870435002366;-17.99627576757293923 1.0735213077608478649 -4.5380245079590650903 1.3059477376117061276 15.840462872473876743 58.934900792434390837 -0.72539883349588518691 39.501846867602196767 -2.3663156570453334204 16.610197984561796858 -34.543049497254969538 0.39283294313345212823 12.424389737043689763 -28.983915516612626107 -94.710331560522547534 19.633287797819036768 -44.58852594933981095 -7.442288768450773695 -47.300549856278955474 15.061759505094869382 -12.646147449537236795 29.067278108939227366 -4.9367887261147780364 4.2328457291699619347 0.54201304444321651843 -12.292210319523688256 20.407185001161739279 51.23660689664608725 -18.967378800835831498 26.629933918569694384 1.0761502746586986135 21.159727831559258959 5.3185600317307955009 17.116189242973455009 -17.18698476447508483 -0.55274484712516536167;-6.6536997804712649796 24.116590643929892934 16.424097772691077068 5.3843919656062082524 23.291621379364752187 5.3869617667498230773 -64.75569733124265781 -34.392598496552380993 -90.402972653271334025 -14.910815303571414603 2.0381980894089082312 2.7449270297364303239 3.0520106158153752496 -32.897981375865782638 2.8410444865127919556 97.576789825436890169 24.388167199843984179 25.946846903332847489 56.44439506335504575 145.36586135091846472 5.1859701255900638728 -6.3059233147095401506 -4.5355376950039456574 -5.4215102842811146999 -8.4206919191060460861 1.7225626903499289266 27.170623061269360221 -3.3611243898229612448 -55.083395016135312972 -7.9165452310351440701 -7.7363703692773606591 -13.979985505638300225 -4.5882635022947670933 -30.443169051926243895 -87.878343585505888313 -1.5010673636523967911];

% Layer 2
b2 = [0.034454967476649778213;0.042572247268361188;0.05755881419322620568];
LW2_1 = [-0.5828058433558852558 0.45187282487782876039 -0.25717552927611864177 0.63166060482416552802 0.33553674269759098392 -0.51069779244985491484 0.18753595683690890694 -0.066981036578993111141 0.4238570741773112216 -0.24022021846028121517;-0.24830069434389720473 -0.232832615444087343 -0.84243932142847088862 0.29471986941628586232 -0.84280013242412232799 0.52889069327967530576 0.34557531510082606374 0.69863163023963537057 0.096060444057431249032 -0.38269249803782717789;0.139610334485321258 -0.17088507323893184497 -0.31876661225293817514 -0.10505867020716810889 -1.8100866639781005851 1.7061771893438433256 0.058445736043915744173 0.32171420559952951246 -0.039191124588363164538 -0.12483755472307520029];

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
