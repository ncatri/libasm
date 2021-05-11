NAME = hello

SRC = $(NAME).asm
OBJ = $(SRC:.asm=.o)

RM = rm -f

$(NAME) : $(OBJ)
	ld -lSystem $(OBJ) -o $(NAME)

$(OBJ)	: $(SRC)
	./nasm -f macho64 -g $(SRC) -o $(OBJ)

clean :
	$(RM) $(OBJ)

fclean : clean
	$(RM) $(NAME)

re:	fclean $(NAME)

.PHONY: clean fclean re
