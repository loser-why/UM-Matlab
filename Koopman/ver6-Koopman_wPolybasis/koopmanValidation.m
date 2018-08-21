function [error, koopsim] = koopmanValidation( data, valparams, koopman )
%koopmanValidation: Summary of this function goes here
%   Detailed explanation goes here

error = struct;     % error results comparing real and koopman system
koopsim = struct;   % simulation results for koopman system

for j = 1 : valparams.numVals - 1
    %% simulate the behavior of learned system
    
    % isolate the jth validation trial
    valID = ['val', num2str(j)];
    valdata = data.(valID);
    
    tspan = valdata.t;
    
    x0sim = valdata.x(1,:)'; % same initial state as validation data initial state
    [tsysid, xsysid] = ode45(@(t,x) vf_koopman(x, get_u(t, x, valdata, valparams)), tspan, x0sim);
    
    % simulated forward using the transpose of Koopman operator
    xselector = [zeros(valparams.n,1), eye(valparams.n), zeros(valparams.n, valparams.N - valparams.n - 1)]; % matrix to extract state from lifted state
    xkoop = zeros(length(tspan), valparams.n);
    xkoop(1,:) = x0sim';
    for i = 2 : length(tspan)
        ti = tspan(i);
        xnext = xselector * koopman.U' * polyLift( xkoop(i-1,:)' , get_u(ti, 0, valdata, valparams) );
        xkoop(i,:) = xnext';
    end
    
    % real system
    [treal, xreal] = deal(tspan, valdata.x(1:length(tspan) , :));
    
    
    %% quantify the error between real behavior and simulated behavior
    
    terror = treal;
    xerror = abs( xreal - xsysid );
    xerrormax = max(max(xerror(:,1:ceil(valparams.n/2))));
    % xerrormin = min(min(xerror(:,1:ceil(valparams.n/2))));
    RMSE = sqrt( sum( (xreal - xsysid).^2 ) / length(terror) );
    
    % defind output
    error.(valID).terror = terror;
    error.(valID).xerror = xerror;
    error.(valID).RMSE = RMSE;
    
    koopsim.(valID).t = tsysid;
    koopsim.(valID).x = xsysid;
    
    
    %% plot the results
    
    if valparams.ploton
        figure
        subplot(4,1,1)
        plot(treal, xreal(:,1:ceil(valparams.n/2)))
        title('Real system')
        subplot(4,1,2)
        plot(tsysid, xsysid(:,1:ceil(valparams.n/2)))
        title('Identified system')
        subplot(4,1,3)
        hold on
        plot(terror, xerror(:,1:ceil(valparams.n/2)))
        plot(terror, xerrormax * ones(size(terror)), '--')
        title('Error')
        hold off
        subplot(4,1,4)
        plot(tspan, xkoop(:,1:ceil(valparams.n/2)))
        title('Koopman Transpose Sim')
    end
    
    
    % % animate the results
    % animate_doublePendulum(sol_real, sol_sysid, valparams);

end


end


function u = get_u(t, x, valdata, valparams)
%get_u: Interpolates to estimate the value of the input at a specific t

u = interp1(valdata.t, valdata.u, t)';

end


