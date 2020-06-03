%dane statyczne
fileID = fopen('danedynucz.txt','r');
formatSpec = '%f %f';
dyn_ucz = fscanf(fileID,formatSpec,[2 Inf]);
dyn_ucz = dyn_ucz';

load danedynucz.txt;

fileID = fopen('danedynwer.txt','r');
formatSpec = '%f %f';
dyn_wer = fscanf(fileID,formatSpec,[2 Inf]);
dyn_wer = dyn_wer';