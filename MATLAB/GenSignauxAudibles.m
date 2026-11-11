clear all;
close all;
clc;

f = 1;
Ne = 480;

SinTable = (0:Ne-1)*0;

fid = fopen('SinTable.dat', 'w');

fprintf(fid, 'short SinTable[480] = { \n ');

for i = 1:Ne
    SinTable(i) = round(2^12*sin(2*pi()*(i-1)/Ne));
    if i == Ne
        fprintf(fid, '%d \n };', SinTable(i));
    else
        if mod(i,16) == 0
            fprintf(fid, '%d, \n ', SinTable(i));
        else
            fprintf(fid, '%d ,', SinTable(i));
        end
    end
end

SinTable

