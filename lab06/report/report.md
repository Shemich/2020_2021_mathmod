---
# Front matter
lang: ru-RU
title: "Отчет по лабораторной работе №6"
subtitle: "Лабораторная №6. Модель эпидемии. Вариант 44"
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

Изучить модель эпидемии S I R

# Задание

- Изучить модель эпидемии
- Построить графики изменения числа особей в каждой из трех групп.
- Рассмотреть, как будет протекать эпидемия в случае: $I(0)\leq I^*$
- Рассмотреть, как будет протекать эпидемия в случае: $I(0)>I^*$

## Теоретические сведения

Рассмотрим простейшую модель эпидемии. Предположим, что некая популяция, состоящая из $N$ особей, (считаем, что популяция изолирована) подразделяется на три группы. Первая группа - это восприимчивые к болезни, но пока здоровые особи, обозначим их через $S(t)$. Вторая группа – это число инфицированных особей, которые также при этом являются распространителями инфекции, обозначим их $I(t)$. А третья группа, обозначающаяся через $R(t)$ – это здоровые особи с иммунитетом к болезни. 
До того, как число заболевших не превышает критического значения $I^*$, считаем, что все больные изолированы и не заражают здоровых. Когда $I(t)> I^*$, тогда инфицирование способны заражать восприимчивых к болезни особей. 

Таким образом, скорость изменения числа $S(t)$ меняется по следующему закону:

$$
\frac{dS}{dt}=
 \begin{cases}
	-\alpha S &\text{,если $I(t) > I^*$}
	\\   
	0 &\text{,если $I(t) \leq I^*$}
 \end{cases}
$$

Поскольку каждая восприимчивая к болезни особь, которая, в конце концов, заболевает, сама становится инфекционной, то скорость изменения числа инфекционных особей представляет разность за единицу времени между заразившимися и теми, кто уже болеет и лечится. Т.е.:

$$
\frac{dI}{dt}=
 \begin{cases}
	\alpha S -\beta I &\text{,если $I(t) > I^*$}
	\\   
	-\beta I &\text{,если $I(t) \leq I^*$}
 \end{cases}
$$

А скорость изменения выздоравливающих особей (при этом приобретающие иммунитет к болезни):

$$\frac{dR}{dt} = \beta I$$

Постоянные пропорциональности $\alpha, \beta$ - это коэффициенты заболеваемости и выздоровления соответственно. Для того, чтобы решения соответствующих уравнений определялось однозначно, необходимо задать начальные условия. Считаем, что на начало эпидемии в момент времени $t=0$ нет особей с иммунитетом к болезни $R(0)=0$, а число инфицированных и восприимчивых к болезни особей $I(0)$ и $S(0)$ соответственно. Для анализа картины протекания эпидемии необходимо рассмотреть два случая:  $I(0) \leq I^*$ и  $I(0)>I^*$

## Задача

На одном острове вспыхнула эпидемия. Известно, что из всех проживающих на острове $(N=5555)$ в момент начала эпидемии $(t=0)$ число заболевших людей (являющихся распространителями инфекции) $I(0)=75$, А число здоровых людей с иммунитетом к болезни $R(0)=4$. Таким образом, число людей восприимчивых к болезни, но пока здоровых, в начальный момент времени $S(0)=N-I(0)-R(0)$.
Постройте графики изменения числа особей в каждой из трех групп.
Рассмотрите, как будет протекать эпидемия в случае:

1.	$I(0)\leq I^*$
2.	$I(0)>I^*$

```
import numpy as np
from scipy. integrate import odeint
import matplotlib.pyplot as plt
import math
a = 0.01
b = 0.02
N = 5555
I0 = 75
R0 = 4
S0 = N - I0 - R0
def syst(t, x):
    t1, t2, t3 = t
    return [0, -b*t2, b*t2 ]
def syst2(t, x):
    t1, t2, t3 = t
    return [-a*t1, a*t1-b*t2, b*t2 ]
x0 = 0
y0 = [S0,I0,R0]
x = np.arange( 0, 200, 0.01)
t1 = odeint(syst, y0, x)
t1s = t1[:,0]
t1i = t1[:,1]
t1r = t1[:,2]
fig1 = plt.figure(facecolor = 'white')
plt.plot(t, t1s, linewidth = 2, label = 'S(t)')
plt.plot(t, t1i, linewidth = 2, label = 'I(t)')
plt.plot(t, t1r, linewidth = 2, label = 'R(t)')
plt.ylabel("Численность")
plt.xlabel("t")
plt.grid(True)
plt.legend()
plt.show()
fig1.savefig('01.png', dpi = 600)
t2 = odeint(syst2, y0, x)
t2s = t2[:,0]
t2i = t2[:,1]
t2r = t2[:,2]
fig2 = plt.figure(facecolor = 'white')
plt.plot(t, t2s, linewidth = 2, label = 'S(t)')
plt.plot(t, t2i, linewidth = 2, label = 'I(t)')
plt.plot(t, t2r, linewidth = 2, label = 'R(t)')
plt.ylabel("Численность")
plt.xlabel("t")
plt.grid(True)
plt.legend()
plt.show()
fig2.savefig('02.png', dpi = 600)
```

![Графики численности в случае $I(0)\leq I^*$](image/01.png){ #fig:001 width=70% height=70% }

![Графики численности в случае $I(0)>I^*$](image/02.png){ #fig:002 width=70% height=70% }


# Выводы
В ходе выполнения лабораторной работы была изучена модель эпидемии и построены графики.