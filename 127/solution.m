%parpool('local', 6);

total_sum = 0;
total_count = 0;

max = 1000;
parfor a = 1:max
    for b = 1:max
        for c = 1:max
            if abchit(a, b, c)
                total_sum = total_sum + c;
                total_count = total_count + 1;
            end
        end
    end
end
total_sum
total_count
