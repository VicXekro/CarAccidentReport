## Car Accident Report
An application that shares the location of a vehicle in case of an accident. 

### System Design and Architecture
##### Shock detection circuit
For the circuit in charge of collecting the GPS data and detecting the shock, I used the following equipment:
* Raspberry Pi 3 Model B+
* MakerFocus GPS Module 51 Microcontroller Ublox GPS Compatible NEO-6M STM32 Arduino Navigation Satellite Positioning GT-U7
* WINGONEER 5PCS Collision detection module crash sensor collision switch keypad tuch-button touch switch robot 
* LED SLR-56VR3F (*Used for visual debugging*)
* Mophie 5V External Battery
* 2PCS 400 Point Solderless Breadboards

![Circuit used to collect GPS information and detect a shock](/Miscellaneous/Circuit_bb.jpg)

##### Overall System Design
The shock detection circuit is mounted on a dummy car. When the collision sensor detects a shock, the GPS information are gathered and send via Wifi to the database hosted on the AWS EC2 instance. Authorities can access the web application to access the reported GPS informations
![Overall System Design](/Miscellaneous/System_Design.png)