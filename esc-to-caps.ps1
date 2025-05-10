# bytes: header(8) + entries count(4) + mapping(4) + terminator(4)
$bytes = [bytes[]](0,0,0,0, 0,0,0,0 2,0,0,0 1,0,0x3A,0, 0,0,0,0)
Set-ItemProperty - Path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" `
-Name "Scancode Map" -Values $ bytes 
Restart-Computer
