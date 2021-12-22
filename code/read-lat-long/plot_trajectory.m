clear; close; clc;
txtFile = true;
matFile = ~txtFile;
if (txtFile)
    coordinates = single(load('gps data 11-Dec-2021 15-16-15.txt'))
else
    load koordinatlar2.mat
end
% dlmwrite('gap data.txt', coordinates, 'delimiter', '\t', 'precision', '%.7f')
figure(2);
plot(coordinates(:,3), coordinates(:,2), 'k.');
grid on; set(gca, 'gridlinestyle', '--');
xlabel('Boylam'); ylabel('Enlem');
s = 0.0001;
axis([min(coordinates(:,3))-s, max(coordinates(:,3))+s, ...
    min(coordinates(:,2))-s max(coordinates(:,2))+s]);