wifi.setmode(wifi.STATION)
wifi.sta.config("SSID","WIRELESSPASSWORD")
rate=0
offset=0
counter=0
hours=0
mins=0
dofile('httpget.lua')
tmr.alarm(0, 60000, 1, function() dofile('httpget.lua') end )
