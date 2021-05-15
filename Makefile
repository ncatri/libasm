NAME = libasm.a

SRC = ft_strlen.s \
	  ft_strcmp.s

OBJ = $(SRC:.s=.o)

RM = rm -f

$(NAME) : $(OBJ)
	ar rcs $(NAME) $?

%.o	:	%.s 
	./nasm -f macho64 -g $< -o $@

clean :
	$(RM) $(OBJ)

fclean : clean
	$(RM) $(NAME)
	$(RM) a.out
	$(RM) -r a.out.dSYM

re:	fclean $(NAME)

.PHONY: clean fclean re
