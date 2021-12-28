function coordinateFloat = dms2float(deg, min, sec)
coordinateFloat = sign(deg) * (abs(deg) + min/60 + sec/3600);
end