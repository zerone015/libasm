#include <string.h>

#include "libasm_bonus.h"

int main(void) {
  // printf("ft_atoi_base = %d \n",
  //        ft_atoi_base("    -+-2147483648", "0123456789"));
  // printf("ft_atoi_base = %d \n", ft_atoi_base("    2147483647",
  // "0123456789")); printf("ft_atoi_base = %d \n",
  //        ft_atoi_base("01111111111111111111111111111111", "01"));
  t_list *list = calloc(1, sizeof(t_list));
  ft_list_push_front(&list, "test");
  printf("ft_list_push_front = %s \n", (char *)list->data);
  printf("ft_list_size = %d \n", ft_list_size(list));
  for (int i = 0; i < 10; ++i) {
    ft_list_push_front(&list, "remove");
  }
  ft_list_remove_if(&list, "remove", strcmp, free);
  printf("ft_list_remove_if = %d \n", ft_list_size(list));
  return 0;
}