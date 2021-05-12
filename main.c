#include <stdio.h>
#include <string.h>

# define BIG_NUM (21473)

size_t	ft_strlen(const char *s);
int		strlen_test(const char *s);
int		ft_strcmp(const char *s1, const char *s2);


int main(void)
{
	printf(" ======= strlen ======\n");
	char big_str[BIG_NUM];
	int i = 0;
	while (i < BIG_NUM - 1)
	{
		big_str[i] = 'A' + (i % 60);
		i++;
	}
	big_str[i] = '\0';


	strlen_test("Hello pals, how you doing?");
	ft_strcmp("coucou\n", "holi");
	strlen_test("");
	strlen_test("1");

	strlen_test("0123456789");
	strlen_test(big_str);

}

int	strlen_test(const char *s)
{
//	printf("-->|%s|\n", s);
	printf("%lu \t (%lu)\n", ft_strlen(s), strlen(s));
	return (1);
}
