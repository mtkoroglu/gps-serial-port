% gps_serial_port_v2.m
% v1'e gelen koordinatları RAM'de tutmak yerine bir txt dosyasına yazdırma 
% eklendi. Ardından plot_trajectory.m koşturulacak.
clear; clc;
s = serialport('COM3', 57600);
packetNumber = single(0); % packet number
startByte = uint8('h');
packetLength = 9; % in terms of bytes w/o the startByte
packetByteArray = uint8(zeros(1, packetLength));
coordinate = single(zeros(1,2)); % (latitude, longitude)
realTimeTrajectory = true; writeTextFile = true;
if (realTimeTrajectory)
    figure(1); clf; grid on; hold on;
    set(gca, 'gridlinestyle', '--');
end
if (writeTextFile)
    dateCharFormat = datestr(now);
    for i=1:length(dateCharFormat)
        if (dateCharFormat(i) == ':')
            dateCharFormat(i) = '-';
        end
    end
    dateCharFormat(length(dateCharFormat)+1:length(dateCharFormat)+4) = '.txt';
    textFileName = ['gps data ', dateCharFormat];
end
while (true) % i <= n yerine sonsuz döngüye
    if ( read(s, 1, 'uint8') == startByte )
        if (packetNumber == 0)
            flush(s);
            fprintf('The serial port buffer is flushed. Data transfer begins now.\n')
        else
            % read in the packet in terms of bytes (as Gabriel did in his PPM reader code)
            for i = 1:1:packetLength
                packetByteArray(i) = uint8(read(s,1,'uint8'));
            end
            coordinate(1) = typecast(packetByteArray(1:4), 'single');
            coordinate(2) = typecast(packetByteArray(5:8), 'single');
            % do our own checksum on the data packet
            checksum = uint8(0); % initialize to zero before we start
            for i = 1:packetLength-1
                checksum = bitxor(checksum, packetByteArray(i), 'uint8'); %this is a standard bitwise XOR checksum
            end
            checksum = bitxor(checksum, startByte);
            if (checksum == packetByteArray(9))
                % coordinate(1) = read(s, 1, 'single');
                % coordinate(2) = read(s, 1, 'single');
                fprintf('NumOfBytesAvailable = %i    Packet = %i    Latitude = %.7f    Longitude = %.7f\n', ...
                    s.NumBytesAvailable, packetNumber, coordinate(1), coordinate(2));
                if (realTimeTrajectory)
                    plot(coordinate(2), coordinate(1), 'k.');
                end
                if (writeTextFile)
                    packetAndCoordinate = [packetNumber coordinate];
                    if (packetNumber == 1)
                        dlmwrite(textFileName, packetAndCoordinate, 'delimiter', '\t', 'precision', '%.7f');
                    else
                        dlmwrite(textFileName, packetAndCoordinate, '-append', 'delimiter', '\t', 'precision', '%.7f');
                    end
                end
            end
        end
        packetNumber = packetNumber+1; % next packet
    end
end
delete(s);
fprintf('Serial port is terminated.\n')