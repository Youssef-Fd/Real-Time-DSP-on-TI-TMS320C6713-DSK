clear all;
close all;
clc;

F = 22000;
Fe = 48000;
Ne = Fe/500;

TabSinus22KHz = (0:Ne-1)*0;

fid = fopen('TabSinus22KHz.dat', 'w');

fprintf(fid, 'float TabSinus22KHzVF[Ne] = \n {');

for i = 1:Ne
    TabSinus22KHz(i) = sin(2*pi()*(i-1)*F/Fe);
    
    if mod(i, Ne) == 0
        fprintf(fid, '%f }; \n ', TabSinus22KHz(i));
    else
        if mod(i,16) == 0
            fprintf(fid, '%f, \n ', TabSinus22KHz(i));
        else
            fprintf(fid, '%f ,', TabSinus22KHz(i));
        end
    end
end

TabSinus22KHz

