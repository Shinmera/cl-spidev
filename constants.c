#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/types.h>
#include <linux/spi/spidev.h>

int main(){
  printf("(defconstant %-24s #x%X)\n", "SPI_CPHA", SPI_CPHA);
  printf("(defconstant %-24s #x%X)\n", "SPI_CPOL", SPI_CPOL);
  printf("(defconstant %-24s #x%X)\n", "SPI_MODE_0", SPI_MODE_0);
  printf("(defconstant %-24s #x%X)\n", "SPI_MODE_1", SPI_MODE_1);
  printf("(defconstant %-24s #x%X)\n", "SPI_MODE_2", SPI_MODE_2);
  printf("(defconstant %-24s #x%X)\n", "SPI_MODE_3", SPI_MODE_3);
  printf("(defconstant %-24s #x%X)\n", "SPI_CS_HIGH", SPI_CS_HIGH);
  printf("(defconstant %-24s #x%X)\n", "SPI_LSB_FIRST", SPI_LSB_FIRST);
  printf("(defconstant %-24s #x%X)\n", "SPI_3WIRE", SPI_3WIRE);
  printf("(defconstant %-24s #x%X)\n", "SPI_LOOP", SPI_LOOP);
  printf("(defconstant %-24s #x%X)\n", "SPI_NO_CS", SPI_NO_CS);
  printf("(defconstant %-24s #x%X)\n", "SPI_READY", SPI_READY);
  printf("(defconstant %-24s #x%X)\n", "SPI_TX_DUAL", SPI_TX_DUAL);
  printf("(defconstant %-24s #x%X)\n", "SPI_TX_QUAD", SPI_TX_QUAD);
  printf("(defconstant %-24s #x%X)\n", "SPI_RX_DUAL", SPI_RX_DUAL);
  printf("(defconstant %-24s #x%X)\n", "SPI_RX_QUAD", SPI_RX_QUAD);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_MESSAGE_1", SPI_IOC_MESSAGE(1));
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_RD_MODE", SPI_IOC_RD_MODE);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_WR_MODE", SPI_IOC_WR_MODE);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_RD_LSB_FIRST", SPI_IOC_RD_LSB_FIRST);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_WR_LSB_FIRST", SPI_IOC_WR_LSB_FIRST);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_RD_BITS_PER_WORD", SPI_IOC_RD_BITS_PER_WORD);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_WR_BITS_PER_WORD", SPI_IOC_WR_BITS_PER_WORD);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_RD_MAX_SPEED_HZ", SPI_IOC_RD_MAX_SPEED_HZ);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_WR_MAX_SPEED_HZ", SPI_IOC_WR_MAX_SPEED_HZ);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_RD_MODE32", SPI_IOC_RD_MODE32);
  printf("(defconstant %-24s #x%X)\n", "SPI_IOC_WR_MODE32", SPI_IOC_WR_MODE32);
  return 0;
}
