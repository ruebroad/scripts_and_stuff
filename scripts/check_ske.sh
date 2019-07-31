#!/bin/bash

ioreg -l -w 0 | grep SecureInput


# kCGSSessionSecureInputPID gives you the PID of the service locking SKE