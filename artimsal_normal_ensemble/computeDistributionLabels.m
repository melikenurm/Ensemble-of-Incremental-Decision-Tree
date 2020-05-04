function [dist] = computeDistributionLabels(data)
    [ornek,ozellik]=size(data);
    nofclass=max(data(:,ozellik));
    dist = zeros(1, ozellik-1);

    for label=1:nofclass
        %her �zelli�in farkl� durumlar� i�in s�n�flarda bulunan eleman say�lar� 
        dist(label) = size(data(data(:, ozellik) == label, 1), 1);
    end
end
