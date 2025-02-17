#include<pic.h>

#include <string.h>
__CONFIG( FOSC_HS & WDTE_OFF & PWRTE_OFF & CP_OFF & BOREN_ON & LVP_OFF & CPD_OFF & WRT_OFF & DEBUG_OFF);       

#define _XTAL_FREQ 20000000    

#define R1 RB0
#define R2 RB1
#define R3 RB2
#define R4 RB3
#define C1 RB4
#define C2 RB5
#define C3 RB6
#define C4 RB7
#define rs RC2
#define en RC3    

#define LED RC0       

char correct_passcode[] = "1234";
char entered_passcode[5];      
unsigned char index = 0;


void LCD_Init();
void LCD_Command(unsigned char cmd);
void LCD_Char(unsigned char data);
void LCD_String(const char *str);
void LCD_Clear();
void Keypad_Init();
unsigned char Keypad_GetKey();
unsigned char keypad[4][4]={{'7','8','9','/'},{'4','5','6','*'},{'1','2','3','-'},{'C','0','=','+'}};
unsigned char rowloc,colloc;

void main() {
    
    LCD_Init();
    Keypad_Init();
    TRISB0 = 0;       
    TRISD = 0x00;
    LED = 0;                    
    
    LCD_Clear();
    LCD_String("Enter Passcode:");
    __delay_ms(200);
    
    while(1) {
		LCD_Command(0xC7);
        char key = Keypad_GetKey();
        
        if(key != 0) {
            
            LCD_Char('*');
            entered_passcode[index] = key;
            index++;
            
            
            if (index == 4) {
                entered_passcode[4] = '\0'; 
                
                
                if (strcmp(entered_passcode, correct_passcode) == 0) {
                    LCD_Clear();
                    LCD_String("Unlocked");
                    LED = 1;       
                } else {
                    LCD_Clear();
                    LCD_String("Error");
                    LED = 0;       
                }
                __delay_ms(200);
                LCD_Clear();
                LCD_String("Enter Passcode:");
                index = 0; 
            }
        }
    }
}


void LCD_Init() {               
    LCD_Command(0x38);           
    LCD_Command(0x0C);          
	LCD_Command(0x06);           
    LCD_Command(0x80);          
    __delay_ms(200);
}


void LCD_Command(unsigned char cmd) {
   	rs=0; 
    PORTD&=0x0F;
    PORTD|=(cmd&0xf0);
    en=1;
    __delay_ms(100);
    en=0;
    __delay_ms(100);
    PORTD&=0x0f;
    PORTD|=(cmd<<4&0xf0);
    en=1;
    __delay_ms(100);
    en=0;
    __delay_ms(100);
}


void LCD_Char(unsigned char data) {
    rs=1; 
    PORTD&=0x0F;
    PORTD|=(data&0xf0);
    en=1;
    __delay_ms(100);
    en=0;
    __delay_ms(100);
    PORTD&=0x0f;
    PORTD|=(data<<4&0xf0);
    en=1;
    __delay_ms(100);
    en=0;
    __delay_ms(100);
}


void LCD_String(const char *str) {
    while(*str) {
        LCD_Char(*str++);
    }
}

void LCD_Clear() {
    LCD_Command(0x01);           
    __delay_ms(2);
}

void Keypad_Init() {
    TRISB = 0xF0; 
	OPTION_REG&=0X7F;                
}

unsigned char Keypad_GetKey()
	{
    PORTB=0x00;
    while(C1&&C2&&C3&&C4);
    while(!C1||!C2||!C3||!C4) {
        R1=0;
        R2=R3=R4=1;
        if(!C1||!C2||!C3||!C4) {
            rowloc=0;
            break;
        }
        R2=0;R1=1;
        if(!C1||!C2||!C3||!C4) {
            rowloc=1;
            break;
        }
        R3=0;R2=1;
        if(!C1||!C2||!C3||!C4) {
            rowloc=2;
            break;
        }
        R4=0; R3=1;
        if(!C1||!C2||!C3||!C4){
            rowloc=3;
            break;
        }
    }
    if(C1==0&&C2!=0&&C3!=0&&C4!=0)
            colloc=0;
    else if(C1!=0&&C2==0&&C3!=0&&C4!=0)
            colloc=1;
    else if(C1!=0&&C2!=0&&C3==0&&C4!=0)
            colloc=2;
    else if(C1!=0&&C2!=0&&C3!=0&&C4==0)
            colloc=3;
    while(C1==0||C2==0||C3==0||C4==0);
    return (keypad[rowloc][colloc]);

}
