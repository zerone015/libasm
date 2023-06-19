#ifndef LIBASM_BONUS_H_
# define LIBASM_BONUS_H_

# include <stdio.h>
# include <stdlib.h>

typedef struct s_list
{
    void            *data;
    struct s_list   *next;
}   t_list;

int     ft_atoi_base(char *str, char *base);
void    ft_list_push_front(t_list **begin_list, void *data);
int     ft_list_size(t_list *begin_list);

#endif