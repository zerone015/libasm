#ifndef LIBASM_H_
# define LIBASM_H_

# include <stdio.h>
# include <fcntl.h>

size_t	ft_strlen(const char *str);
char    *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char* s1, const char* s2);
ssize_t ft_write(int fd, const void *buf, size_t nbyte);
ssize_t ft_read(int fd, void *buf, size_t nbyte);

#endif 
