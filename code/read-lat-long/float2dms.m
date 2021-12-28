function [deg, min, sec] = float2dms(coordinateFloat)
absCoordinateFloat = abs(coordinateFloat);
absDeg =  floor(absCoordinateFloat);
minFloat = 60*(absCoordinateFloat - absDeg);
deg = sign(coordinateFloat) * absDeg;
min = floor(minFloat);
sec = 60*(minFloat - min);
end