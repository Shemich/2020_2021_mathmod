---
# Front matter
lang: ru-RU
title: "Отчет по лабораторной работе №4"
subtitle: "Лабораторная №4. Модель гармонических колебаний. Вариант 44"
author: "Шемякин Алексей Александрович"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: lualatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the υalue makes tex try to haυe fewer lines in the paragraph.
  - \interlinepenalty=0 # υalue of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Изучить уравнение гармонического осцилятора

# Задание

- Построить решение уравнения гармонического осциллятора без затухания
- Записать уравнение свободных колебаний гармонического осциллятора с затуханием, построить его решение. Построить фазовый портрет гармонических колебаний с затуханием.
- Записать уравнение колебаний гармонического осциллятора, если на систему действует внешняя сила, построить его решение. Построить фазовый портрет колебаний с действием внешней силы.


# Выполнение лабораторной работы

## Теоретические сведения


Движение грузика на пружинке, маятника, заряда в электрическом контуре, а также эволюция во времени многих систем в физике, химии, биологии и других науках при определенных предположениях можно описать одним и тем же дифференциальным уравнением, которое в теории колебаний выступает в качестве основной модели. Эта модель называется линейным гармоническим осциллятором.
Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2=0$$

где $x$ - переменная, описывающая состояние системы (смещение грузика, заряд конденсатора и т.д.), $\gamma$ - параметр, характеризующий потери энергии (трение в механической системе, сопротивление в контуре), $\omega_0$ - собственная частота колебаний.
Это уравнение есть линейное однородное дифференциальное  уравнение второго порядка и оно является примером линейной динамической системы.

При отсутствии потерь в системе ( $\gamma=0$ ) получаем уравнение консервативного осциллятора энергия колебания которого сохраняется во времени.
$$\ddot{x}+\omega_0^2x=0$$

Для однозначной разрешимости уравнения второго порядка необходимо задать два начальных условия вида
 
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	\dot{x(t_0)}=y_0
 \end{cases}
$$

Уравнение второго порядка можно представить в виде системы двух уравнений первого порядка:
$$
 \begin{cases}
	x=y
	\\   
	y=-\omega_0^2x
 \end{cases}
$$

Начальные условия для системы примут вид:
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	y(t_0)=y_0
 \end{cases}
$$

Независимые	переменные	$x, y$	определяют	пространство,	в	котором «движется» решение. Это фазовое пространство системы, поскольку оно двумерно будем называть его фазовой плоскостью.
Значение фазовых координат $x, y$ в любой момент времени полностью определяет состояние системы. Решению уравнения движения как функции времени отвечает гладкая кривая в фазовой плоскости. Она называется фазовой траекторией. Если множество различных решений (соответствующих различным 
начальным условиям) изобразить на одной фазовой плоскости, возникает общая картина поведения системы. Такую картину, образованную набором фазовых траекторий, называют фазовым портретом.


## Задача

Постройте фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев 

1. Колебания гармонического осциллятора без затуханий и без действий внешней
силы $\ddot{x}+6,6x=0$
2. Колебания гармонического осциллятора c затуханием и без действий внешней
силы $\ddot{x}+9\dot{x}+2x=0$
3. Колебания гармонического осциллятора c затуханием и под действием внешней
силы $\ddot{x}+2.4\dot{x}+6x=0,2cos{(3t)}$

На итнтервале $t \in [ 0;60 ]$, шаг 0.05, $x_0=0, y_0=0$


1. В системе отсутствуют потери энергии (колебания без затухания)
Получаем уравнение 
$$\ddot{x}+\omega_0^2x=0$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=-\omega_0^2x
 \end{cases}
$$

```
import numpy as np
import math
import matplotlib.pyplot as plot
from scipy. integrate import odeint

w2 = 6.6
tmax = 52
step = 0.05
y0 = [1, -1.5]

def W(y, t):
    y1, y2 = y
    return [y2, -w2*y1 ]

t = np.arange( 0, tmax, step)
w1 = odeint(W, y0, t)
y11 = w1[:,0]
y21 = w1[:,1]

fig = plot.figure(facecolor='white')
plot.plot(t, y11, linewidth=2)
plot.ylabel("x")
plot.xlabel("t")
plot.grid(True)
plot.show()
fig.savefig('01.png', dpi = 600)

fig2 = plot.figure(facecolor='white')
plot.plot(y11, y21, linewidth=2)
plot.ylabel("y")
plot.xlabel("x")
plot.grid(True)
plot.show()
fig2.savefig('02.png', dpi = 600)
```

![График решения для случая 1](image/01.png){ #fig:001 width=70% height=70% }

![Фазовый портрет для случая 1](image/02.png){ #fig:002 width=70% height=70% }


2.  В системе присутствуют потери энергии (колебания с затуханием)
Получаем уравнение 
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2x=0$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=-2\gamma y-\omega_0^2x
 \end{cases}
$$

```
w2 = 2
g = 9

def W(y, t):
    y1, y2 = y
    return [y2, -w2*y1 - g*y2]

t = np.arange( 0, tmax, step)
w1 = odeint(W, y0, t)
y11 = w1[:,0]
y21 = w1[:,1]

fig = plot.figure(facecolor='white')
plot.plot(t, y11, linewidth=2)
plot.ylabel("x")
plot.xlabel("t")
plot.grid(True)
plot.show()
fig.savefig('03.png', dpi = 600)

fig2 = plot.figure(facecolor='white')
plot.plot(y11, y21, linewidth=2)
plot.ylabel("y")
plot.xlabel("x")
plot.grid(True)
plot.show()
fig2.savefig('04.png', dpi = 600)
```

![График решения для случая 2](image/03.png){ #fig:003 width=70% height=70% }

![Фазовый портрет для случая 2](image/04.png){ #fig:004 width=70% height=70% }


3. На систему действует внешняя сила.
Получаем уравнение 
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2x=F(t)$$

Переходим к двум дифференциальным уравнениям первого порядка:
$$
 \begin{cases}
	\dot{x}=y
	\\   
	\dot{y}=F(t)-2\gamma y-\omega_0^2x
 \end{cases}
$$

```
w2 = 6
g = 2.4

def f(t):
    f = 0.2*math.cos(3*t)
    return f

def W(y, t):
    y1, y2 = y
    return [y2, -w2*y1 - g*y2 + f(t)]

t = np.arange( 0, tmax, step)
w1 = odeint(W, y0, t)
y11 = w1[:,0]
y21 = w1[:,1]


fig = plot.figure(facecolor='white')
plot.plot(t, y11, linewidth=2)
plot.ylabel("x")
plot.xlabel("t")
plot.grid(True)
plot.show()
fig.savefig('05.png', dpi = 600)

fig2 = plot.figure(facecolor='white')
plot.plot(y11, y21, linewidth=2)
plot.ylabel("y")
plot.xlabel("x")
plot.grid(True)
plot.show()
fig2.savefig('06.png', dpi = 600)
```
![График решения для случая 3](image/05.png){ #fig:005 width=70% height=70% }

![Фазовый портрет для случая 3](image/06.png){ #fig:006 width=70% height=70% }

# Выводы
В ходе выполнения лабораторной работы были построены решения уравнения гармонического осциллятора и фазовые портреты гармонических колебаний без затухания, с затуханием и при действии внешней силы.