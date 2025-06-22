% Define the distance matrix between cities
dist = [ 0 10 15 20;
10 0 35 25;
15 35 0 30;
20 25 30 0];

% Generate all permutations of cities 2, 3, and 4
allPerms = perms([2 3 4]); % generates all permutations of the input vector.

% sorts the rows of a matrix in ascending order by default.
sortedPerms = sortrows(allPerms);

% Display the order of permutations checked
disp('Permutations checked in this order:');
disp(sortedPerms);
minDist = inf;
bestPath = [];
for i = 1:size(sortedPerms, 1)
currentPath = [1 sortedPerms(i,:) 1];
currentDist = 0;
for j = 1:length(currentPath)-1
currentDist = currentDist + dist(currentPath(j), currentPath(j+1));
end
if currentDist < minDist
minDist = currentDist;
bestPath = currentPath;
end
end

disp('Shortest Path:');
disp(bestPath);

disp('Minimum Distance:');
disp(minDist);

