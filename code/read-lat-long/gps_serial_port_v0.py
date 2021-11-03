import numpy as np
import serial
ser = serial.Serial()
ser.baudrate = 57600
ser.port = 'COM3'
ser.open()
if (ser.is_open):
    print('Serial port %s with %i baudrate is open.' %(ser.port, ser.baudrate))
coordinate = np.zeros(2, dtype='float32') # latitude, longitude
i = 0 # packet number
n = 60 # how many packets to receive
while i <= n:
    if ser.read() == b'\x68': # corresponds to 'h'
        if i == 0:
            ser.flush()
            print('The serial port buffer is flushed. Data transfer begins now.')
            print('Total of %i packets will be received.' %n)
        else:
            coordinate[0] = np.frombuffer(ser.read(4), dtype='float32')
            coordinate[1] = np.frombuffer(ser.read(4), dtype='float32')
            print('Packet = %i    Latitude = %.6f    Longitude = %.6f' %(i, coordinate[0], coordinate[1]))
        i = i + 1 # next packet
ser.close()
if (not ser.is_open):
    print('Serial port is terminated.')