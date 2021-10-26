clear; clc;
s = serialport('COM7', 57600);
flush(s);
stopTime = 60; % seconds
tic
while ( toc < stopTime )
    if ( read(s, 1, 'uint8') == 'h' )
        latitude = read(s, 1, 'single');
        longitude = read(s, 1, 'single');
        fprintf('Number of bytes available = %i    Time = %.2fs    latitude = %.5f    longitude = %.5f\n', ...
            s.NumBytesAvailable, toc, latitude, longitude);
    end
end
delete(s);