x = 'LOA';                 %// Set of possible letters
K = 20;                      %// Length of each permutation

%// Create all possible permutations (with repetition) of letters stored in x
C = cell(K, 1);             %// Preallocate a cell array
[C{:}] = ndgrid(x);         %// Create K grids of values
y = cellfun(@(x){x(:)}, C); %// Convert grids to column vectors
y = [y{:}];


count = 0;
for i=1:size(y,1)
    if (~isempty(regexp(y(i,:),'A{3}', 'match')) || size(regexp(y(i,:), 'L', 'match'), 2) > 1)
        continue
    else
        count = count + 1;
        y(i,:);
    end
end
count
        
        