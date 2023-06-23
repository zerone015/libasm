#include "libasm_bonus.h"

int     ft_list_size(t_list *begin_list) {
    int len = 1;
    while (begin_list->next) {
        begin_list = begin_list->next;
        len++;
    }
    return len;
}
