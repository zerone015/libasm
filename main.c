#include "libasm.h"

int main(void) {
	char dest[] = "dest";
	printf("ft_strlen = %zu \n", ft_strlen("yoson"));
	printf("ft_strcpy = %s \n", ft_strcpy(dest, "src"));
	printf("ft_strcpy = %s \n", ft_strcpy(dest, "crs"));
	printf("ft_strcmp = %d \n", ft_strcmp("src", "src"));
	printf("ft_strcmp = %d \n", ft_strcmp("srcA", "src"));
	printf("ft_strcmp = %d \n", ft_strcmp("src", "srca"));

	return 0;	
}
