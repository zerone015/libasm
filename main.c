#include "libasm.h"

int main(void) {
	char buf[100];

	printf("ft_strlen: %zu\n", ft_strlen("hello"));
	printf("ft_strlen: %zu\n", ft_strlen(""));
	printf("ft_strcpy: %s\n", ft_strcpy(buf, "hello"));
	printf("ft_strcpy: %s\n", ft_strcpy(buf, ""));
	printf("ft_strcmp: %d\n", ft_strcmp("ab", "a"));
	printf("ft_strcmp: %d\n", ft_strcmp("a", "ab"));
	printf("ft_strcmp: %d\n", ft_strcmp("a", "a"));
	printf("ft_write: %zd\n", ft_write(1, "hello\n", 6));
	printf("ft_write: %zd\n", ft_write(-1, "hello", 5));
	perror("perror");
	printf("ft_read: %zd\n", ft_read(0, buf, 50));
	printf("ft_read: %zd\n", ft_read(open("ft_read.s", O_RDONLY), buf, 50));
	printf("ft_read: %zd\n", ft_read(-1, buf, 50));
	perror("perror");
	return 0;	
}
