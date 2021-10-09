NAME = libasm.a
NA_FL = -f macho64
NA = nasm

SRCS		=	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_write.s ft_read.s ft_strdup.s
OBJS		=	$(SRCS:.s=.o)
BONUS_SRCS	=	ft_atoi_base_bonus.s ft_list_size_bonus.s ft_list_push_front_bonus.s \
				ft_list_remove_if_bonus.s ft_list_sort_bonus.s
BONUS_OBJS	=	$(BONUS_SRCS:.s=.o)

BON = $(OBJS)
BON += $(BONUS_OBJS)

all: $(NAME)

%.o: %.s
		$(NA) $(NA_FL) -s $< -o $@

$(NAME):  $(OBJS)
		ar -rcs $(NAME) $?

clean:
		rm -rf $(OBJS) $(BONUS_OBJS)

fclean: clean
		rm -rf $(NAME)

bonus:
		@make OBJS="$(BON)" all

re: fclean all

.PHONY: all clean fclean re bonus