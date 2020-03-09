# Aircon controller

Controlling my air conditioner remotely from anywhere by using an ESP32 and an IR emitter.  
Working for the Daikin Risora models (https://www.daikinaircon.com/risora/roomaircon.html).  

Daikin is advertising IoT features on this model but are basically lying to your face.  
You only get IoT support if you buy another board separetely (great user experience Daikin!), and the board costs around 100 USD.  
For something with a terrible UI and quite possibly security issues. Better to build one your self for a few bucks like I did.


The Esp32 connects to a remote MQTT server (pubnub in my case) and listen to events.  
The UI simply send MQTT messages to the MQTT server and the esp32 turn on/off the AC.
