clc;
clear;
title = 'Ввод данных';
promt = {'Длина первого звена:','Длина второго звена:',...
'Длина третьего звена:',...
'Масса первого звена: ','Масса второго звена: ','Масса третьего звена: ',...
'Масса груза в схвате:',...
'Моммент первого двигателя:','Моммент второго двигателя:',...
'Моммент третьего двигателя:'};
lines = 1;
def = {'1.5','1.1','1.1', ...
       '22.5','17','10','1.1',...
       '15','10','1.1'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
answer = inputdlg(promt,title,lines,def,options);
L1=str2num(char(answer(1)));
L2=str2num(char(answer(2)));
L3=str2num(char(answer(3)));
m1=str2num(char(answer(4)));
m2=str2num(char(answer(5)));
m3=str2num(char(answer(6)));
m4=str2num(char(answer(7)));
Jd1=str2num(char(answer(8)));
Jd2=str2num(char(answer(9)));
Jd3=str2num(char(answer(10)));
title = 'Ввод данных';
promt = {
'Передаточное число первого редуктора:', ...
'Передаточное число второго редуктора:',...
'Передаточное число третьего редуктора:',...
'Сопротивление якоря первого двигателя:',...
'Сопротивление якоря второго двигателя:',...
'Сопротивление якоря третьего двигателя:'};
lines = 1;
def = {'125','75','1.1',...
       '100','75','1.1'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
answer = inputdlg(promt,title,lines,def,options);
n1=str2num(char(answer(1)));
n2=str2num(char(answer(2)));
n3=str2num(char(answer(3)));
Ra1=str2num(char(answer(4)));
Ra2=str2num(char(answer(5)));
Ra3=str2num(char(answer(6)));

title = 'Ввод данных';
promt = {'Электромагнитная постоянная первого двигателя:', ...
    'Электромагнитная постоянная второго двигателя:',...
    'Электромагнитная постоянная третьего двигателя:',...
    'Конструктивный коэффициент первого двигателя:', ...
    'Конструктивный коэффициент второго двигателя:', ...
    'Конструктивный коэффициент третьего двигателя:'};
lines = 1;
def = {'125','100','100','50','50','25'};
answer = inputdlg(promt,title,lines,def,options);
Ta1=str2num(char(answer(1)));
Ta2=str2num(char(answer(2)));
Ta3=str2num(char(answer(3)));
Km1=str2num(char(answer(4)));
Km2=str2num(char(answer(5)));
Km3=str2num(char(answer(6)));
m4=m2+m3;
g=9.81;
a(1,1)=m1*(L1^2)+m4*((L1+L2)^2)+Jd1*(n1^2);
a(1,2)=m1*L2*(L1+L2);
a(2,1)=m4*L2*(L1+L2);
a(2,2)=m4*(L2^2)+Jd2*(n2^2);
c(1,1)=(m1+m4)*g*L1+m4*g*L2;
c(1,2)=m4*g*L2;
c(2,1)=m4*g*L2;
c(2,2)=m4*g*L2;
simOut = sim('untitled1');