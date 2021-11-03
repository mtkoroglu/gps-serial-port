clear; close; clc;
load koordinatlar2.mat
figure(2);
plot(coordinates(:,2), coordinates(:,1), 'k.');
grid on; set(gca, 'gridlinestyle', '--');
xlabel('Boylam'); ylabel('Enlem');
s = 0.0001;
axis([min(coordinates(:,2))-s, max(coordinates(:,2))+s, ...
    min(coordinates(:,1))-s max(coordinates(:,1))+s]);