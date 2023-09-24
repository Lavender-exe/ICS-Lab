#!/usr/bin/python3

import snap7
import keyboard 
from time import sleep

print("S7 PLC Simulation Server")

s7 = snap7.server.Server()
s7.create()

def get_status():
  sleep(60)
  s7.get_status()
  
print("Server started at: 0.0.0.0:102")
print("[i] Press 'q' to close server")

while True:
  try:
    if keyboard.is_pressed("q"):
      print("[!] Closing Server")
      break
    s7.start()
    get_status()
  except ModuleNotFoundError:
    print("Install Keyboard Module - sudo pip install keyboard")
    break
  except Exception as e:
    print(f"Error Caught: {e}")
    break