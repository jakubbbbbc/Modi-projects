%dane statyczne
fileID = fopen('danestat.txt','r');
formatSpec = '%f %f';
stat = fscanf(fileID,formatSpec,[2 Inf]);
stat = stat';

%dane statyczne, zbiór uczący
sizeStat = size(stat);
stat_ucz = zeros(sizeStat(1)/2, 2);
j = 1;
for i = 1:2:sizeStat(1)
    stat_ucz(j,:) = stat(i,:);
    j=j+1;
end

%dane statyczne, zbiór weryfikujący
stat_wer = zeros(sizeStat(1)/2, 2);
j = 1;
for i = 2:2:sizeStat(1)
    stat_wer(j,:) = stat(i,:);
    j=j+1;
end