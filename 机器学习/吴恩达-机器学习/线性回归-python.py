# -*- coding:utf-8 -*-

'''
使用纯python编写，线性回归
参考：https://blog.csdn.net/yhao2014/article/details/51554910
'''

import numpy as np
from sklearn import datasets
import matplotlib.pyplot as plt

# X,y=datasets.make_regression(n_samples=100,n_features=1,noise=20)
X=np.linspace(0,100,100)
y=5*X+4+np.random.random([100,])*10


plt.scatter(X,y)
# plt.plot(x,y)
# plt.show()

# Hypothesis
theta_0=theta_1=0.001
lr=0.0001
# h=theta_0+theta_1*x
# Cost Function:
m=len(X) # 样本个数

# 迭代阀值，当两次迭代损失函数之差小于该阀值时停止迭代
epsilon = 0.0001
error1 = 0
error0 = 0
def cost(X,y,m):
    global theta_0
    global theta_1
    J=0
    for i,x in enumerate(X):
        h=theta_0+theta_1*x
        J+=1/(2*m)*(h-y[i])**2

    return J

def gradient_descent_algorithm(X,y,m,lr):
    global theta_0
    global theta_1
    print('theta_0',theta_0,'|','theta_1',theta_1)
    Deri_theta_0=Deri_theta_1=0
    for i, x in enumerate(X):
        h = theta_0 + theta_1 * x
        # J += 1 / 2 * m * (h - y[i])
        Deri_theta_0+=1/m*(h-y[i])
        Deri_theta_1 += 1 / m * (h - y[i])*x

    temp0=theta_0-lr*Deri_theta_0
    temp1 = theta_1 - lr * Deri_theta_1

    theta_0=temp0
    theta_1 = temp1

# for epoch in range(100000):
while True:
    gradient_descent_algorithm(X,y,m,lr)

    # 计算损失函数
    error1=cost(X, y, m)
    if abs(error1-error0) < epsilon:
        break
    else:
        error0 = error1

plt.plot(X,theta_0+theta_1*X,color='r')
plt.show()