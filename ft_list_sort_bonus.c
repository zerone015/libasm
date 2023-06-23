#include "libasm_bonus.h"

void ft_list_sort(t_list **begin_list, int (*cmp)()) {
    t_list *i;
    t_list *j;
    void *temp;

    i = *begin_list;
    while (i) {
        j = *begin_list;
        while (j->next) {
            if (cmp(j->data, j->next->data) > 0) {
                temp = j->data;
                j->data = j->next->data;
                j->next->data = temp;
            }
            j = j->next;
        }
        i = i->next;
    }
}