#include "libasm_bonus.h"

int main(void) 
{
    printf("ft_atoi_base = %d \n", ft_atoi_base("    -+-2147483648", "0123456789"));
    printf("ft_atoi_base = %d \n", ft_atoi_base("    2147483647", "0123456789"));
    printf("ft_atoi_base = %d \n", ft_atoi_base("01111111111111111111111111111111", "01"));
    return 0;
}