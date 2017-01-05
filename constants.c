#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/types.h>
#include <linux/spi/spidev.h>

int main(){
  printf("%-24s x%X\n", "SPI_CPHA", SPI_CPHA);
  printf("%-24s x%X\n", "SPI_CPOL", SPI_CPOL);
  printf("%-24s x%X\n", "SPI_MODE_0", SPI_MODE_0);
  printf("%-24s x%X\n", "SPI_MODE_1", SPI_MODE_1);
  printf("%-24s x%X\n", "SPI_MODE_2", SPI_MODE_2);
  printf("%-24s x%X\n", "SPI_MODE_3", SPI_MODE_3);
  printf("%-24s x%X\n", "SPI_CS_HIGH", SPI_CS_HIGH);
  printf("%-24s x%X\n", "SPI_LSB_FIRST", SPI_LSB_FIRST);
  printf("%-24s x%X\n", "SPI_3WIRE", SPI_3WIRE);
  printf("%-24s x%X\n", "SPI_LOOP", SPI_LOOP);
  printf("%-24s x%X\n", "SPI_NO_CS", SPI_NO_CS);
  printf("%-24s x%X\n", "SPI_READY", SPI_READY);
  printf("%-24s x%X\n", "SPI_TX_DUAL", SPI_TX_DUAL);
  printf("%-24s x%X\n", "SPI_TX_QUAD", SPI_TX_QUAD);
  printf("%-24s x%X\n", "SPI_RX_DUAL", SPI_RX_DUAL);
  printf("%-24s x%X\n", "SPI_RX_QUAD", SPI_RX_QUAD);
  printf("%-24s x%X\n", "SPI_IOC_RD_MODE", SPI_IOC_RD_MODE);
  printf("%-24s x%X\n", "SPI_IOC_WR_MODE", SPI_IOC_WR_MODE);
  printf("%-24s x%X\n", "SPI_IOC_RD_LSB_FIRST", SPI_IOC_RD_LSB_FIRST);
  printf("%-24s x%X\n", "SPI_IOC_WR_LSB_FIRST", SPI_IOC_WR_LSB_FIRST);
  printf("%-24s x%X\n", "SPI_IOC_RD_BITS_PER_WORD", SPI_IOC_RD_BITS_PER_WORD);
  printf("%-24s x%X\n", "SPI_IOC_WR_BITS_PER_WORD", SPI_IOC_WR_BITS_PER_WORD);
  printf("%-24s x%X\n", "SPI_IOC_RD_MAX_SPEED_HZ", SPI_IOC_RD_MAX_SPEED_HZ);
  printf("%-24s x%X\n", "SPI_IOC_WR_MAX_SPEED_HZ", SPI_IOC_WR_MAX_SPEED_HZ);
  printf("%-24s x%X\n", "SPI_IOC_RD_MODE32", SPI_IOC_RD_MODE32);
  printf("%-24s x%X\n", "SPI_IOC_WR_MODE32", SPI_IOC_WR_MODE32);
  return 0;
}
