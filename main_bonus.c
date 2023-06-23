#include "libasm_bonus.h"

int main(void) {
  printf("ft_atoi_base = %d \n", ft_atoi_base("    -+-2147483648", "0123456789"));
  printf("ft_atoi_base = %d \n", ft_atoi_base("    2147483647", "0123456789")); 
  printf("ft_atoi_base = %d \n", ft_atoi_base("01111111111111111111111111111111", "01"));
  t_list *list = malloc(sizeof(t_list));
  list->data = "test";
  list->next = NULL;
  ft_list_push_front(&list, "test");
  printf("ft_list_push_front = %s \n", (char *)list->data);
  printf("ft_list_size = %d \n", ft_list_size(list));
  for (int i = 0; i < 10; ++i) {
    ft_list_push_front(&list, "remove");
  }
  printf("ft_list_size = %d \n", ft_list_size(list));
  ft_list_remove_if(&list, "remove", strcmp, free);
  printf("ft_list_remove_if = %d \n", ft_list_size(list));
  t_list *list2 = malloc(sizeof(t_list));
  list2->data = "e";
  list2->next = NULL;
  ft_list_push_front(&list2, "c");
  ft_list_push_front(&list2, "a");
  ft_list_push_front(&list2, "b");
  ft_list_push_front(&list2, "f");
  ft_list_sort(&list2, strcmp);
  t_list *temp = list2;
  while (temp) {
    printf("%s \n", temp->data);
    temp = temp->next;
  }
  return 0;
}