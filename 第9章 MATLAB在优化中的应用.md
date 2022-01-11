# 第9章 `MATLAB`在优化中的应用

1. 求解下列规划问题：

   $$
   \begin{array}{lll}
   & \min & f(x)=-5x_1-4x_2-6x_3\\
   & \mathrm{s.t.} & x_1-x_2+x_3\leq20\\
   & & 3x_1+2x_2+4x_3\leq42\\
   & & 3x_1+2x_2\leq30\\
   & & 0 \leq x_1,0 \leq x_2,0 \leq x_3
   \end{array}
   $$

   ```matlab
   f=[-5,-4,-6];
   A=[1,-1,1;3,2,4;3,2,0];
   b=[20,42,30];
   vlb=[0,0,0];
   vub=[];
   [x,fval]=linprog(f,A,b,[],[],vlb,vub)
   % 输出
   x =
       0.0000
      15.0000
       3.0000
   fval =
     -78.0000
   ```

2. 求解下列规划问题：

   $$
   \begin{array}{lll}
   & \min & f(x)=13x_1+9x_2+10x_3+11x_4+12x_5+8x_6\\
   & \mathrm{s.t.} & x_1+x_4=300\\
   & & x_2+x_5=500\\
   & & x_3+x_6=400\\
   & & 0.4x_1+1.1x_2+x_3 \leq 700\\
   & & 0.5x_4+1.2x_5+1.3x_6 \leq 800\\
   & & x_j \geq 0,j=1,2,\cdots,6
   \end{array}
   $$

   ```matlab
   f=[13,9,10,11,12,8];
   B=[1,0,0,1,0,0;0,1,0,0,1,0;0,0,1,0,0,1];
   d=[300,500,400];
   A=[0.4,1.1,1,0,0,0;0,0,0,0.5,1.2,1.3];
   b=[700,800];
   vlb=[0,0,0,0,0,0];
   vub=[];
   [x,fval]=linprog(f,A,b,B,d,vlb,vub)
   % 输出
   x =
       0.0000
     500.0000
       0.0000
     300.0000
       0.0000
     400.0000
   fval =
      1.1000e+04
   ```

3. 求解下列二次优化问题：

   $$
   \begin{array}{ll}
   & \min & f(x)=3x_1^2+2x_1x_2+x_2^2-x_1+4x_2\\
   & \mathrm{s.t.} & x_1+x_2=3\\
   & & 2x_1+x_2\leq6\\
   & & 5x_1-2x_2\leq9\\
   & & x_j \geq 0,j=1,2
   \end{array}
   $$

   ```matlab
   % 先化成标准型
   H=[6,2;2,2];
   f=[-1,4];
   A=[2,1;5,-2];
   b=[6;9];
   B=[1,1;0,0];
   d=[3;0];
   vlb=[0,0];
   vub=[];
   [x,fval]=quadprog(H,f,A,b,B,d,vlb,vub)
   % 输出
   x =
       1.2500
       1.7500
   fval =
      17.8750
   ```
   
4. 将下列函数最小化：

   $$
   f(x)=6x_1^2-x_1x_2+1.3x_2^2
   $$

   ```matlab
   % 先化成标准型
   H=[12,-1;-1,2.6];
   f=[0;0];
   A=zeros(2,2);
   b=zeros(2,1);
   [x,fval]=quadprog(H,f,A,b)
   % 输出
   x =
      1.0e-15 *
       0.2220
            0
   fval =
      2.9582e-31
   
   [x,val]=fminsearch('6*x(1)^2-x(1)*x(2)+1.3*x(2)^2',[0,0])
   
   [x, val] = fminsearch(@(x) 6*x(1)^2-x(1)*x(2)+1.3*x(2)^2, [0, 0])
   % 输出
   x =
        0     0
   val =
        0
   ```

5. 将下列函数最小化

   $$
   f(x)=\sin(x_2+e^{x_1})+(4x_1^2+2x_2^2+4x_1x_2+2x_2+1)
   $$

   ```matlab
   [x,val]=fminsearch('sin(x(2)+exp(x(1)))+4*x(1)^2+2*x(2)^2+4*x(1)*x(2)+2*x(2)+1',[0,0])
   
   [x,val]=fminunc('sin(x(2)+exp(x(1)))+4*x(1)^2+2*x(2)^2+4*x(1)*x(2)+2*x(2)+1',[0,0])
   % 输出
   x =
       0.3885   -1.1233
   val =
       0.4794
   
   x =
       0.3886   -1.1233
   val =
       0.4794
   ```

6. 求解下列优化问题：

   $$
   \begin{array}{ll}
   & \min & f(x)=e^{\sin(x_1+2)-0.1x_2}+\cos(x_3)\\
   & \mathrm{s.t.} & x_1+2x_2+x_3\leq23\\
   & & -x_1-4x_2-3x_3\leq-3\\
   & & x_1\geq0,x_2\geq0,x_3\geq0\\
   & & x_1x_3+x_2\leq100\\
   & & \exp(x_1)-x_2\leq100\\
   & & \log(x_1+1)-\sin(x_2)+x_3=10
\end{array}
   $$
   
   ```matlab
   % 函数式文件1
   function f=ex9_61(x)
   f=exp(sin(x(1)+2)-0.1*x(2))+cos(x(3));
   % 函数式文件2
   function [c,ceq]=ex9_62(x)
   c=[x(1)*x(3)-x(2)-100,exp(x(1))-x(2)-100];
   ceq=[log(x(1)+1)-sin(x(2))+x(3)-10];
   % 命令行窗口
   x0=[0,0,0];
   A=[1,2,1;-1,-4,-3];
   b=[23;-3];
   vlb=[0,0,0];
   vub=[];
   [x,fval]=fmincon(@ex9_61,x0,A,b,[],[],vlb,vub,@ex9_62)
   
   [x,fval]=fmincon('ex9_61',x0,A,b,[],[],vlb,vub,'ex9_62')
   
   f = @(x) exp(sin(x(1) + 2) - 0.1 * x(2)) + cos(x(3));
   [x, fval] = fmincon(f, x0, A, b, [], [], vlb, vub, 'ex9_62')
   % 输出，输出一致，略
   x =
       2.7573    0.9357    9.4813
   fval =
      -0.6630
   ```
