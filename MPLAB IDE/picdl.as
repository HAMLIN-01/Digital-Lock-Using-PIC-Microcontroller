opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 4 "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFFF & 0xFFFF & 0xFF7F & 0xFFFF & 0xFFFF & 0xFFFF ;#
	FNCALL	_main,_LCD_Init
	FNCALL	_main,_Keypad_Init
	FNCALL	_main,_LCD_Clear
	FNCALL	_main,_LCD_String
	FNCALL	_main,_LCD_Command
	FNCALL	_main,_Keypad_GetKey
	FNCALL	_main,_LCD_Char
	FNCALL	_main,_strcmp
	FNCALL	_LCD_String,_LCD_Char
	FNCALL	_LCD_Clear,_LCD_Command
	FNCALL	_LCD_Init,_LCD_Command
	FNROOT	_main
	global	_keypad
	global	_correct_passcode
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	33

;initializer for _keypad
	retlw	037h
	retlw	038h
	retlw	039h
	retlw	02Fh
	retlw	034h
	retlw	035h
	retlw	036h
	retlw	02Ah
	retlw	031h
	retlw	032h
	retlw	033h
	retlw	02Dh
	retlw	043h
	retlw	030h
	retlw	03Dh
	retlw	02Bh
	line	21

;initializer for _correct_passcode
	retlw	031h
	retlw	032h
	retlw	033h
	retlw	034h
	retlw	0
	global	_colloc
	global	_index
	global	_rowloc
	global	_entered_passcode
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RC0
_RC0	set	56
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_TRISB0
_TRISB0	set	1072
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	69	;'E'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	97	;'a'
	retlw	115	;'s'
	retlw	115	;'s'
	retlw	99	;'c'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_2:	
	retlw	85	;'U'
	retlw	110	;'n'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	99	;'c'
	retlw	107	;'k'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_3:	
	retlw	69	;'E'
	retlw	114	;'r'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	0
psect	strings
STR_4	equ	STR_1+0
	file	"picdl.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_colloc:
       ds      1

_index:
       ds      1

_rowloc:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_entered_passcode:
       ds      5

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	33
_keypad:
       ds      16

psect	dataBANK0
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	21
_correct_passcode:
       ds      5

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+21)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_LCD_Init
?_LCD_Init:	; 0 bytes @ 0x0
	global	?_Keypad_Init
?_Keypad_Init:	; 0 bytes @ 0x0
	global	??_Keypad_Init
??_Keypad_Init:	; 0 bytes @ 0x0
	global	?_LCD_Clear
?_LCD_Clear:	; 0 bytes @ 0x0
	global	?_LCD_String
?_LCD_String:	; 0 bytes @ 0x0
	global	?_LCD_Command
?_LCD_Command:	; 0 bytes @ 0x0
	global	??_LCD_Command
??_LCD_Command:	; 0 bytes @ 0x0
	global	??_Keypad_GetKey
??_Keypad_GetKey:	; 0 bytes @ 0x0
	global	?_LCD_Char
?_LCD_Char:	; 0 bytes @ 0x0
	global	??_LCD_Char
??_LCD_Char:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Keypad_GetKey
?_Keypad_GetKey:	; 1 bytes @ 0x0
	global	?_strcmp
?_strcmp:	; 2 bytes @ 0x0
	global	strcmp@s2
strcmp@s2:	; 1 bytes @ 0x0
	ds	2
	global	??_strcmp
??_strcmp:	; 0 bytes @ 0x2
	ds	1
	global	LCD_Command@cmd
LCD_Command@cmd:	; 1 bytes @ 0x3
	global	LCD_Char@data
LCD_Char@data:	; 1 bytes @ 0x3
	ds	1
	global	??_LCD_Init
??_LCD_Init:	; 0 bytes @ 0x4
	global	??_LCD_Clear
??_LCD_Clear:	; 0 bytes @ 0x4
	global	??_LCD_String
??_LCD_String:	; 0 bytes @ 0x4
	global	strcmp@r
strcmp@r:	; 1 bytes @ 0x4
	ds	1
	global	LCD_String@str
LCD_String@str:	; 1 bytes @ 0x5
	global	strcmp@s1
strcmp@s1:	; 1 bytes @ 0x5
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	3
	global	main@key
main@key:	; 1 bytes @ 0xA
	ds	1
;;Data sizes: Strings 31, constant 0, data 21, bss 8, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80      0      26
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_strcmp	int  size(1) Largest target is 0
;;
;; strcmp@s2	PTR const unsigned char  size(1) Largest target is 5
;;		 -> correct_passcode(BANK0[5]), 
;;
;; strcmp@s1	PTR const unsigned char  size(1) Largest target is 5
;;		 -> entered_passcode(BANK0[5]), 
;;
;; LCD_String@str	PTR const unsigned char  size(1) Largest target is 16
;;		 -> STR_4(CODE[16]), STR_3(CODE[6]), STR_2(CODE[9]), STR_1(CODE[16]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_LCD_Init
;;   _LCD_String->_LCD_Char
;;   _LCD_Clear->_LCD_Command
;;   _LCD_Init->_LCD_Command
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0     399
;;                                              7 COMMON     4     4      0
;;                           _LCD_Init
;;                        _Keypad_Init
;;                          _LCD_Clear
;;                         _LCD_String
;;                        _LCD_Command
;;                      _Keypad_GetKey
;;                           _LCD_Char
;;                             _strcmp
;; ---------------------------------------------------------------------------------
;; (1) _LCD_String                                           2     2      0      89
;;                                              4 COMMON     2     2      0
;;                           _LCD_Char
;; ---------------------------------------------------------------------------------
;; (1) _LCD_Clear                                            2     2      0      44
;;                                              4 COMMON     2     2      0
;;                        _LCD_Command
;; ---------------------------------------------------------------------------------
;; (1) _LCD_Init                                             3     3      0      44
;;                                              4 COMMON     3     3      0
;;                        _LCD_Command
;; ---------------------------------------------------------------------------------
;; (1) _LCD_Char                                             4     4      0      44
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _LCD_Command                                          4     4      0      44
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _strcmp                                               6     4      2      89
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _Keypad_GetKey                                        3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _Keypad_Init                                          1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _LCD_Init
;;     _LCD_Command
;;   _Keypad_Init
;;   _LCD_Clear
;;     _LCD_Command
;;   _LCD_String
;;     _LCD_Char
;;   _LCD_Command
;;   _Keypad_GetKey
;;   _LCD_Char
;;   _strcmp
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      2A      12        0.0%
;;ABS                  0      0      28       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      0      1A       5       32.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      B       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 36 in file "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key             1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_LCD_Init
;;		_Keypad_Init
;;		_LCD_Clear
;;		_LCD_String
;;		_LCD_Command
;;		_Keypad_GetKey
;;		_LCD_Char
;;		_strcmp
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	36
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	38
	
l2287:	
;dl.c: 38: LCD_Init();
	fcall	_LCD_Init
	line	39
;dl.c: 39: Keypad_Init();
	fcall	_Keypad_Init
	line	40
	
l2289:	
;dl.c: 40: TRISB0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	41
	
l2291:	
;dl.c: 41: TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	42
	
l2293:	
;dl.c: 42: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	44
	
l2295:	
;dl.c: 44: LCD_Clear();
	fcall	_LCD_Clear
	line	45
	
l2297:	
;dl.c: 45: LCD_String("Enter Passcode:");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_LCD_String
	line	46
	
l2299:	
;dl.c: 46: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u3267:
	decfsz	((??_main+0)+0),f
	goto	u3267
	decfsz	((??_main+0)+0+1),f
	goto	u3267
	decfsz	((??_main+0)+0+2),f
	goto	u3267
opt asmopt_on

	goto	l2301
	line	48
;dl.c: 48: while(1) {
	
l715:	
	line	49
	
l2301:	
;dl.c: 49: LCD_Command(0xC7);
	movlw	(0C7h)
	fcall	_LCD_Command
	line	50
	
l2303:	
;dl.c: 50: char key = Keypad_GetKey();
	fcall	_Keypad_GetKey
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@key)
	line	52
	
l2305:	
;dl.c: 52: if(key != 0) {
	movf	(main@key),w
	skipz
	goto	u3230
	goto	l2301
u3230:
	line	54
	
l2307:	
;dl.c: 54: LCD_Char('*');
	movlw	(02Ah)
	fcall	_LCD_Char
	line	55
	
l2309:	
;dl.c: 55: entered_passcode[index] = key;
	movf	(main@key),w
	movwf	(??_main+0)+0
	movf	(_index),w
	addlw	_entered_passcode&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	56
	
l2311:	
;dl.c: 56: index++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(_index),f
	line	59
	
l2313:	
;dl.c: 59: if (index == 4) {
	movf	(_index),w
	xorlw	04h
	skipz
	goto	u3241
	goto	u3240
u3241:
	goto	l2301
u3240:
	line	60
	
l2315:	
;dl.c: 60: entered_passcode[4] = '\0';
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(_entered_passcode)+04h
	line	63
	
l2317:	
;dl.c: 63: if (strcmp(entered_passcode, correct_passcode) == 0) {
	movlw	(_correct_passcode)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_strcmp)
	movlw	(_entered_passcode)&0ffh
	fcall	_strcmp
	movf	((1+(?_strcmp))),w
	iorwf	((0+(?_strcmp))),w
	skipz
	goto	u3251
	goto	u3250
u3251:
	goto	l2325
u3250:
	line	64
	
l2319:	
;dl.c: 64: LCD_Clear();
	fcall	_LCD_Clear
	line	65
	
l2321:	
;dl.c: 65: LCD_String("Unlocked");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_LCD_String
	line	66
	
l2323:	
;dl.c: 66: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	67
;dl.c: 67: } else {
	goto	l2331
	
l718:	
	line	68
	
l2325:	
;dl.c: 68: LCD_Clear();
	fcall	_LCD_Clear
	line	69
	
l2327:	
;dl.c: 69: LCD_String("Error");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_LCD_String
	line	70
	
l2329:	
;dl.c: 70: RC0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	goto	l2331
	line	71
	
l719:	
	line	72
	
l2331:	
;dl.c: 71: }
;dl.c: 72: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u3277:
	decfsz	((??_main+0)+0),f
	goto	u3277
	decfsz	((??_main+0)+0+1),f
	goto	u3277
	decfsz	((??_main+0)+0+2),f
	goto	u3277
opt asmopt_on

	line	73
	
l2333:	
;dl.c: 73: LCD_Clear();
	fcall	_LCD_Clear
	line	74
	
l2335:	
;dl.c: 74: LCD_String("Enter Passcode:");
	movlw	((STR_4-__stringbase))&0ffh
	fcall	_LCD_String
	line	75
	
l2337:	
;dl.c: 75: index = 0;
	clrf	(_index)
	goto	l2301
	line	76
	
l717:	
	goto	l2301
	line	77
	
l716:	
	goto	l2301
	line	78
	
l720:	
	line	48
	goto	l2301
	
l721:	
	line	79
	
l722:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_LCD_String
psect	text211,local,class=CODE,delta=2
global __ptext211
__ptext211:

;; *************** function _LCD_String *****************
;; Defined at:
;;		line 125 in file "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR const unsigned char 
;;		 -> STR_4(16), STR_3(6), STR_2(9), STR_1(16), 
;; Auto vars:     Size  Location     Type
;;  str             1    5[COMMON] PTR const unsigned char 
;;		 -> STR_4(16), STR_3(6), STR_2(9), STR_1(16), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LCD_Char
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text211
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	125
	global	__size_of_LCD_String
	__size_of_LCD_String	equ	__end_of_LCD_String-_LCD_String
	
_LCD_String:	
	opt	stack 6
; Regs used in _LCD_String: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LCD_String@str stored from wreg
	movwf	(LCD_String@str)
	line	126
	
l2279:	
;dl.c: 126: while(*str) {
	goto	l2285
	
l735:	
	line	127
	
l2281:	
;dl.c: 127: LCD_Char(*str++);
	movf	(LCD_String@str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_LCD_Char
	
l2283:	
	movlw	(01h)
	movwf	(??_LCD_String+0)+0
	movf	(??_LCD_String+0)+0,w
	addwf	(LCD_String@str),f
	goto	l2285
	line	128
	
l734:	
	line	126
	
l2285:	
	movf	(LCD_String@str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u3221
	goto	u3220
u3221:
	goto	l2281
u3220:
	goto	l737
	
l736:	
	line	129
	
l737:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_String
	__end_of_LCD_String:
;; =============== function _LCD_String ends ============

	signat	_LCD_String,4216
	global	_LCD_Clear
psect	text212,local,class=CODE,delta=2
global __ptext212
__ptext212:

;; *************** function _LCD_Clear *****************
;; Defined at:
;;		line 131 in file "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LCD_Command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text212
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	131
	global	__size_of_LCD_Clear
	__size_of_LCD_Clear	equ	__end_of_LCD_Clear-_LCD_Clear
	
_LCD_Clear:	
	opt	stack 6
; Regs used in _LCD_Clear: [wreg+status,2+status,0+pclath+cstack]
	line	132
	
l2275:	
;dl.c: 132: LCD_Command(0x01);
	movlw	(01h)
	fcall	_LCD_Command
	line	133
	
l2277:	
;dl.c: 133: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_LCD_Clear+0)+0+1),f
	movlw	251
movwf	((??_LCD_Clear+0)+0),f
u3287:
	decfsz	((??_LCD_Clear+0)+0),f
	goto	u3287
	decfsz	((??_LCD_Clear+0)+0+1),f
	goto	u3287
	nop2
opt asmopt_on

	line	134
	
l740:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_Clear
	__end_of_LCD_Clear:
;; =============== function _LCD_Clear ends ============

	signat	_LCD_Clear,88
	global	_LCD_Init
psect	text213,local,class=CODE,delta=2
global __ptext213
__ptext213:

;; *************** function _LCD_Init *****************
;; Defined at:
;;		line 82 in file "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_LCD_Command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text213
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	82
	global	__size_of_LCD_Init
	__size_of_LCD_Init	equ	__end_of_LCD_Init-_LCD_Init
	
_LCD_Init:	
	opt	stack 6
; Regs used in _LCD_Init: [wreg+status,2+status,0+pclath+cstack]
	line	83
	
l2271:	
;dl.c: 83: LCD_Command(0x38);
	movlw	(038h)
	fcall	_LCD_Command
	line	84
;dl.c: 84: LCD_Command(0x0C);
	movlw	(0Ch)
	fcall	_LCD_Command
	line	85
;dl.c: 85: LCD_Command(0x06);
	movlw	(06h)
	fcall	_LCD_Command
	line	86
;dl.c: 86: LCD_Command(0x80);
	movlw	(080h)
	fcall	_LCD_Command
	line	87
	
l2273:	
;dl.c: 87: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_LCD_Init+0)+0+2),f
movlw	14
movwf	((??_LCD_Init+0)+0+1),f
	movlw	176
movwf	((??_LCD_Init+0)+0),f
u3297:
	decfsz	((??_LCD_Init+0)+0),f
	goto	u3297
	decfsz	((??_LCD_Init+0)+0+1),f
	goto	u3297
	decfsz	((??_LCD_Init+0)+0+2),f
	goto	u3297
opt asmopt_on

	line	88
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_Init
	__end_of_LCD_Init:
;; =============== function _LCD_Init ends ============

	signat	_LCD_Init,88
	global	_LCD_Char
psect	text214,local,class=CODE,delta=2
global __ptext214
__ptext214:

;; *************** function _LCD_Char *****************
;; Defined at:
;;		line 108 in file "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_LCD_String
;; This function uses a non-reentrant model
;;
psect	text214
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	108
	global	__size_of_LCD_Char
	__size_of_LCD_Char	equ	__end_of_LCD_Char-_LCD_Char
	
_LCD_Char:	
	opt	stack 7
; Regs used in _LCD_Char: [wreg+status,2+status,0]
;LCD_Char@data stored from wreg
	movwf	(LCD_Char@data)
	line	109
	
l2251:	
;dl.c: 109: RC2=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	110
	
l2253:	
;dl.c: 110: PORTD&=0x0F;
	movlw	(0Fh)
	movwf	(??_LCD_Char+0)+0
	movf	(??_LCD_Char+0)+0,w
	andwf	(8),f	;volatile
	line	111
;dl.c: 111: PORTD|=(data&0xf0);
	movf	(LCD_Char@data),w
	andlw	0F0h
	movwf	(??_LCD_Char+0)+0
	movf	(??_LCD_Char+0)+0,w
	iorwf	(8),f	;volatile
	line	112
	
l2255:	
;dl.c: 112: RC3=1;
	bsf	(59/8),(59)&7
	line	113
	
l2257:	
;dl.c: 113: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_LCD_Char+0)+0+2),f
movlw	136
movwf	((??_LCD_Char+0)+0+1),f
	movlw	86
movwf	((??_LCD_Char+0)+0),f
u3307:
	decfsz	((??_LCD_Char+0)+0),f
	goto	u3307
	decfsz	((??_LCD_Char+0)+0+1),f
	goto	u3307
	decfsz	((??_LCD_Char+0)+0+2),f
	goto	u3307
opt asmopt_on

	line	114
	
l2259:	
;dl.c: 114: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	115
	
l2261:	
;dl.c: 115: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_LCD_Char+0)+0+2),f
movlw	136
movwf	((??_LCD_Char+0)+0+1),f
	movlw	86
movwf	((??_LCD_Char+0)+0),f
u3317:
	decfsz	((??_LCD_Char+0)+0),f
	goto	u3317
	decfsz	((??_LCD_Char+0)+0+1),f
	goto	u3317
	decfsz	((??_LCD_Char+0)+0+2),f
	goto	u3317
opt asmopt_on

	line	116
;dl.c: 116: PORTD&=0x0f;
	movlw	(0Fh)
	movwf	(??_LCD_Char+0)+0
	movf	(??_LCD_Char+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(8),f	;volatile
	line	117
;dl.c: 117: PORTD|=(data<<4&0xf0);
	movf	(LCD_Char@data),w
	movwf	(??_LCD_Char+0)+0
	movlw	(04h)-1
u3215:
	clrc
	rlf	(??_LCD_Char+0)+0,f
	addlw	-1
	skipz
	goto	u3215
	clrc
	rlf	(??_LCD_Char+0)+0,w
	andlw	0F0h
	movwf	(??_LCD_Char+1)+0
	movf	(??_LCD_Char+1)+0,w
	iorwf	(8),f	;volatile
	line	118
	
l2263:	
;dl.c: 118: RC3=1;
	bsf	(59/8),(59)&7
	line	119
	
l2265:	
;dl.c: 119: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_LCD_Char+0)+0+2),f
movlw	136
movwf	((??_LCD_Char+0)+0+1),f
	movlw	86
movwf	((??_LCD_Char+0)+0),f
u3327:
	decfsz	((??_LCD_Char+0)+0),f
	goto	u3327
	decfsz	((??_LCD_Char+0)+0+1),f
	goto	u3327
	decfsz	((??_LCD_Char+0)+0+2),f
	goto	u3327
opt asmopt_on

	line	120
	
l2267:	
;dl.c: 120: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	121
	
l2269:	
;dl.c: 121: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_LCD_Char+0)+0+2),f
movlw	136
movwf	((??_LCD_Char+0)+0+1),f
	movlw	86
movwf	((??_LCD_Char+0)+0),f
u3337:
	decfsz	((??_LCD_Char+0)+0),f
	goto	u3337
	decfsz	((??_LCD_Char+0)+0+1),f
	goto	u3337
	decfsz	((??_LCD_Char+0)+0+2),f
	goto	u3337
opt asmopt_on

	line	122
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_Char
	__end_of_LCD_Char:
;; =============== function _LCD_Char ends ============

	signat	_LCD_Char,4216
	global	_LCD_Command
psect	text215,local,class=CODE,delta=2
global __ptext215
__ptext215:

;; *************** function _LCD_Command *****************
;; Defined at:
;;		line 91 in file "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_LCD_Init
;;		_LCD_Clear
;; This function uses a non-reentrant model
;;
psect	text215
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	91
	global	__size_of_LCD_Command
	__size_of_LCD_Command	equ	__end_of_LCD_Command-_LCD_Command
	
_LCD_Command:	
	opt	stack 7
; Regs used in _LCD_Command: [wreg+status,2+status,0]
;LCD_Command@cmd stored from wreg
	movwf	(LCD_Command@cmd)
	line	92
	
l2231:	
;dl.c: 92: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	93
	
l2233:	
;dl.c: 93: PORTD&=0x0F;
	movlw	(0Fh)
	movwf	(??_LCD_Command+0)+0
	movf	(??_LCD_Command+0)+0,w
	andwf	(8),f	;volatile
	line	94
;dl.c: 94: PORTD|=(cmd&0xf0);
	movf	(LCD_Command@cmd),w
	andlw	0F0h
	movwf	(??_LCD_Command+0)+0
	movf	(??_LCD_Command+0)+0,w
	iorwf	(8),f	;volatile
	line	95
	
l2235:	
;dl.c: 95: RC3=1;
	bsf	(59/8),(59)&7
	line	96
	
l2237:	
;dl.c: 96: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_LCD_Command+0)+0+2),f
movlw	136
movwf	((??_LCD_Command+0)+0+1),f
	movlw	86
movwf	((??_LCD_Command+0)+0),f
u3347:
	decfsz	((??_LCD_Command+0)+0),f
	goto	u3347
	decfsz	((??_LCD_Command+0)+0+1),f
	goto	u3347
	decfsz	((??_LCD_Command+0)+0+2),f
	goto	u3347
opt asmopt_on

	line	97
	
l2239:	
;dl.c: 97: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	98
	
l2241:	
;dl.c: 98: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_LCD_Command+0)+0+2),f
movlw	136
movwf	((??_LCD_Command+0)+0+1),f
	movlw	86
movwf	((??_LCD_Command+0)+0),f
u3357:
	decfsz	((??_LCD_Command+0)+0),f
	goto	u3357
	decfsz	((??_LCD_Command+0)+0+1),f
	goto	u3357
	decfsz	((??_LCD_Command+0)+0+2),f
	goto	u3357
opt asmopt_on

	line	99
;dl.c: 99: PORTD&=0x0f;
	movlw	(0Fh)
	movwf	(??_LCD_Command+0)+0
	movf	(??_LCD_Command+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(8),f	;volatile
	line	100
;dl.c: 100: PORTD|=(cmd<<4&0xf0);
	movf	(LCD_Command@cmd),w
	movwf	(??_LCD_Command+0)+0
	movlw	(04h)-1
u3205:
	clrc
	rlf	(??_LCD_Command+0)+0,f
	addlw	-1
	skipz
	goto	u3205
	clrc
	rlf	(??_LCD_Command+0)+0,w
	andlw	0F0h
	movwf	(??_LCD_Command+1)+0
	movf	(??_LCD_Command+1)+0,w
	iorwf	(8),f	;volatile
	line	101
	
l2243:	
;dl.c: 101: RC3=1;
	bsf	(59/8),(59)&7
	line	102
	
l2245:	
;dl.c: 102: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_LCD_Command+0)+0+2),f
movlw	136
movwf	((??_LCD_Command+0)+0+1),f
	movlw	86
movwf	((??_LCD_Command+0)+0),f
u3367:
	decfsz	((??_LCD_Command+0)+0),f
	goto	u3367
	decfsz	((??_LCD_Command+0)+0+1),f
	goto	u3367
	decfsz	((??_LCD_Command+0)+0+2),f
	goto	u3367
opt asmopt_on

	line	103
	
l2247:	
;dl.c: 103: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	104
	
l2249:	
;dl.c: 104: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_LCD_Command+0)+0+2),f
movlw	136
movwf	((??_LCD_Command+0)+0+1),f
	movlw	86
movwf	((??_LCD_Command+0)+0),f
u3377:
	decfsz	((??_LCD_Command+0)+0),f
	goto	u3377
	decfsz	((??_LCD_Command+0)+0+1),f
	goto	u3377
	decfsz	((??_LCD_Command+0)+0+2),f
	goto	u3377
opt asmopt_on

	line	105
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_Command
	__end_of_LCD_Command:
;; =============== function _LCD_Command ends ============

	signat	_LCD_Command,4216
	global	_strcmp
psect	text216,local,class=CODE,delta=2
global __ptext216
__ptext216:

;; *************** function _strcmp *****************
;; Defined at:
;;		line 34 in file "../../common/strcmp.c"
;; Parameters:    Size  Location     Type
;;  s1              1    wreg     PTR const unsigned char 
;;		 -> entered_passcode(5), 
;;  s2              1    0[COMMON] PTR const unsigned char 
;;		 -> correct_passcode(5), 
;; Auto vars:     Size  Location     Type
;;  s1              1    5[COMMON] PTR const unsigned char 
;;		 -> entered_passcode(5), 
;;  r               1    4[COMMON] char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text216
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.81\sources\strcmp.c"
	line	34
	global	__size_of_strcmp
	__size_of_strcmp	equ	__end_of_strcmp-_strcmp
	
_strcmp:	
	opt	stack 7
; Regs used in _strcmp: [wreg-fsr0h+status,2+status,0]
;strcmp@s1 stored from wreg
	movwf	(strcmp@s1)
	line	37
	
l2221:	
	goto	l2223
	
l780:	
	line	38
	goto	l2223
	
l779:	
	line	37
	
l2223:	
	movf	(strcmp@s1),w
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_strcmp+0)+0
	movf	(strcmp@s2),w
	movwf	fsr0
	movlw	01h
	addwf	(strcmp@s2),f
	decf	indf,w
	xorlw	0ffh
	addwf	(??_strcmp+0)+0,w
	movwf	(??_strcmp+1)+0
	movf	(??_strcmp+1)+0,w
	movwf	(strcmp@r)
	movf	((strcmp@r)),f
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l2227
u3180:
	
l2225:	
	movf	(strcmp@s1),w
	movwf	fsr0
	movlw	01h
	addwf	(strcmp@s1),f
	movf	indf,f
	skipz
	goto	u3191
	goto	u3190
u3191:
	goto	l2223
u3190:
	goto	l2227
	
l782:	
	goto	l2227
	
l783:	
	line	39
	
l2227:	
	movf	(strcmp@r),w
	movwf	(?_strcmp)
	clrf	(?_strcmp+1)
	btfsc	(?_strcmp),7
	decf	(?_strcmp+1),f
	goto	l784
	
l2229:	
	line	40
	
l784:	
	return
	opt stack 0
GLOBAL	__end_of_strcmp
	__end_of_strcmp:
;; =============== function _strcmp ends ============

	signat	_strcmp,8314
	global	_Keypad_GetKey
psect	text217,local,class=CODE,delta=2
global __ptext217
__ptext217:

;; *************** function _Keypad_GetKey *****************
;; Defined at:
;;		line 142 in file "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text217
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	142
	global	__size_of_Keypad_GetKey
	__size_of_Keypad_GetKey	equ	__end_of_Keypad_GetKey-_Keypad_GetKey
	
_Keypad_GetKey:	
	opt	stack 7
; Regs used in _Keypad_GetKey: [wreg-fsr0h+status,2+status,0]
	line	143
	
l2135:	
;dl.c: 143: PORTB=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	144
;dl.c: 144: while(RB4&&RB5&&RB6&&RB7);
	goto	l746
	
l747:	
	
l746:	
	btfss	(52/8),(52)&7
	goto	u2701
	goto	u2700
u2701:
	goto	l751
u2700:
	
l2137:	
	btfss	(53/8),(53)&7
	goto	u2711
	goto	u2710
u2711:
	goto	l751
u2710:
	
l2139:	
	btfss	(54/8),(54)&7
	goto	u2721
	goto	u2720
u2721:
	goto	l751
u2720:
	
l2141:	
	btfsc	(55/8),(55)&7
	goto	u2731
	goto	u2730
u2731:
	goto	l746
u2730:
	goto	l751
	
l749:	
	goto	l751
	
l750:	
	line	145
;dl.c: 145: while(!RB4||!RB5||!RB6||!RB7) {
	goto	l751
	
l752:	
	line	146
;dl.c: 146: RB0=0;
	bcf	(48/8),(48)&7
	line	147
;dl.c: 147: RB1=RB2=RB3=1;
	bsf	(51/8),(51)&7
	btfsc	(51/8),(51)&7
	goto	u2741
	goto	u2740
	
u2741:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7
	goto	u2754
u2740:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
u2754:
	btfsc	(50/8),(50)&7
	goto	u2751
	goto	u2750
	
u2751:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	goto	u2764
u2750:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
u2764:
	line	148
;dl.c: 148: if(!RB4||!RB5||!RB6||!RB7) {
	btfss	(52/8),(52)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l755
u2770:
	
l2143:	
	btfss	(53/8),(53)&7
	goto	u2781
	goto	u2780
u2781:
	goto	l755
u2780:
	
l2145:	
	btfss	(54/8),(54)&7
	goto	u2791
	goto	u2790
u2791:
	goto	l755
u2790:
	
l2147:	
	btfsc	(55/8),(55)&7
	goto	u2801
	goto	u2800
u2801:
	goto	l753
u2800:
	
l755:	
	line	149
;dl.c: 149: rowloc=0;
	clrf	(_rowloc)
	line	150
;dl.c: 150: break;
	goto	l756
	line	151
	
l753:	
	line	152
;dl.c: 151: }
;dl.c: 152: RB1=0;RB0=1;
	bcf	(49/8),(49)&7
	bsf	(48/8),(48)&7
	line	153
;dl.c: 153: if(!RB4||!RB5||!RB6||!RB7) {
	btfss	(52/8),(52)&7
	goto	u2811
	goto	u2810
u2811:
	goto	l2155
u2810:
	
l2149:	
	btfss	(53/8),(53)&7
	goto	u2821
	goto	u2820
u2821:
	goto	l2155
u2820:
	
l2151:	
	btfss	(54/8),(54)&7
	goto	u2831
	goto	u2830
u2831:
	goto	l2155
u2830:
	
l2153:	
	btfsc	(55/8),(55)&7
	goto	u2841
	goto	u2840
u2841:
	goto	l757
u2840:
	goto	l2155
	
l759:	
	line	154
	
l2155:	
;dl.c: 154: rowloc=1;
	clrf	(_rowloc)
	bsf	status,0
	rlf	(_rowloc),f
	line	155
;dl.c: 155: break;
	goto	l756
	line	156
	
l757:	
	line	157
;dl.c: 156: }
;dl.c: 157: RB2=0;RB1=1;
	bcf	(50/8),(50)&7
	bsf	(49/8),(49)&7
	line	158
;dl.c: 158: if(!RB4||!RB5||!RB6||!RB7) {
	btfss	(52/8),(52)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l2163
u2850:
	
l2157:	
	btfss	(53/8),(53)&7
	goto	u2861
	goto	u2860
u2861:
	goto	l2163
u2860:
	
l2159:	
	btfss	(54/8),(54)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l2163
u2870:
	
l2161:	
	btfsc	(55/8),(55)&7
	goto	u2881
	goto	u2880
u2881:
	goto	l760
u2880:
	goto	l2163
	
l762:	
	line	159
	
l2163:	
;dl.c: 159: rowloc=2;
	movlw	(02h)
	movwf	(??_Keypad_GetKey+0)+0
	movf	(??_Keypad_GetKey+0)+0,w
	movwf	(_rowloc)
	line	160
;dl.c: 160: break;
	goto	l756
	line	161
	
l760:	
	line	162
;dl.c: 161: }
;dl.c: 162: RB3=0; RB2=1;
	bcf	(51/8),(51)&7
	bsf	(50/8),(50)&7
	line	163
;dl.c: 163: if(!RB4||!RB5||!RB6||!RB7){
	btfss	(52/8),(52)&7
	goto	u2891
	goto	u2890
u2891:
	goto	l2171
u2890:
	
l2165:	
	btfss	(53/8),(53)&7
	goto	u2901
	goto	u2900
u2901:
	goto	l2171
u2900:
	
l2167:	
	btfss	(54/8),(54)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l2171
u2910:
	
l2169:	
	btfsc	(55/8),(55)&7
	goto	u2921
	goto	u2920
u2921:
	goto	l751
u2920:
	goto	l2171
	
l765:	
	line	164
	
l2171:	
;dl.c: 164: rowloc=3;
	movlw	(03h)
	movwf	(??_Keypad_GetKey+0)+0
	movf	(??_Keypad_GetKey+0)+0,w
	movwf	(_rowloc)
	line	165
;dl.c: 165: break;
	goto	l756
	line	166
	
l763:	
	line	167
	
l751:	
	line	145
	btfss	(52/8),(52)&7
	goto	u2931
	goto	u2930
u2931:
	goto	l752
u2930:
	
l2173:	
	btfss	(53/8),(53)&7
	goto	u2941
	goto	u2940
u2941:
	goto	l752
u2940:
	
l2175:	
	btfss	(54/8),(54)&7
	goto	u2951
	goto	u2950
u2951:
	goto	l752
u2950:
	
l2177:	
	btfss	(55/8),(55)&7
	goto	u2961
	goto	u2960
u2961:
	goto	l752
u2960:
	
l756:	
	line	168
;dl.c: 166: }
;dl.c: 167: }
;dl.c: 168: if(RB4==0&&RB5!=0&&RB6!=0&&RB7!=0)
	btfsc	(52/8),(52)&7
	goto	u2971
	goto	u2970
u2971:
	goto	l766
u2970:
	
l2179:	
	btfss	(53/8),(53)&7
	goto	u2981
	goto	u2980
u2981:
	goto	l766
u2980:
	
l2181:	
	btfss	(54/8),(54)&7
	goto	u2991
	goto	u2990
u2991:
	goto	l766
u2990:
	
l2183:	
	btfss	(55/8),(55)&7
	goto	u3001
	goto	u3000
u3001:
	goto	l766
u3000:
	line	169
	
l2185:	
;dl.c: 169: colloc=0;
	clrf	(_colloc)
	goto	l773
	line	170
	
l766:	
;dl.c: 170: else if(RB4!=0&&RB5==0&&RB6!=0&&RB7!=0)
	btfss	(52/8),(52)&7
	goto	u3011
	goto	u3010
u3011:
	goto	l768
u3010:
	
l2187:	
	btfsc	(53/8),(53)&7
	goto	u3021
	goto	u3020
u3021:
	goto	l768
u3020:
	
l2189:	
	btfss	(54/8),(54)&7
	goto	u3031
	goto	u3030
u3031:
	goto	l768
u3030:
	
l2191:	
	btfss	(55/8),(55)&7
	goto	u3041
	goto	u3040
u3041:
	goto	l768
u3040:
	line	171
	
l2193:	
;dl.c: 171: colloc=1;
	clrf	(_colloc)
	bsf	status,0
	rlf	(_colloc),f
	goto	l773
	line	172
	
l768:	
;dl.c: 172: else if(RB4!=0&&RB5!=0&&RB6==0&&RB7!=0)
	btfss	(52/8),(52)&7
	goto	u3051
	goto	u3050
u3051:
	goto	l770
u3050:
	
l2195:	
	btfss	(53/8),(53)&7
	goto	u3061
	goto	u3060
u3061:
	goto	l770
u3060:
	
l2197:	
	btfsc	(54/8),(54)&7
	goto	u3071
	goto	u3070
u3071:
	goto	l770
u3070:
	
l2199:	
	btfss	(55/8),(55)&7
	goto	u3081
	goto	u3080
u3081:
	goto	l770
u3080:
	line	173
	
l2201:	
;dl.c: 173: colloc=2;
	movlw	(02h)
	movwf	(??_Keypad_GetKey+0)+0
	movf	(??_Keypad_GetKey+0)+0,w
	movwf	(_colloc)
	goto	l773
	line	174
	
l770:	
;dl.c: 174: else if(RB4!=0&&RB5!=0&&RB6!=0&&RB7==0)
	btfss	(52/8),(52)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l773
u3090:
	
l2203:	
	btfss	(53/8),(53)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l773
u3100:
	
l2205:	
	btfss	(54/8),(54)&7
	goto	u3111
	goto	u3110
u3111:
	goto	l773
u3110:
	
l2207:	
	btfsc	(55/8),(55)&7
	goto	u3121
	goto	u3120
u3121:
	goto	l773
u3120:
	line	175
	
l2209:	
;dl.c: 175: colloc=3;
	movlw	(03h)
	movwf	(??_Keypad_GetKey+0)+0
	movf	(??_Keypad_GetKey+0)+0,w
	movwf	(_colloc)
	goto	l773
	
l772:	
	goto	l773
	line	176
	
l771:	
	goto	l773
	
l769:	
	goto	l773
	
l767:	
;dl.c: 176: while(RB4==0||RB5==0||RB6==0||RB7==0);
	goto	l773
	
l774:	
	
l773:	
	btfss	(52/8),(52)&7
	goto	u3131
	goto	u3130
u3131:
	goto	l773
u3130:
	
l2211:	
	btfss	(53/8),(53)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l773
u3140:
	
l2213:	
	btfss	(54/8),(54)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l773
u3150:
	
l2215:	
	btfss	(55/8),(55)&7
	goto	u3161
	goto	u3160
u3161:
	goto	l773
u3160:
	goto	l2217
	
l775:	
	line	177
	
l2217:	
;dl.c: 177: return (keypad[rowloc][colloc]);
	movf	(_rowloc),w
	movwf	(??_Keypad_GetKey+0)+0
	movlw	02h
u3175:
	clrc
	rlf	(??_Keypad_GetKey+0)+0,f
	addlw	-1
	skipz
	goto	u3175
	movlw	(_keypad)&0ffh
	addwf	0+(??_Keypad_GetKey+0)+0,w
	movwf	(??_Keypad_GetKey+1)+0
	movf	(_colloc),w
	addwf	0+(??_Keypad_GetKey+1)+0,w
	movwf	(??_Keypad_GetKey+2)+0
	movf	0+(??_Keypad_GetKey+2)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	goto	l776
	
l2219:	
	line	179
	
l776:	
	return
	opt stack 0
GLOBAL	__end_of_Keypad_GetKey
	__end_of_Keypad_GetKey:
;; =============== function _Keypad_GetKey ends ============

	signat	_Keypad_GetKey,89
	global	_Keypad_Init
psect	text218,local,class=CODE,delta=2
global __ptext218
__ptext218:

;; *************** function _Keypad_Init *****************
;; Defined at:
;;		line 136 in file "C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text218
	file	"C:\Users\HP\OneDrive\Documents\PIC\Digital lock\dl.c"
	line	136
	global	__size_of_Keypad_Init
	__size_of_Keypad_Init	equ	__end_of_Keypad_Init-_Keypad_Init
	
_Keypad_Init:	
	opt	stack 7
; Regs used in _Keypad_Init: [wreg+status,2+status,0]
	line	137
	
l2131:	
;dl.c: 137: TRISB = 0xF0;
	movlw	(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	138
	
l2133:	
;dl.c: 138: OPTION_REG&=0X7F;
	movlw	(07Fh)
	movwf	(??_Keypad_Init+0)+0
	movf	(??_Keypad_Init+0)+0,w
	andwf	(129)^080h,f	;volatile
	line	139
	
l743:	
	return
	opt stack 0
GLOBAL	__end_of_Keypad_Init
	__end_of_Keypad_Init:
;; =============== function _Keypad_Init ends ============

	signat	_Keypad_Init,88
psect	text219,local,class=CODE,delta=2
global __ptext219
__ptext219:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
