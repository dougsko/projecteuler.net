max = 0;
big_d = 0;
for d=1:1000
   repeat = repeatingdec(1/d);
   length = numel(num2str(repeat));
   if(length > max)
       max = length;
       big_d = d;
   end
end
big_d
max