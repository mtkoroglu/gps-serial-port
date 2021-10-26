import numpy as np
import serial
ser = serial.Serial()
ser.baudrate = 57600
ser.port = 'COM7'
ser.open()
if (ser.is_open):
    print('Serial port %s with %i baudrate is open.' %(ser.port, ser.baudrate))
coordinate = np.zeros(2, dtype='f') # latitude, longitude
print(type(coordinate))
i = 0
n = 20
while i < n:
    #if ser.read() == 'h':
    coordinate[0] = ser.readline(4)
    coordinate[1] = ser.readline(4)
    i = i + 1
    print('i = %i    Latitude = %.5f    Longitude = %.5f' %(i, coordinate[0], coordinate[1]))
ser.close()
if (not ser.is_open):
    print('Serial port is terminated.')