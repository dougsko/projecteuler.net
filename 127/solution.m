if( matlabpool('size') <= 0 )
<<<<<<< HEAD
    matlabpool local 8
=======
    matlabpool local 4
>>>>>>> 53f85f9b1d98fd0b5664907915a242392fbc859d
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
