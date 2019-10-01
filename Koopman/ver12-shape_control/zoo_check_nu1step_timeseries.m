% zoo_check_nu1step_timeseries

function [ nu_calc , nu_real ] = zoo_check_nu1step_timeseries( zeta_t , ydes_t , nu_t , sys )

for i = 1 : size( ydes_t , 1 ) - ( 1 + sys.params.nd )
    nu_calc(i,:) = zoo_check_nu1step( zeta_t(i,:)' , ydes_t(i+1,:)' , sys );
    nu_real(i,:) = nu_t(i,:);
end

end