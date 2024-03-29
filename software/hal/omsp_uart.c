#include "omsp_system.h"
#include "omsp_uart.h"

// BAUD = (mclk_freq/baudrate)-1 => 115200  @50Mhz
#define BAUD 433

void uartinit() {
  UART_BAUD = BAUD;          // Init UART
  UART_CTL  = UART_EN | UART_IEN_RX;
}

int putchar (int txdata) {
  while (UART_STAT & UART_TX_FULL);
  UART_TXD = txdata;
  return 0;
}

char rxdata;

wakeup interrupt (UART_RX_VECTOR) INT_uart_rx(void) {
  rxdata = UART_RXD;
  UART_STAT = UART_RX_PND;
}
