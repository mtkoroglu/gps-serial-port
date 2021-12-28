function [deg, min, sec] = float2dms(coordinateFloat)
absCoordinateFloat = abs(coordinateFloat);
signCoordinateFloat = sign(coordinateFloat);
deg =  floor(absCoordinateFloat);
minFloat = 60*(absCoordinateFloat - deg);
deg = signCoordinateFloat * deg;
min = floor(minFloat);
sec = 60*(minFloat - min);
end