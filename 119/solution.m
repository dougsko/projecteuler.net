min = 11;
max = min + 10^4;
start = tic();
while(true)
    [i, j] = meshgrid(min:max, 1:10);
    if size(i, 1) > 0
        %i_gpu = gpuArray(i(1,:));
        temp_sums = add_digits(i(1,:));
        sums = repmat(temp_sums,[size(j,1) 1]);
        powers = sums .^ j;
        p = powers(powers==i);
        disp(powers(powers==i));
    else
        min
        max
        break
    end
    min = min + 10^4 + 1;
    max = max + 10^4;
end
elapsed = toc(start)
