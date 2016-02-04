if( isempty(gcp('nocreate')) )
    matlabpool local 4
end

%min = 3356000000;
%max = 5000000000;
min = 1;
max = 1000000;

start = tic;
parfor i = min : max
    square = int2str(i * i);
    if(strcmp(square(1:2:end), '1234567890'))
        disp(i)
        elapsed = toc(start)
        exit
    end
end
elapsed = toc(start)
%matlabpool close
delete(gcp('nocreate'))

