# 二分类，使用回归方法做分类(类似逻辑回归)

X=1:2:200; % [1,100]
y=double(X<100);
%scatter(X,y)

X=[ones(1,length(X));X]; # 2x100 第一行为x0（默认为1），第二行为x1

theta=[0;1]; # 2x1
lr=0.0001;
m=length(X); % 100

# 迭代阀值，当两次迭代损失函数之差小于该阀值时停止迭代
epsilon0 = 10^(-4);
epsilon = 10^(-7);
error1 = 0;
error0 = 0;
flag=1;

function y=predictions(X,theta);
  % X=[ones(1,length(X));X]; # 2x100
  # X=X' # 100x2
  y=theta'*X; # 1x100
  % y=sum(y);
end;

while true;
  h=predictions(X,theta); # 1x100

  # cost function
  J=1/(2*m)*sum((h-y).^2);

  %detail0=1/m*(h-y)*X(1,:)'

  %detail1=1/m*(h-y)*X(2,:)'

  detail=1/m*((h-y)*X'); # 1x2

  theta=theta-lr*detail';
  
  # disp(theta);
  
  error1=J;
  if abs(error1-error0) < epsilon0 && flag==1;
    lr=lr*0.8;
    flag=0;
  elseif abs(error1-error0) < epsilon;
    break;
  else;
    error0 = error1;
  end;
end;

# 显示结果
disp(theta);
scatter(X(2,:),y);
hold on;
plot(X(2,:),theta'*X,'r');

# 预测结果
X_=[50 70 110 130]; # 理论上对应的类别应该是y=[1,1,0,0]
X_=[ones(1,length(X_));X_];
y_=theta'*X_; # 1x4

# 计算 y_更靠近0、还是1，如果靠近1则分类为1，否则反之
error=(y_-ones(size(y_))).^2-y_.^2;# 1x4
classfy_y=int8(error<0);
disp(X_);
disp("的分类类别为:");
disp(classfy_y);


