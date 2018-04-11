# 正规方法解决线性回归问题
# y=theta0+theta1*x1 拟合函数

# 写成矩阵形式，需注意矩阵输入的维度与输出的维度,维度对应起来

X=1:2:200; % [1,100]
y=5*X+4;#+randn(1,100)*20; % [1,100]                         
X=[ones(1,length(X));X]; # 2x100 第一行为x0（默认为1），第二行为x1

theta=pinv(X*X')*X*y' ; # 2x1    

%theta=pinv(X'*X)*X'*y ; # 1x2                  

# 显示结果
disp(theta);
scatter(X(2,:),y);
hold on;
plot(X(2,:),theta'*X,'r');