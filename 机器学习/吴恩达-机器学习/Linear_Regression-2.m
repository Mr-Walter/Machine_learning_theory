# ���淽��������Իع�����
# y=theta0+theta1*x1 ��Ϻ���

# д�ɾ�����ʽ����ע����������ά���������ά��,ά�ȶ�Ӧ����

X=1:2:200; % [1,100]
y=5*X+4;#+randn(1,100)*20; % [1,100]                         
X=[ones(1,length(X));X]; # 2x100 ��һ��Ϊx0��Ĭ��Ϊ1�����ڶ���Ϊx1

theta=pinv(X*X')*X*y' ; # 2x1    

%theta=pinv(X'*X)*X'*y ; # 1x2                  

# ��ʾ���
disp(theta);
scatter(X(2,:),y);
hold on;
plot(X(2,:),theta'*X,'r');