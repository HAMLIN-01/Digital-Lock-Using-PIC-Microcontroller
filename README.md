# Digital-Lock-Using-PIC-Microcontroller
This project demonstrates a simple digital lock system using a PIC microcontroller. A password is entered through a 4x4 keypad, and if the correct password is entered, the system unlocks. The status is displayed on an LCD. The code is written in Embedded C using MPLAB IDE, and the simulation is done in Proteus.
# Features
Password entry via 4x4 keypad.
Displays lock/unlock status on a 16x2 LCD.
Compares entered password with a predefined password.
Can be expanded to control a relay or solenoid for real-world locking mechanisms.
# Tools Used
Microcontroller: PIC,
Programming Language: Embedded C,
IDE: MPLAB IDE,
Simulation Software: Proteus
# How It Works
The user enters a password using the keypad.
The entered password is displayed as ‘*’ on the LCD.
If the password matches the predefined password, the system unlocks and displays "Access Granted."
If the password is incorrect, it displays "Access Denied."
