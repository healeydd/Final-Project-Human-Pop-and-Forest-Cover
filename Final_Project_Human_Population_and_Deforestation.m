% forest = black, pop = country color, gdp = country color, dashed
% US = Blue, Brazil = green, Liberia = Red
% order = US, BRA, LIB
% LineWidth 

% Emily 2,3
% Finn 4,5
% Daria 6,7
% Paul 8,9

%% Reading in Land Cover Data
filename = 'forest-area-as-share-of-land-area.csv';
ForestTable = readtable(filename);
Countries = ForestTable.Entity;

idx = find(strcmp('Brazil', Countries));
Forest_BRA = table2array(ForestTable(idx, 4));

idx = find(strcmp('United States', Countries));
Forest_US = table2array(ForestTable(idx, 3:4));
idx = find(Forest_US(:,1) >= 1990);
Forest_US = Forest_US(idx,2);

idx = find(strcmp('Liberia', Countries));
Forest_LIB = table2array(ForestTable(idx, 4));

%% Population Data
filename = 'Pop_Data.csv';
PopTable = readtable(filename);
years = 1990:1:2020;
years = years';
Pop_BRA = table2array(PopTable(1,5:35))';
Pop_US = table2array(PopTable(3,5:35))';
Pop_LIB = table2array(PopTable(2,5:35))';

%% GDP Data
filename = 'GDPpercapita.csv';
GDPTable = readtable(filename);

GDP_BRA = table2array(GDPTable(1,5:34))';
GDP_US = table2array(GDPTable(3,5:34))';
GDP_LIB = table2array(GDPTable(2,5:34))';

%% Preliminary Data Analysis
%% Forest Cover Basic Statistics
F_Av_BRA = mean(Forest_BRA);
F_Av_US = mean(Forest_US);
F_Av_LIB = mean(Forest_LIB);

F_Rate_BRA = gradient(Forest_BRA);
F_Rate_US = gradient(Forest_US);
F_Rate_LIB = gradient(Forest_LIB);

F_Rate_Av_BRA = mean(F_Rate_BRA);
F_Rate_Av_US = mean(F_Rate_US);
F_Rate_Av_LIB = mean(F_Rate_LIB);

%For F_DecAvs, the rows are Brazil, US, and Liberia in order from top to bottom and the columns are 1990s, 2000s, and 2010s in order from left to right 
% the 2010s includes data from 2020
F_DecAvs = NaN(3,3);
for i = 1:3
    if i == 1
        idx = 1:10;
        F_DecAvs(1,1) = mean(Forest_BRA(idx));
        F_DecAvs(2,1) = mean(Forest_US(idx));
        F_DecAvs(3,1) = mean(Forest_LIB(idx));
    end
    if i == 2
        idx = 11:20;
        F_DecAvs(1,2) = mean(Forest_BRA(idx));
        F_DecAvs(2,2) = mean(Forest_US(idx));
        F_DecAvs(3,2) = mean(Forest_LIB(idx));
    end
   if i == 3
        idx = 21:31;
        F_DecAvs(1,3) = mean(Forest_BRA(idx));
        F_DecAvs(2,3) = mean(Forest_US(idx));
        F_DecAvs(3,3) = mean(Forest_LIB(idx));
   end
end

%% Population Basic Statistics
P_Av_BRA = mean(Pop_BRA);
P_Av_US = mean(Pop_US);
P_Av_LIB = mean(Pop_LIB); 

Pop_Rate_BRA = gradient(Pop_BRA);
Pop_Rate_US = gradient(Pop_US);
Pop_Rate_LIB = gradient(Pop_LIB);

Pop_Rate_Av_BRA = mean(Pop_Rate_BRA);
Pop_Rate_Av_US = mean(Pop_Rate_US);
Pop_Rate_Av_LIB = mean(Pop_Rate_LIB);

%For Pop_DecAvs, the rows are Brazil, US, and Liberia in order from top to bottom and the columns are 1990s, 2000s, and 2010s from left to right
% the 2010s includes data from 2020
Pop_DecAvs = NaN(3,3);
for i = 1:3
    if i == 1
        idx = 1:10;
        Pop_DecAvs(1,1) = mean(Pop_BRA(idx));
        Pop_DecAvs(2,1) = mean(Pop_US(idx));
        Pop_DecAvs(3,1) = mean(Pop_LIB(idx));
    end
    if i == 2
        idx = 11:20;
        Pop_DecAvs(1,2) = mean(Pop_BRA(idx));
        Pop_DecAvs(2,2) = mean(Pop_US(idx));
        Pop_DecAvs(3,2) = mean(Pop_LIB(idx));
    end
   if i == 3
        idx = 21:31;
        Pop_DecAvs(1,3) = mean(Pop_BRA(idx));
        Pop_DecAvs(2,3) = mean(Pop_US(idx));
        Pop_DecAvs(3,3) = mean(Pop_LIB(idx));
   end
end

%% GDP Basic Statistics
years_GDP = 1990:1:2019

GDP_Av_BRA = mean(GDP_BRA);
GDP_Av_US = mean(GDP_US);
GDP_Av_LIB = nanmean(GDP_LIB); 

GDP_Rate_BRA = gradient(GDP_BRA);
GDP_Rate_US = gradient(GDP_US);
GDP_Rate_LIB = gradient(GDP_LIB);

GDP_Rate_Av_BRA = mean(GDP_Rate_BRA);
GDP_Rate_Av_US = mean(GDP_Rate_US);
GDP_Rate_Av_LIB = nanmean(GDP_Rate_LIB);

% For GDP_DecAvs, the rows are Brazil, US, and Liberia in order from top to
% bottom and the columns are 1990s, 2000s, and 2010s from left to right
% the 2010s does not include data from 2020
% missing data for Liberia during 1990s
GDP_DecAvs = NaN(3,3);
for i = 1:3
    if i == 1
        idx = 1:10;
        GDP_DecAvs(1,1) = mean(GDP_BRA(idx));
        GDP_DecAvs(2,1) = mean(GDP_US(idx));
        GDP_DecAvs(3,1) = mean(GDP_LIB(idx));
    end
    if i == 2
        idx = 11:20;
        GDP_DecAvs(1,2) = mean(GDP_BRA(idx));
        GDP_DecAvs(2,2) = mean(GDP_US(idx));
        GDP_DecAvs(3,2) = mean(GDP_LIB(idx));
    end
   if i == 3
        idx = 21:30;
        GDP_DecAvs(1,3) = mean(GDP_BRA(idx));
        GDP_DecAvs(2,3) = mean(GDP_US(idx));
        GDP_DecAvs(3,3) = mean(GDP_LIB(idx));
   end
end
   
%% 
figure (1); clf
newcolors1 = [0 0 0; 0 0 1];
colororder(newcolors1)

subplot(2,1,1)
yyaxis left
plot(years, (100-Forest_US), 'k', 'LineWidth', 2)
title('United States Forest Cover vs. Population Over Time');
xlabel('Time (years)');
ylabel('Percent of Land Not Covered by Forest');
yyaxis right
plot(years, Pop_US, 'b', 'LineWidth', 2)
ylabel('Population');
legend('Percent of Land Not Covered by Forest','Population','Location','south')

hold on
subplot(2,1,2)
yyaxis left
plot(years, (100-Forest_US), 'k', 'LineWidth', 2)
title('United States Forest Cover vs. GDP per capita Over Time');
xlabel('Time (years)');
ylabel('Percent of Land Not Covered by Forest');
yyaxis right
plot(years_GDP, GDP_US, '--b', 'LineWidth', 2)
ylabel('GDP per capita ($USD)');
legend('Percent of Land Not Covered by Forest','GDP per capita', 'Location', 'south')


figure (2)
newcolors2 = [0 0 0; 0 1 0];
colororder(newcolors2)

subplot(2,1,1)
yyaxis left
plot(years, (100-Forest_BRA), 'k', 'LineWidth', 2)
title('Brazil Forest Cover vs. Population Over Time');
xlabel('Time (years)');
ylabel('Percent of Land Not Covered by Forest');
yyaxis right
plot(years, Pop_BRA, 'g', 'LineWidth', 2)
ylabel('Population');
legend('Percent of Land Not Covered by Forest','Population', 'Location', 'northwest')

hold on
subplot(2,1,2)
yyaxis left
plot(years, (100-Forest_BRA), 'k', 'LineWidth', 2)
title('Brazil Forest Cover vs. GDP per capita Over Time');
xlabel('Time (years)');
ylabel('Percent of Land Not Covered by Forest');
yyaxis right
plot(years_GDP, GDP_BRA, '--g', 'LineWidth', 2)
ylabel('GDP per capita ($USD)');
legend('Percent of Land Not Covered by Forest','GDP per capita', 'Location', 'northwest')

figure (3); clf
newcolors3 = [0 0 0; 1 0 0];
colororder(newcolors3)

subplot(2,1,1)
yyaxis left
plot(years, (100-Forest_LIB), 'k', 'LineWidth', 2)
title('Liberia Forest Cover vs. Population Over Time');
xlabel('Time (years)');
ylabel('Percent of Land Not Covered by Forest');
yyaxis right
plot(years, Pop_LIB, 'r', 'LineWidth', 2)
ylabel('Population');
legend('Percent of Land Not Covered by Forest','Population', 'Location', 'northwest')

hold on
subplot(2,1,2)
yyaxis left
plot(years, (100-Forest_LIB), 'k', 'LineWidth', 2)
title('Liberia Forest Cover vs. GDP per capita Over Time');
xlabel('Time (years)');
ylabel('Percent of Land Not Covered by Forest');
yyaxis right
plot(years_GDP, GDP_LIB, '--r', 'LineWidth', 2)
ylabel('GDP per capita ($USD)');
legend('Percent of Land Not Covered by Forest','GDP per capita', 'Location', 'northwest')

%%
[~,~, ~, ~, stats] = regress(Pop_BRA, (100-Forest_BRA));
PopF_R2_BRA = stats(1,1);

[~,~, ~, ~, stats] = regress(Pop_US, (100-Forest_US));
PopF_R2_US = stats(1,1);

[~,~, ~, ~, stats] = regress(Pop_LIB, (100-Forest_LIB));
PopF_R2_LIB = stats(1,1);

[~,~, ~, ~, stats] = regress(GDP_BRA, (100-Forest_BRA(1:30)));
GDPF_R2_BRA = stats(1,1);

[~,~, ~, ~, stats] = regress(GDP_US, (100-Forest_US(1:30)));
GDPF_R2_US = stats(1,1);

[~,~, ~, ~, stats] = regress(GDP_LIB(11:30), (100-Forest_LIB(11:30)));
GDPF_R2_LIB = stats(1,1);
%%
X = categorical({'United States', 'Brazil', 'Liberia'});
X = reordercats(X, {'United States', 'Brazil', 'Liberia'});

PopAv = [P_Av_US, P_Av_BRA, P_Av_LIB];

figure(4); clf
b = bar(X, PopAv)
b.FaceColor = 'flat';
b.CData(2,:) = [0 1 0]
b.CData(3,:) = [1 0 0]
title('Average Population by Country')
ylabel('Average Population 1990-2020')
%%
PopAvRate = [Pop_Rate_Av_US, Pop_Rate_Av_BRA, Pop_Rate_Av_LIB];

figure(5); clf
b = bar(X, PopAvRate)
b.FaceColor = 'flat';
b.CData(2,:) = [0 1 0]
b.CData(3,:) = [1 0 0]
title('Average Rate of Population Growth by Country')
ylabel('Average Rate of Population Growth 1990-2020 (people per year)')

GDPAv = [GDP_Av_US, GDP_Av_BRA, GDP_Av_LIB];

figure(6); clf
b = bar(X,GDPAv)
b.FaceColor = 'Flat';
b.CData(2,:) = [0 1 0]
b.CData(3,:) = [1 0 0]
title('Average GDP per capita from 1990-2019')
ylabel('Average GDP per capita ($USD per person)')

GDPAvRate = [GDP_Rate_Av_US, GDP_Rate_Av_BRA, GDP_Rate_Av_LIB];
%%
figure(7); clf
b = bar(X, GDPAvRate)
b.FaceColor = 'Flat';
b.CData(2,:) = [0 1 0]
b.CData(3,:) = [1 0 0]
title('Average Rate of Change in GDP per capita from 1990-2019')
ylabel('Average Rate of Change in GDP per capita ($USD per person per year)')

ForestCover1990 = [Forest_US(1), Forest_BRA(1), Forest_LIB(1)];

%%
% do we need y-label? ==> probably yes? at least to be safe
figure(8); clf
b = bar(X, ForestCover1990)
b.FaceColor = 'Flat';
b.CData(2,:) = [0 1 0]
b.CData(3,:) = [1 0 0]
title('Percent of Forest Cover in 1990')
ylabel('Percent of Forest Cover (% of land covered by forest)')
ylim([0 100])

%%
% unit for forest cover rate of change?
figure(9)
plot(years, F_Rate_US, 'b', 'LineWidth', 2)
hold on
plot(years, F_Rate_BRA, 'g', 'LineWidth', 2)
plot(years, F_Rate_LIB, 'r', 'LineWidth', 2)
legend('United States', 'Brazil', 'Liberia')
title('Annual Forest Cover Rate of Change for 1990-2020')
xlabel('Years')
ylabel('Forest Cover Rate of Change (% per year)')

%%
F_90 = [Forest_US(1); Forest_BRA(1); Forest_LIB(1)];
Pop_Av = [P_Av_US; P_Av_BRA; P_Av_LIB];
PopRate = [Pop_Rate_Av_US; Pop_Rate_Av_BRA; Pop_Rate_Av_LIB];
GDP_Av = [GDP_Av_US; GDP_Av_BRA; GDP_Av_LIB];
GDPRate = [GDP_Rate_Av_US; GDP_Rate_Av_BRA; GDP_Rate_Av_LIB];
varNames = {'Forest Cover in 1990', 'Average Population', 'Average Rate of Change in Population', 'Average GDP per capita', 'Average Rate of Change in GDP per capita'};
rowNames = {'US', 'Brazil', 'Liberia'};
T = table(F_90, Pop_Av, PopRate, GDP_Av, GDPRate, 'VariableNames', varNames, 'RowNames', rowNames)
filename = 'Table.csv';
writetable(T, filename);