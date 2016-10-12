valueOfDepths = rawDepths(:);
hist(valueOfDepths)
valueOfDepths_0 = valueOfDepths(valueOfDepths>0);
valueOfDepths_0s = sort(valueOfDepths_0);

valueOfDepths_min = min(valueOfDepths_0s);

percentageDesired = 0.95;
maxRange = round(percentageDesired*length(valueOfDepths_0));

valueOfDepths_max = valueOfDepths_0s(maxRange);

figure(1)
hist(valueOfDepths_0s,500)
figure(2)
hist(valueOfDepths_0s(1:maxRange),500)
