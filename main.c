#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

# define BIG_NUM (21473)

size_t	ft_strlen(const char *s);
int		strlen_unittest(const char *s);
int		strlen_test(void);
int		ft_strcmp(const char *s1, const char *s2);
int		strcmp_test(void);
int		strcmp_unittest(const char *s1, const char *s2);
int		ft_write(int fd, const char *buf, size_t len);
int		write_test(void);
int		ft_read(int fd, void *buf, size_t nbyte);
int		read_test(void);
char	*ft_strcpy(char *dst, const char *src);
int		strcpy_test(void);
int		strcpy_unittest(char *dst, const char *src);
char	*ft_strdup(const char *s1);
int		strdup_test(void);
int		strdup_unittest(char *sdup, char *str);

int main(void)
{
	strlen_test();
	strcmp_test();
	write_test();
	read_test();
	strcpy_test();
	strdup_test();
}

int	strlen_test(void)
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


	strlen_unittest("Hello pals, how you doing?");
	strlen_unittest("");
	strlen_unittest("1");

	strlen_unittest("0123456789");
	strlen_unittest(big_str);
	return (1);
}

int	strlen_unittest(const char *s)
{
//	printf("-->|%s|\n", s);
	printf("%lu \t (%lu)\n", ft_strlen(s), strlen(s));
	return (1);
}
int strcmp_test(void)
{
	printf(" ======= strcmp ======\n");
	strcmp_unittest("abcd", "abt");
	strcmp_unittest("", "abt");
	strcmp_unittest("abcd", "");
	strcmp_unittest("abcd", "abcd");
	strcmp_unittest("onjour", "bonjour");
	strcmp_unittest("\xff\xff", "\xff");
	strcmp_unittest("\xff\xfe", "\xff");
	strcmp_unittest("\xfe\xff", "\xfe");


	return (1);
}

int	strcmp_unittest(const char *s1, const char *s2)
{
	int		retasm;
	int		retstd;

	retasm = ft_strcmp(s1, s2);
	printf("retasm: %d\n", retasm);
	retstd = strcmp(s1, s2);
	printf("retstd: %d\n", retstd); 
	return (1);
}

int	write_test(void)
{
	printf(" ======= write ======\n");
	int ret;
	ret = ft_write(1, "hello\n", 6);
	printf("ret: %d, errno: %d\n", ret, errno);
	return (1);
}

int	read_test(void)
{
	printf(" ======= read ======\n");

	int ret;
	int fd;
	char	buf[100];
	fd = open("testfile", O_RDONLY);
	ret = ft_read(13, buf, 4);
	printf("ret: %d\n", ret);
	if (ret >= 0)
		write(1, buf, 4);

	return (1);
}

int	strcpy_test(void)
{
	printf(" ======= strcpy ======\n");

	char	dst[100] = {0};

	strcpy_unittest(dst, "123");
	bzero(dst, 100);
	strcpy_unittest(dst, "");
	bzero(dst, 100);
	strcpy_unittest(dst, "salut comment ca va?");

	return (1);
}

int	strcpy_unittest(char *dst, const char *src)
{
	char *ret = strcpy(dst, src);
	printf("src: %s, dst: %s\n", dst, src);
	printf("dst addr: %p, ret addr: %p\n", dst, ret);

	return (1);
}

int	strdup_test(void)
{
	printf(" ======= strdup ======\n");

	char *sdup;
	sdup = NULL;
	strdup_unittest(sdup, "coucou");
	strdup_unittest(sdup, "");
	strdup_unittest(sdup, "aoighsnvaoiqhrnakhgilqughiauhiqugiauuughn");
	strdup_unittest(sdup, NULL);

	return (1);
}

int	strdup_unittest(char *sdup, char *str)
{
	sdup = ft_strdup(str);
	printf("sdup: |%s|\n", sdup);
	free(sdup);
	return (1);
}
