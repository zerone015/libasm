#include "libasm_bonus.h"

int main(void) 
{
    printf("ft_atoi_base = %d \n", ft_atoi_base("    -+-2147483648", "0123456789"));
    printf("ft_atoi_base = %d \n", ft_atoi_base("    2147483647", "0123456789"));
    printf("ft_atoi_base = %d \n", ft_atoi_base("01111111111111111111111111111111", "01"));
    t_list *list = calloc(1, sizeof(t_list));
    ft_list_push_front(&list, "test");
    printf("ft_list_push_front = %s \n", (char *)list->data);
    return 0;
}