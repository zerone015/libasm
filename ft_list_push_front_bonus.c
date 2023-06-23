#include "libasm_bonus.h"

void ft_list_push_front(t_list **begin_list, void *data) {
    t_list *new = malloc(sizeof(t_list));
    if (!new) {
        return;
    }
    new->data = data;
    new->next = *begin_list;
    *begin_list = new;
}