import serial
import pynmea2
import RPi.GPIO as GPIO
import db_manager
from time import sleep
 
port = "/dev/ttyACM0" #default port used by the gps module. May change
 
def parseGPS(str):
    """
    Check if GGA line present in RAW data then parse data from
    that line using pynmea2
    """
    #GGA
    if str.find('GPGGA') > 0:
        msg = pynmea2.parse(str)
        return msg
    else:
        return None 
 
def get_gps_data():
    """
    open the port to receive raw gps data and convert them into readable
    and usable data.
    """
    serialPort = serial.Serial(port, baudrate = 9600, timeout = 0.5)
    while True:
        sr = serialPort.readline()
        msg = parseGPS(str(sr,'utf-8'))
        if msg != None:
            return msg
        #msg.latitude, msg.longitude, msg.timestamp

def detect_collision():
    """
    Detect if collision happenned, if yes return GPS data.
    """
    collision_pin = 23 #pin used by collision sensor
    led_pin = 21 #pin used by the led showing that collision happened and data are transfered
    GPIO.setmode(GPIO.BCM) #setup the format of the raspberry pi board.
    GPIO.setup(collision_pin, GPIO.IN) #set GPIO pin on Input mode
    GPIO.setup(led_pin, GPIO.OUT) #set GPIO pin on output mode

    while True:
        if(GPIO.input(collision_pin)):
            
            for i in range(2):
                GPIO.output(led_pin,1)
                sleep(0.1)
                GPIO.output(led_pin,0)
                sleep(0.1)
        
            gps_data = get_gps_data()
            if gps_data!=None:
                return gps_data
            else:
                return None

if __name__ == "__main__":
    gps_info = detect_collision()
    latitude = gps_info.latitude
    longitude = gps_info.longitude
    timestamp = gps_info.timestamp
    db_manager.get_connector(latitude, longitude)
    print("latitude: "+str(latitude))
    print("longitude: "+str(longitude))
    date = timestamp
    print(str(date))
        
