#ifndef  OMSP_SYSTEM_H
#define OMSP_SYSTEM_H

#include <in430.h>

//=============================================================================
// STATUS REGISTER BITS
//=============================================================================

// Flags
#define C             (0x0001)
#define Z             (0x0002)
#define N             (0x0004)
#define V             (0x0100)
#define GIE           (0x0008)
#define CPUOFF        (0x0010)
#define OSCOFF        (0x0020)
#define SCG0          (0x0040)
#define SCG1          (0x0080)

// Low Power Modes coded with Bits 4-7 in SR
#define LPM0_bits     (CPUOFF)
#define LPM1_bits     (SCG0+CPUOFF)
#define LPM2_bits     (SCG1+CPUOFF)
#define LPM3_bits     (SCG1+SCG0+CPUOFF)
#define LPM4_bits     (SCG1+SCG0+OSCOFF+CPUOFF)

#define LPM0          _BIS_SR(LPM0_bits)       // Enter Low Power Mode 0
#define LPM0_EXIT     _BIC_SR_IRQ(LPM0_bits)   // Exit  Low Power Mode 0
#define LPM1          _BIS_SR(LPM1_bits)       // Enter Low Power Mode 1
#define LPM1_EXIT     _BIC_SR_IRQ(LPM1_bits)   // Exit  Low Power Mode 1
#define LPM2          _BIS_SR(LPM2_bits)       // Enter Low Power Mode 2
#define LPM2_EXIT     _BIC_SR_IRQ(LPM2_bits)   // Exit  Low Power Mode 2
#define LPM3          _BIS_SR(LPM3_bits)       // Enter Low Power Mode 3
#define LPM3_EXIT     _BIC_SR_IRQ(LPM3_bits)   // Exit  Low Power Mode 3
#define LPM4          _BIS_SR(LPM4_bits)       // Enter Low Power Mode 4
#define LPM4_EXIT     _BIC_SR_IRQ(LPM4_bits)   // Exit  Low Power Mode 4

//----------------------------------------------------------
// SPECIAL FUNCTION REGISTERS
//----------------------------------------------------------
#define  IE1         (*(volatile unsigned char *) 0x0000)
#define  IFG1        (*(volatile unsigned char *) 0x0002)

#define  CPU_ID_LO   (*(volatile unsigned char *) 0x0004)
#define  CPU_ID_HI   (*(volatile unsigned char *) 0x0006)

//----------------------------------------------------------
// GPIOs
//----------------------------------------------------------
#define  P1IN        (*(volatile unsigned char *) 0x0020)
#define  P1OUT       (*(volatile unsigned char *) 0x0021)
#define  P1DIR       (*(volatile unsigned char *) 0x0022)
#define  P1IFG       (*(volatile unsigned char *) 0x0023)
#define  P1IES       (*(volatile unsigned char *) 0x0024)
#define  P1IE        (*(volatile unsigned char *) 0x0025)
#define  P1SEL       (*(volatile unsigned char *) 0x0026)

#define  P2IN        (*(volatile unsigned char *) 0x0028)
#define  P2OUT       (*(volatile unsigned char *) 0x0029)
#define  P2DIR       (*(volatile unsigned char *) 0x002A)
#define  P2IFG       (*(volatile unsigned char *) 0x002B)
#define  P2IES       (*(volatile unsigned char *) 0x002C)
#define  P2IE        (*(volatile unsigned char *) 0x002D)
#define  P2SEL       (*(volatile unsigned char *) 0x002E)

#define  P3IN        (*(volatile unsigned char *) 0x0018)
#define  P3OUT       (*(volatile unsigned char *) 0x0019)
#define  P3DIR       (*(volatile unsigned char *) 0x001A)
#define  P3SEL       (*(volatile unsigned char *) 0x001B)

#define  P4IN        (*(volatile unsigned char *) 0x001C)
#define  P4OUT       (*(volatile unsigned char *) 0x001D)
#define  P4DIR       (*(volatile unsigned char *) 0x001E)
#define  P4SEL       (*(volatile unsigned char *) 0x001F)

#define  P5IN        (*(volatile unsigned char *) 0x0030)
#define  P5OUT       (*(volatile unsigned char *) 0x0031)
#define  P5DIR       (*(volatile unsigned char *) 0x0032)
#define  P5SEL       (*(volatile unsigned char *) 0x0033)

#define  P6IN        (*(volatile unsigned char *) 0x0034)
#define  P6OUT       (*(volatile unsigned char *) 0x0035)
#define  P6DIR       (*(volatile unsigned char *) 0x0036)
#define  P6SEL       (*(volatile unsigned char *) 0x0037)

//----------------------------------------------------------
// BASIC CLOCK MODULE
//----------------------------------------------------------
#define  BCSCTL1     (*(volatile unsigned char *) 0x0057)
#define  BCSCTL2     (*(volatile unsigned char *) 0x0058)

//----------------------------------------------------------
// WATCHDOG TIMER
//----------------------------------------------------------

// Addresses
#define  WDTCTL      (*(volatile unsigned int  *) 0x0120)

// Bit masks
#define  WDTIS0      (0x0001)
#define  WDTIS1      (0x0002)
#define  WDTSSEL     (0x0004)
#define  WDTCNTCL    (0x0008)
#define  WDTTMSEL    (0x0010)
#define  WDTNMI      (0x0020)
#define  WDTNMIES    (0x0040)
#define  WDTHOLD     (0x0080)
#define  WDTPW       (0x5A00)

//----------------------------------------------------------
// HARDWARE MULTIPLIER
//----------------------------------------------------------
#define  OP1_MPY     (*(volatile unsigned int  *) 0x0130)
#define  OP1_MPYS    (*(volatile unsigned int  *) 0x0132)
#define  OP1_MAC     (*(volatile unsigned int  *) 0x0134)
#define  OP1_MACS    (*(volatile unsigned int  *) 0x0136)
#define  OP2         (*(volatile unsigned int  *) 0x0138)

#define  RESLO       (*(volatile unsigned int  *) 0x013A)
#define  RESHI       (*(volatile unsigned int  *) 0x013C)
#define  SUMEXT      (*(volatile unsigned int  *) 0x013E)

//----------------------------------------------------------
// UART
//----------------------------------------------------------
// UART Control register fields

#define  UART_IEN_TX_EMPTY  0x80
#define  UART_IEN_TX        0x40
#define  UART_IEN_RX_OVFLW  0x20
#define  UART_IEN_RX        0x10
#define  UART_SMCLK_SEL     0x02
#define  UART_EN            0x01

// UART Status register fields
#define  UART_TX_EMPTY_PND  0x80
#define  UART_TX_PND        0x40
#define  UART_RX_OVFLW_PND  0x20
#define  UART_RX_PND        0x10
#define  UART_TX_FULL       0x08
#define  UART_TX_BUSY       0x04
#define  UART_RX_BUSY       0x01

#define UART_CTL       (*(volatile unsigned char *) 0x0080)  // UART Control register (8bit)
#define UART_STAT      (*(volatile unsigned char *) 0x0081)  // UART Status register (8bit)
#define UART_BAUD      (*(volatile unsigned int  *) 0x0082)  // UART Baud rate configuration (16bit)
#define UART_TXD       (*(volatile unsigned char *) 0x0084)  // UART Transmit data register (8bit)
#define UART_RXD       (*(volatile unsigned char *) 0x0085)  // UART Receive data register (8bit)

//=============================================================================
// INTERRUPT VECTORS
//=============================================================================
#define interrupt(x) void __attribute__((interrupt (x)))
#define eint()  __eint()
#define dint()  __dint()
#define wakeup  __attribute__((wakeup))

#define RESET_VECTOR        (0x001E)   // Vector 15  (0xFFFE) - Reset              -  [Highest Priority]
#define NMI_VECTOR          (0x001C)   // Vector 14  (0xFFFC) - Non-maskable       -
#define UNUSED_13_VECTOR    (0x001A)   // Vector 13  (0xFFFA) -                    -
#define UNUSED_12_VECTOR    (0x0018)   // Vector 12  (0xFFF8) -                    -
#define UNUSED_11_VECTOR    (0x0016)   // Vector 11  (0xFFF6) -                    -
#define WDT_VECTOR          (0x0014)   // Vector 10  (0xFFF4) - Watchdog Timer     -
#define TIMERA0_VECTOR      (0x0012)   // Vector  9  (0xFFF2) - Timer A CC0        -
#define TIMERA1_VECTOR      (0x0010)   // Vector  8  (0xFFF0) - Timer A CC1-2, TA  -
#define UART_RX_VECTOR      (0x000E)   // Vector  7  (0xFFEE) - User UART RX       -
#define UART_TX_VECTOR      (0x000C)   // Vector  6  (0xFFEC) - User UART TX       -
#define UNUSED_05_VECTOR    (0x000A)   // Vector  5  (0xFFEA) -                    -
#define UNUSED_04_VECTOR    (0x0008)   // Vector  4  (0xFFE8) -                    -
#define PORT2_VECTOR        (0x0006)   // Vector  3  (0xFFE6) - Port 1             -
#define PORT1_VECTOR        (0x0004)   // Vector  2  (0xFFE4) - Port 1             -
#define UNUSED_01_VECTOR    (0x0002)   // Vector  1  (0xFFE2) -                    -
#define UNUSED_00_VECTOR    (0x0000)   // Vector  0  (0xFFE0) -                    -  [Lowest Priority]

#endif
