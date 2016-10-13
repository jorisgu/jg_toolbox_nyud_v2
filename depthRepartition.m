%clear all;
%load('/c16/THESE.JORIS/datasets/NYUD_V2/mat/rawDepths.mat')

valueOfDepths = rawDepths(:);
valueOfDepths_0 = valueOfDepths(valueOfDepths>0);

valueOfDepths_min = min(valueOfDepths_0);
valueOfDepths_max = max(valueOfDepths_0);

% repartition of depths value (without 0)
%figure(1);
%hist(valueOfDepths_0,500);



valueOfDepths_0s = sort(valueOfDepths_0);

figure(2)
plot(1:length(valueOfDepths_0s),valueOfDepths_0s); hold on;
percentageDesired = 0.95;
maxRange = round(percentageDesired*length(valueOfDepths_0s));
valueOfDepths_max_range = valueOfDepths_0s(maxRange);
plot( [1 length(valueOfDepths_0s)],[valueOfDepths_max_range valueOfDepths_max_range],'r' );


