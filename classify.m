function [] = classify()

load matrix; 
load vec_gun;

species = cell(vec_gun);

groups = ismember(species, 'gun');

for i = 1:100

[train test] = crossvalind('holdOut', groups);
cp = classperf(groups);

svmStruct = svmtrain(matrix(train, :), groups(train), 'kernel_function', 'rbf', 'rbf_sigma', 2);


classes = svmclassify(svmStruct, matrix(test, :));

classperf(cp, classes, test);
rate(i) = cp.CorrectRate;

end

rate_Gun = sum(rate)

%% Sniper Detection

load matrix; 
load vec_sniper;

matrix = matrix(1:17, :);

species = cell(vec_sniper);

groups = ismember(species, 'sniper');

for i = 1:100

[train test] = crossvalind('holdOut', groups);
cp = classperf(groups);

svmStruct = svmtrain(matrix(train, :), groups(train), 'kernel_function', 'rbf', 'rbf_sigma', 2);


classes = svmclassify(svmStruct, matrix(test, :));

classperf(cp, classes, test);
rate_sniper(i) = cp.CorrectRate;

end

rate_sniper = sum(rate_sniper)

%% Rifle Detection


load matrix; 
load vec_rifle;

matrix = matrix(1:17, :);

species = cell(vec_rifle);

groups = ismember(species, 'rifle');

for i = 1:100

[train test] = crossvalind('holdOut', groups);
cp = classperf(groups);

svmStruct = svmtrain(matrix(train, :), groups(train), 'kernel_function', 'rbf', 'rbf_sigma', 2);


classes = svmclassify(svmStruct, matrix(test, :));

classperf(cp, classes, test);
rate_rifle(i) = cp.CorrectRate;

end

rate_rifle = sum(rate_rifle)

end

