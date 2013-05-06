if( matlabpool('size') <= 0 )
    matlabpool open
end

parfor i = 1000000000 : 5000000000
    square = int2str(i * i);
    if(strcmp(square(1:2:end), '1234567890'))
        disp(i)
        exit
    end
end