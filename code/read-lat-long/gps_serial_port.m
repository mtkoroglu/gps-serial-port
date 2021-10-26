clear; clc;
s = serialport('COM7', 57600);
i = 0; % packet number
n = 30; % number of  packets to receive
coordinate = single(zeros(1,2)); % (latitude, longitude)
while ( i <= n )
    if ( read(s, 1, 'uint8') == 'h' )
        if (i == 0)
            flush(s);
            fprintf('The serial port buffer is flushed. Data transfer begins now.\n')
            fprintf('Total of %i packets will be received.\n', n);
        else
            coordinate(1) = read(s, 1, 'single');
            coordinate(2) = read(s, 1, 'single');
            fprintf('NumOfBytesAvailable = %i    Packet = %i    Latitude = %.5f    Longitude = %.5f\n', ...
                s.NumBytesAvailable, i, coordinate(1), coordinate(2));
        end
        i = i+1; % next packet
    end
end
delete(s);