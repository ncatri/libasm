#include <stdio.h>
#include <string.h>

size_t	ft_strlen(const char *s);
int		strlen_test(const char *s);

# define STRLEN(a) (printf("%s\n--> %lu \t (%lu)\n", a, ft_strlen(a), strlen(a)))

int main(void)
{
	printf(" ======= strlen ======\n");
/*	STRLEN("Hello pals, how you doing?");
	STRLEN("");
	STRLEN("1");
	STRLEN("0123456789");
*/

	strlen_test("Hello pals, how you doing?");
	strlen_test("");
	strlen_test("1");
	strlen_test("0123456789");
}

int	strlen_test(const char *s)
{
	printf("-->|%s|\n", s);
	printf("%lu \t (%lu)\n", ft_strlen(s), strlen(s));
	return (1);
}
