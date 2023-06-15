#include "libasm.h"

int main(void) {
	char *str = malloc(BUF_SIZE);
	memset(str, 'a', BUF_SIZE);

	printf("----------ft_strlen----------\n");
	printf("expected: %d \n", BUF_SIZE);
	printf("result: %zu \n", ft_strlen(str));
	printf("expected: 0 \n");
	printf("result: %zu \n", ft_strlen(""));

	printf("----------ft_strcpy----------\n");
	char *temp = malloc(BUF_SIZE);
	printf("expected: %s \n", str);
	printf("result: %s \n", ft_strcpy(temp, str));
	printf("expected: %s \n", "");
	printf("result: %s \n", ft_strcpy(temp, ""));

	printf("----------ft_strcmp----------\n");
	printf("expected: 0 \n");
	printf("result: %d \n", ft_strcmp("", ""));
	printf("expected: positive number \n");
	printf("result: %d \n", ft_strcmp("src", ""));
	printf("expected: negative number \n");
	printf("result: %d \n", ft_strcmp("", "src"));
	printf("expected: 0 \n");
	printf("result: %d \n", ft_strcmp(str, str));
	printf("expected: negative number \n");
	printf("result: %d \n", ft_strcmp(str, "aaaaab"));
	printf("expected: positive number \n");
	printf("result: %d \n", ft_strcmp("aaaaab", str));

	printf("----------ft_write----------\n");
	printf("expected: \n%s \n", str);
	printf("result: \n");
	ssize_t write_size = ft_write(1, str, BUF_SIZE);
	printf("\n");
	printf("expected: %d \n", BUF_SIZE);
	printf("result: %zd \n", write_size);
	printf("expected: -1 \n");
	printf("result: %zd \n", ft_write(-1, str, BUF_SIZE));
	perror("perror");

	printf("----------ft_read----------\n");
	char *buf = calloc(1, BUF_SIZE);
	printf("please input. \n");
	printf("stdin test: %zd \n", ft_read(0, buf, BUF_SIZE));
	int fd = open("ft_read.s", O_RDONLY);
	printf("ft_read.s size: %zd \n", ft_read(fd, buf, BUF_SIZE));
	printf("ft_read.s contents = %s \n", buf);
	printf("expected: -1 \n");
	printf("result = %zd \n", ft_read(-1, buf, BUF_SIZE));
	perror("perror");

	return 0;	
}
