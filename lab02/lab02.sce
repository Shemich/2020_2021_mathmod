k=16.3;// начальное расстояние от лодки до катера
n=4.1;//разница в скорости между катерами
fi=3*%pi/4;
//функция, описывающая движение катера береговой охраны
function dr=f(tetha, r)
dr=r/sqrt(n);
endfunction;
//начальные условия в случае 2
r0=k;
tetha0=0;
tetha=0:0.01:2*%pi;
r=ode(r0,tetha0,tetha,f);
//функция, описывающая движение лодки браконьеров
function xt=f2(t)
 xt=tan(fi)*t;
endfunction
t=0:1:800;
plot2d(t,f2(t),style = 5);//построение траектории движения браконьерской лодки
polarplot(tetha,r,style = 2);//построение траектории движения катера в полярных координатах\

r0=-k;
tetha0=-%pi;
figure();
r=ode(r0,tetha0,tetha,f);
plot2d(t,f2(t),style = color('red'));//построение траектории движения браконьерской лодки
polarplot(tetha,r,style = color('purple'));//построение траектории движения катера в полярных координатах
