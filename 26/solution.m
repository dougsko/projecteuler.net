biggest_period = 0;
biggest_d = d;

for d=1:1000
    period = repeatingdec(d);
    if(period > biggest_period)
        biggest_period = period;
        biggest_d = d;
    end
end
biggest_d
biggest_period
    
    