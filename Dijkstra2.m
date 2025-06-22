% Define the weighted adjacency matrix
adjmatrix = [
    0 2 0 1 0;
    2 0 4 3 0;
    0 4 0 0 6;
    1 3 0 0 5;
    0 0 6 5 0;
];

% Replace 0s (non-diagonal) with Inf
n = size(adjmatrix, 1);
for i = 1:n
    for j = 1:n
        if i ~= j && adjmatrix(i,j) == 0
            adjmatrix(i,j) = Inf;
        end
    end
end

% Initialize Dijkstra variables
startNode = 1;
visited = false(1, n);
distance = Inf(1, n);
distance(startNode) = 0;
previous = NaN(1, n);  % To track paths

% Dijkstra's algorithm
for i = 1:n
    minDist = Inf;
    u = -1;

    % Find the unvisited node with the smallest distance
    for j = 1:n
        if ~visited(j) && distance(j) < minDist
            minDist = distance(j);
            u = j;
        end
    end

    if u == -1
        break;  % All reachable nodes are visited
    end

    visited(u) = true;

    % Update distances of adjacent nodes
    for v = 1:n
        if ~visited(v) && adjmatrix(u,v) ~= Inf
            if distance(u) + adjmatrix(u,v) < distance(v)
                distance(v) = distance(u) + adjmatrix(u,v);
                previous(v) = u;  % Track the path
            end
        end
    end
end

% Display shortest distances
disp('Shortest distances from start node:');
disp(distance);

% Display shortest paths
disp('Shortest paths from start node:');
for i = 1:n
    if i == startNode
        fprintf('Node %d: Start node\n', i);
    elseif isinf(distance(i))
        fprintf('Node %d: No path\n', i);
    else
        path = i;
        j = i;
        while ~isnan(previous(j))
            path = [previous(j), path];
            j = previous(j);
        end
        fprintf('Node %d: ', i);
        fprintf('%d ', path);
        fprintf('(Total cost = %d)\n', distance(i));
    end
end
