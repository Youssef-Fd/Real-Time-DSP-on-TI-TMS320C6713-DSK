clear all;
close all;
clc;

f = 1;
Ne = 96;
k = 15;

TabSinus1Hz = (0:Ne-1)*0;

fid = fopen('TabSinus1HzVF.dat', 'w');

fprintf(fid, 'float TabSinus1Hz[Ne] = \n {');

for i = 1:Ne
    TabSinus1Hz(i) = sin(2*pi()*(i-1)/Ne);
    
    if mod(i, Ne) == 0
        fprintf(fid, '%d }; \n ', TabSinus1Hz(i));
    else
        if mod(i,16) == 0
            fprintf(fid, '%d, \n ', TabSinus1Hz(i));
        else
            fprintf(fid, '%d ,', TabSinus1Hz(i));
        end
    end
end

TabSinus1Hz

