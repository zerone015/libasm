#include "libasm_bonus.h"

void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
                       void (*free_fct)(void *)) {
  t_list *del;
  t_list *temp;

  while (*begin_list && cmp((*begin_list)->data, data_ref) == 0) {
    del = *begin_list;
    *begin_list = del->next;
    free_fct(del);
  }
  if (!(*begin_list)) {
    return;
  }
  temp = *begin_list;
  while (temp && temp->next) {
    if (cmp(temp->next->data, data_ref) == 0) {
      del = temp->next;
      temp->next = del->next;
      free_fct(del);
      continue;
    } 
    temp = temp->next;
  }
}
