P = Programmable
DAP = Debugger Access Port

This repository is a build wrapper for code contained in an OpenOCD
fork, and uc_tools.

This project has two aims:

- Provide a stand-alone USB SWD DAP interface, e.g. for in-the-field
  monitoring of one or more embedded microcontrollers without
  dependency on a host PC with GDB and OpenOCD.
  
- Still allow the adapter to be used as an OpenOCD adapter for use
  with GDB and OpenOCD.
  
  
Design principles:

- The firmware should run on cheap commodity hardware.  The
  development platform is the popular "Blue Pill" board, containing an
  STM32F103C8T6.

- The USB interface is TTY ACM to host a command line interface to the
  Firmware.  This is used both for human interaction, and as an
  interface port to OpenOCD.
  
- The command language is based on Forth, which is easy to implement,
  and straightforward to use as a machine interface protocol from OpenOCD.
  
- The OpenOCD wrapper follows the OpenOCD adapter API, i.e. every
  callback is implemented as a command on the microcontroller in a 1-1
  mapping.  This keeps the driver minimal.


TODO:

- OpenOCD integration still needs some error handling, and a review
  and discussion for how and when to upstream the support.
  
- Currently the Forth compiler is not yet integrated.  Only basic
  primitive commands are supported, written in C.
  
