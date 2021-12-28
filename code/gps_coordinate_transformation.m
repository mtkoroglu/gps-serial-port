clear all; clc;
coordinate = input('Ondalıklı bir sayı girin: ');
[d, m, s] = float2dms(coordinate);
fprintf('%.6f° = %i° %i" %.5f''\n', coordinate, d, m, s);

coordinate = input('Ondalıklı bir sayı daha girin: ');
[d, m, s] = float2dms(coordinate);
fprintf('%.6f° = %i° %i" %.5f''\n', coordinate, d, m, s);

disp('Bu sefer derece, dakika, saniye formatında üç sayı girin.');
d = input('Derece (tam sayı): ');
m = input('Dakika (tam sayı): ');
s = input('Saniye (ondalık sayı): ');
coordinate = dms2float(d, m, s);
fprintf('%i° %i" %.1f'' = %.6f°\n', d, m, s, coordinate)