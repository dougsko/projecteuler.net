if( matlabpool('size') <= 0 )
    matlabpool local 8
end

total_sum = 0;
total_count = 0;

parfor a = 1:120000
    for b = 1:120000
        for c = 1:120000
            if abchit(a, b, c)
                total_sum = total_sum + c;
                total_count = total_count + 1;
            end
        end
    end
end
total_sum
total_count
