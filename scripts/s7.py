#!/usr/bin/python3

import snap7
from keyboard import is_pressed
from time import sleep

print("S7 PLC Simulation Server")

s7 = snap7.server.Server()
s7.create()

def get_status():
  sleep(60)
  s7.get_status()
  
def close_server():
  print("[i] Press 'Q' to quit..")
  if is_pressed('q'):
    print("[!] Closing Server")
    exit
  elif is_pressed('Q'):
    print("[!] Closing Server")
    exit 
  
print("Server started at: 0.0.0.0:102")
while True:
  s7.start()
  get_status()
  close_server()