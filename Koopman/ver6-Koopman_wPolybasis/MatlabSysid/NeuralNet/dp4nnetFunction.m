function [y1,xf1] = dp4nnetFunction(x1,xi1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 13-Aug-2018 10:52:32.
%
% [y1,xf1] = myNeuralNetworkFunction(x1,xi1) takes these arguments:
%   x1 = 1xTS matrix, input #1
%   xi1 = 1x2 matrix, initial 2 delay states for input #1.
% and returns:
%   y1 = 4xTS matrix, output #1
%   xf1 = 1x2 matrix, final 2 delay states for input #1.
% where TS is the number of timesteps.

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = -4.97987577554016;
x1_step1.gain = 0.200886392612375;
x1_step1.ymin = -1;

% Layer 1
b1 = [3.4920534816727624;6.6025436181215662;-2.9312321144639717;-6.6557489023167724;0.016001890560732302;0.0027900289128176287;0.029968740104310138;-0.038095904900413764;-6.4337338211744184;-9.4100108124217581];
IW1_1 = [-2.4363264853106634 3.2420287210192424;-3.4299919461745132 -4.6809130393938938;3.327395608760451 1.0471625306655714;4.0876699769712177 4.370932327167333;-8.8003263240874645 9.6248478576872447;9.6889413532402866 -11.188941151656243;-7.4798986159531324 7.7319533092804384;5.4684165511812477 -5.05876301128992;-3.5799018743177302 -3.5516550981606678;-5.580732919185377 -5.2062888592673398];

% Layer 2
b2 = [0.10210395021886899;0.22722149675150871;-0.25450787436344136;0.19693701533273858];
LW2_1 = [-0.0065356635252390707 -0.61673945749700732 0.0015748270839434095 -0.56609143055621169 1.461777380824814 0.64940344456600596 -0.94136114883144473 -0.12743730179004209 0.3173376965015029 -0.26291434772376943;-0.0044424781024000586 -0.72152273416628265 0.025799547386815943 -0.70541118854619889 1.3268623468073319 0.56807758065844705 -0.92673745655168838 -0.16730628088600377 0.5113658555922439 -0.41197656388850518;0.0034584131072580428 -0.16878865278093758 0.023968935737064802 -0.035498001339969609 -0.70457442356713063 -0.15835856373270338 0.92010389995969788 0.37496108254813748 -0.87205436382621104 0.46937196212562332;-0.00011659975741900604 -1.1032052525554532 0.0005442345489904347 -0.93748864313057856 1.0880002069009937 0.38614903349546326 -0.88019703842870056 -0.17815479087628341 0.71567603886889031 -0.63249714136622359];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.523617186407085;0.459064467788146;0.223430193966737;0.127210752845805];
y1_step1.xoffset = [-1.89414184126235;-2.36502124594879;-4.45419934918392;-7.44556467563318];

% ===== SIMULATION ========

% Dimensions
TS = size(x1,2); % timesteps

% Input 1 Delay States
xd1 = mapminmax_apply(xi1,x1_step1);
xd1 = [xd1 zeros(1,1)];

% Allocate Outputs
y1 = zeros(4,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+1,3)+1;
    
    % Input 1
    xd1(:,xdts) = mapminmax_apply(x1(:,ts),x1_step1);
    
    % Layer 1
    tapdelay1 = reshape(xd1(:,mod(xdts-[1 2]-1,3)+1),2,1);
    a1 = tansig_apply(b1 + IW1_1*tapdelay1);
    
    % Layer 2
    a2 = b2 + LW2_1*a1;
    
    % Output 1
    y1(:,ts) = mapminmax_reverse(a2,y1_step1);
end

% Final delay states
finalxts = TS+(1: 2);
xits = finalxts(finalxts<=2);
xts = finalxts(finalxts>2)-2;
xf1 = [xi1(:,xits) x1(:,xts)];
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