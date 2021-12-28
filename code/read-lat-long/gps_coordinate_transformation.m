clear all; clc;
coordinate = input('Ondalık bir sayı girin: ');
[d, m, s] = float2dms(coordinate);
fprintf('%.6f ondalık sayısı %i derece %i dakika %.5f saniyeye eşittir.\n', coordinate, d, m, s);

coordinate = input('Ondalık bir sayı daha girin: ');
[d, m, s] = float2dms(coordinate);
fprintf('%.6f ondalık sayısı %i derece %i dakika %.5f saniyeye eşittir.\n', coordinate, d, m, s);

disp('Bu sefer derece, dakika, saniye formatında üç sayı girin.');
d = input('Derece (tam sayı): ');
m = input('Dakika (tam sayı): ');
s = input('Saniye (ondalık sayı): ');
coordinate = dms2float(d, m, s);
fprintf('%i derece %i dakika %.1f saniye ondalık sayı olarak %.6f''a eşittir.\n', d, m, s, coordinate)