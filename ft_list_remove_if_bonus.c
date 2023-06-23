#include "libasm_bonus.h"

void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
                       void (*free_fct)(void *)) {
  t_list *cur;
  t_list *remove;

  cur = *begin_list;
  while (cur->next) {
    if (cmp(cur->next->data, data_ref) == 0) {
      remove = cur->next;
      cur->next = remove->next;
      free_fct(remove);
      continue;
    }
    cur = cur->next;
  }
  cur = *begin_list;
  if (cmp(cur->data, data_ref) == 0) {
    *begin_list = cur->next;
    free_fct(cur);
  }
}
