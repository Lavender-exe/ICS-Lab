#!/usr/bin/python3

import snap7
from time import sleep

print("S7 PLC Simulation Server")
print("Run as root!")

s7 = snap7.server.Server()
s7.create()

def get_status():
  sleep(60)
  s7.get_status()
  
print("Server started at: 0.0.0.0:102")
while True:
  s7.start()
  get_status()