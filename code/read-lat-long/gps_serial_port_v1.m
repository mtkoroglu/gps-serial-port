% gps_serial_port_v1.m
% v0'a gerçek zamanda görselleştirme eklendi
% gelen koordinatları RAM'de tutmak yerine bir txt veya csv dosyasına
% yazdırma bir sonraki adım. Ardından plot_trajectory.m koşturulacak.
clear; clc;
s = serialport('COM3', 57600);
i = 0; % packet number
coordinate = single(zeros(1,2)); % (latitude, longitude)
figure(1); clf; grid on; hold on;
while (true) % i <= n yerine sonsuz döngüye
    if ( read(s, 1, 'uint8') == 'h' )
        if (i == 0)
            flush(s);
            fprintf('The serial port buffer is flushed. Data transfer begins now.\n')
        else
            coordinate(1) = read(s, 1, 'single');
            coordinate(2) = read(s, 1, 'single');
            coordinates(i,1) = coordinate(1);
            coordinates(i,2) = coordinate(2);
            fprintf('NumOfBytesAvailable = %i    Packet = %i    Latitude = %.6f    Longitude = %.6f\n', ...
                s.NumBytesAvailable, i, coordinate(1), coordinate(2));
            plot(coordinate(2), coordinate(1), 'k.');
        end
        i = i+1; % next packet
    end
end
format long
mean(coordinates)
format short
delete(s);
fprintf('Serial port is terminated.\n')