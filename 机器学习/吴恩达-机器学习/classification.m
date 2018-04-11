# �����࣬ʹ�ûع鷽��������(�����߼��ع�)

X=1:2:200; % [1,100]
y=double(X<100);
%scatter(X,y)

X=[ones(1,length(X));X]; # 2x100 ��һ��Ϊx0��Ĭ��Ϊ1�����ڶ���Ϊx1

theta=[0;1]; # 2x1
lr=0.0001;
m=length(X); % 100

# ������ֵ�������ε�����ʧ����֮��С�ڸ÷�ֵʱֹͣ����
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

# ��ʾ���
disp(theta);
scatter(X(2,:),y);
hold on;
plot(X(2,:),theta'*X,'r');

# Ԥ����
X_=[50 70 110 130]; # �����϶�Ӧ�����Ӧ����y=[1,1,0,0]
X_=[ones(1,length(X_));X_];
y_=theta'*X_; # 1x4

# ���� y_������0������1���������1�����Ϊ1������֮
error=(y_-ones(size(y_))).^2-y_.^2;# 1x4
classfy_y=int8(error<0);
disp(X_);
disp("�ķ������Ϊ:");
disp(classfy_y);


