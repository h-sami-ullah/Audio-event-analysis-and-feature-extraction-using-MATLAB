function [svmStruct_gun svmStruct_sniper svmStruct_rifle ] = train_exe()

%% Simple Gun Detection

load matrix; 
load vec_gun;

species = cell(vec_gun);

groups = ismember(species, 'gun');

%for i = 1:100

[train_gun test_gun] = crossvalind('holdOut', groups);


%train_gun = ones(1, 44)';

% cp = classperf(groups);

svmStruct_gun = svmtrain(matrix(train_gun, :), groups(train_gun), 'kernel_function', 'rbf', 'rbf_sigma', 2);


% classes = svmclassify(svmStruct, matrix(test, :));
% 
% classperf(cp, classes, test);
% rate(i) = cp.CorrectRate;

%end

% rate = sum(rate)/100

%% Sniper Detection

load matrix; 
load vec_sniper;

matrix = matrix(1:17, :);

species = cell(vec_sniper);

groups = ismember(species, 'sniper');

%for i = 1:100

 [train_sniper test_sniper] = crossvalind('holdOut', groups);
% cp = classperf(groups);

%train_sniper = ones(1 ,17)';

svmStruct_sniper = svmtrain(matrix(train_sniper, :), groups(train_sniper), 'kernel_function', 'rbf', 'rbf_sigma', 2);


% classes = svmclassify(svmStruct, matrix(test, :));
% 
% classperf(cp, classes, test);
% rate_sniper(i) = cp.CorrectRate;

%end

%rate_sniper = sum(rate_sniper)/100

%% Rifle Detection


load matrix; 
load vec_rifle;

matrix = matrix(1:17, :);

species = cell(vec_rifle);

groups = ismember(species, 'rifle');

%for i = 1:100

 [train_rifle test_rifle] = crossvalind('holdOut', groups);
% cp = classperf(groups);

%train_rifle = ones(1, 17)';

svmStruct_rifle = svmtrain(matrix(train_rifle, :), groups(train_rifle), 'kernel_function', 'rbf', 'rbf_sigma', 2);


% classes = svmclassify(svmStruct, matrix(test, :));
% 
% classperf(cp, classes, test);
% rate_rifle(i) = cp.CorrectRate;

%end

%rate_rifle = sum(rate_rifle)/100

end

