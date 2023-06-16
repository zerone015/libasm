NAME = libasm.a

RM = rm -f
AR = ar
ARFLAGS = rsc

SRCS = ft_read.s	ft_strcmp.s	ft_strcpy.s	ft_strdup.s \
	   ft_strlen.s	ft_write.s
OBJS = $(SRCS:%.s=%.o)

%.o : %.s
	nasm -f macho64 $<	

all : $(NAME)

$(NAME) : $(OBJS)
	ar rcs $@ $^

clean : 
	$(RM) $(OBJS)

fclean : clean
	$(RM) $(NAME)

re : fclean
	$(MAKE) all

.PHONY: all clean fclean re
