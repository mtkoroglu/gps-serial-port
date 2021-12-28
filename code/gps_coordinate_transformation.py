import numpy as np
import math

def float2dms(coordinateFloat):
    absCoordinateFloat = abs(coordinateFloat)
    absDeg = math.floor(absCoordinateFloat)
    minFloat = 60 * (absCoordinateFloat - absDeg)
    deg = np.sign(coordinateFloat) * absDeg
    min = math.floor(minFloat)
    sec = 60 * (minFloat - min)
    return (deg, min, sec)

def dms2float(deg, min, sec):
    return np.sign(deg) * (abs(deg) + min/60 + sec/3600)

coordinate = float(input('Ondalıklı bir sayı girin: '))
(d, m, s) = float2dms(coordinate)
print('%.6f° = %i° %i" %.5f\'' %(coordinate, d, m, s))

print('Bu sefer derece, dakika, saniye formatında üç sayı girin.')
d = int(input('Derece (tam sayı): '))
m = int(input('Dakika (tam sayı): '))
s = float(input('Saniye (ondalık sayı): '))
coordinate = dms2float(d, m, s)
print('%i° %i" %.5f\' = %.6f°' %(d, m, s, coordinate))