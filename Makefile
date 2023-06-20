NAME = libasm.a

RM = rm -f
AR = ar
ARFLAGS = rsc

SRCS = ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s \
	   ft_strlen.s ft_write.s
BSRCS = ft_atoi_base_bonus.s ft_list_push_front_bonus.s ft_list_size_bonus.s \
		ft_list_remove_if_bonus.s

OBJS = $(SRCS:%.s=%.o)
BOBJS = $(BSRCS:%.s=%.o)

ifdef WITH_BONUS
    OBJ_FILES = $(OBJS) $(BOBJS)
else
    OBJ_FILES = $(OBJS)
endif

%.o : %.s
	nasm -f macho64 $<	

all : $(NAME)

bonus :
	make WITH_BONUS=1 all

$(NAME) : $(OBJ_FILES)
	$(AR) ${ARFLAGS} $@ $^

clean : 
	$(RM) $(wildcard *.o)

fclean : clean
	$(RM) $(NAME)

re : fclean
	$(MAKE) all

.PHONY: all bonus clean fclean re
