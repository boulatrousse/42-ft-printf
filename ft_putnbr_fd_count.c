/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_fd_count.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lboulatr <lboulatr@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/23 13:47:16 by lboulatr          #+#    #+#             */
/*   Updated: 2023/02/16 15:24:09 by lboulatr         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static void	ft_putnbr_fd_count_bis(int n, int fd)
{
	if (n == -2147483648)
		write(fd, "-2147483648", 11);
	else
	{
		if (n >= 0 && n <= 9)
			ft_putchar_fd(n + 48, fd);
		else if (n < 0)
		{
			ft_putchar_fd('-', fd);
			ft_putnbr_fd(n * (-1), fd);
		}
		else
		{
			ft_putnbr_fd((n / 10), fd);
			ft_putnbr_fd((n % 10), fd);
		}
	}
}

int	ft_putnbr_fd_count(int n, int fd)
{
	ft_putnbr_fd_count_bis(n, fd);
	return (count(n));
}

int	ft_putstr_fd_count(char *s, int fd)
{
	int	i;

	i = 0;
	if (s)
	{
		while (s[i])
		{
			write(fd, &s[i], 1);
			i++;
		}
	}
	else
	{
		write(fd, "(null)", 6);
		i += 6;
	}
	return (i);
}
