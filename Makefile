# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lboulatr <lboulatr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/23 15:54:04 by lboulatr          #+#    #+#              #
#    Updated: 2023/02/22 13:37:00 by lboulatr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS 							= main.c \
									ft_hexa.c \
									ft_hexaptr.c \
									ft_putnbr_fd_count.c \
									ft_putnbr_fd_usign.c \
	
OBJS 							= $(SRCS:%.c=$(BUILD_DIR)%.o)

BUILD_DIR						= build/

CC 								= cc

FLAGS 							= -Wall -Werror -Werror

HEADER 							= ft_printf.h 

NAME 							= libftprintf.a

LIB 							= ar rc

RM 								= rm -rf

$(BUILD_DIR)%.o:				%.c $(HEADER) libft
									@mkdir -p $(@D)
									$(CC) $(FLAGS) -include $(HEADER) -c $< -o $@
	
all:							${NAME} Makefile libft

libft:
									make -C libft

${NAME}:						libft ${OBJS} Makefile
									cp libft/libft.a ./${NAME}
									${LIB} ${NAME} ${OBJS}

clean:	
									${RM} ${OBJS}
									make clean -C libft
									$(RM) $(BUILD_DIR)

fclean:							clean
									${RM} ${NAME}
									make fclean -C libft

re:								fclean all

.PHONY:	all clean fclean re libft