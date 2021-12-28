function coordinateFloat = dms2float(deg, min, sec)
absDeg = abs(deg);
coordinateFloat = sign(deg)*(absDeg + min/60 + sec/3600);
end