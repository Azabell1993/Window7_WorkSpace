MB_DEFBUTTON1 EQU 0                             
MB_DEFBUTTON2 EQU 100h
IDNO          EQU 7
MB_YESNO      EQU 4

extern MessageBoxA                              
extern ExitProcess                              

global Start                                    

section .data                                   
 MessageBoxText     db "경직님 살아계세요?",       0
 MessageBoxCaption  db "메세지 박스 테스트",       0
 MesasgeBoxAnswer   db "아뇨",                    0
 MessageBoxCaption2 db "싫어요",                  0

section .text                                   
Start:
 sub   RSP, 8                                   
 sub   RSP, 32                                  

.DisplayMessageBox:
 xor   ECX, ECX                                
 lea   RDX, [REL MessageBoxText]               
 lea   R8, [REL MessageBoxCaption]              
 mov   R9D, MB_YESNO | MB_DEFBUTTON2            
 call  MessageBoxA
 cmp   RAX, IDNO                                
 je    .Answer
 add   RSP, 32                                  
 xor   ECX, ECX
 call  ExitProcess

 .Answer:
 xor    ECX, ECX
 lea    RDX, [REL MesasgeBoxAnswer]
 lea    R8, [REL MessageBoxCaption2]
 mov    R9D,    MB_YESNO | MB_DEFBUTTON2
 call   MessageBoxA
 cmp    RAX, IDNO                                
 xor    ECX, ECX
 add    RSP, 32
 call   ExitProcess