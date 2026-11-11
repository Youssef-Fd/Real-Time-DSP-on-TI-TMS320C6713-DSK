clear all;
close all;
clc;

F = 22000;
Fe = 48000;
Ne = Fe/500;
k = 1;

TabSinus22KHz = (0:Ne-1)*0;

fid = fopen('TabSinus22KHz.dat', 'w');

fprintf(fid, 'short TabSinus22KHz[Ne] = \n {');

for i = 1:Ne
    TabSinus22KHz(i) = round(2^k*sin(2*pi()*(i-1)*F/Fe));
    if TabSinus22KHz(i) == 2^15
        TabSinus22KHz(i) = 32767
    end
    if mod(i, Ne) == 0
        fprintf(fid, '%d }; \n ', TabSinus22KHz(i));
    else
        if mod(i,16) == 0
            fprintf(fid, '%d, \n ', TabSinus22KHz(i));
        else
            fprintf(fid, '%d ,', TabSinus22KHz(i));
        end
    end
end

TabSinus22KHz

