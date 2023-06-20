#include "libasm_bonus.h"

void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
                       void (*free_fct)(void *)) {
  t_list *del;

  while (*begin_list && cmp((*begin_list)->data, data_ref) == 0) {
    del = *begin_list;
    *begin_list = del->next;
    free_fct(del);
  }
  if (!(*begin_list)) {
    return;
  }
  while ((*begin_list)->next) {
    if (cmp((*begin_list)->next->data, data_ref) == 0) {
      del = (*begin_list)->next;
      (*begin_list)->next = del->next;
      free_fct(del);
    }
  }
}
