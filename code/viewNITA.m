function  [noise,fit_count] = viewNITA(vi,im_date,results_cell,doy,option)

% cleaning up vi and ima_date
y = vi;
good_idx = find(not(isnan(y)));
x = im_date(good_idx);

%---
% grab info from results_cell 
knot_set = results_cell{2};
coeff_set = results_cell{3};
fit_x = results_cell{10}(:,1);
fit_y = results_cell{10}(:,2);

axis_in = [min(x) max(x) min(y) max(y)];

if option == 'allvi'
    c = doy(good_idx);
    scatter(x,y,20,c,'filled')
    hold on
    box on
    plot(knot_set,coeff_set,'ro')
    plot(knot_set,coeff_set,'-r')
    axis(axis_in)
    colorbar
    hold off    
end

if option == 'fitvi'
    c = round((fit_x/1000-floor(fit_x/1000))*365);
    scatter(fit_x,fit_y,20,c,'filled')
    hold on
    box on
    plot(knot_set,coeff_set,'ro')
    plot(knot_set,coeff_set,'-r')
    axis(axis_in)
    colorbar
    hold off   
end

noise = results_cell{6};
fit_count = length(fit_y);

end