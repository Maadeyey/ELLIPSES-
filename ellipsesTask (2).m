clear all;

rootsofy1 = [-5.236, -0.764];
rootsofy2 = [-5.236, -0.764];

rootsofy3 = [-4.414, -1.586];
rootsofy4 = [-4.414, -1.586];

%y1 = sqrt(-x1.^2 -6*x1 -4)-2-x1;
%y2 = -sqrt(-x1.^2 -6*x1 -4)-2-x1;
%y3 = sqrt(-18*x2.^2 - 108*x2 -126);
%y4 = -sqrt(-18*x2.^2 - 108*x2 -126);

y1curvex = rootsofy1(1,1):0.001:rootsofy1(1,2)+0.001;
y1curvey = zeros(1, length(y1curvex));

for i = 1:1:length(y1curvex)
    y1curvey(1,i) = sqrt(-y1curvex(1,i)^2-6*y1curvex(1,i)-4)-2-y1curvex(1,i);
end

y2curvex = rootsofy2(1,1):0.001:rootsofy2(1,2)+0.001;
y2curvey = zeros(1, length(y2curvex));

for i = 1:1:length(y2curvex)
    y2curvey(1,i) = -sqrt(-y2curvex(1,i)^2-6*y2curvex(1,i)-4)-2-y2curvex(1,i);
end

y3curvex = rootsofy3(1,1)-0.001:0.001:rootsofy3(1,2)+0.001;
y3curvey = zeros(1, length(y3curvex));

for i = 1:1:length(y3curvex)
    y3curvey(1,i) = -sqrt(-18*(y3curvex(1,i))^2 - 108*y3curvex(1,i)-126);
end

y4curvex = rootsofy4(1,1)-0.001:0.001:rootsofy4(1,2)+0.001;
y4curvey = zeros(1, length(y4curvex));

for i = 1:1:length(y4curvex)
    y4curvey(1,i) = sqrt(-18*(y4curvex(1,i))^2 - 108*y4curvex(1,i)-126);
end

plot(y1curvex, y1curvey);
hold on;
plot(y2curvex, y2curvey);
plot(y3curvex, y3curvey);
plot(y4curvex, y4curvey);

%interception between y1 and y3
f=@(x)(sqrt(-x.^2 -6*x -4)-2-x) - (sqrt(-18*x.^2 - 108*x -126));
fdiff= @(x) -((x+3)/sqrt(-x.^2 -6.*x-4))-2-x - sqrt(-18*x.^2- 108*x -126); 
x0 = -2;
iterations = 4;
firstint=x0;
for i=1:iterations
    firstint= firstint - f(firstint)/fdiff(firstint);
end 
display(firstint);
display("with " + iterations + " iterations of newtons method");

clear

%2nd interception between y1 and y3
f=@(x2)(sqrt(-x2.^2 -6*x2 -4)-2-x2) - (sqrt(-18*x2.^2 - 108*x2 -126));
fdiff2= @(x2) -((x2+3)/sqrt(-x2.^2 -6.*x2-4))-2-x2 - sqrt(-18*x2.^2- 108*x2 -126); 
x2 = 0;
iterations = 2;
secondint=x2;
for i=1:iterations
    secondint= secondint - f(secondint)/fdiff2(secondint);
    secondinterception=real(secondint);
end 
display(secondinterception);
display("with " + iterations + " iterations of newtons method");

clear


%interception of y2 an y3
f=@(x3)-sqrt(-x3.^2 -6*x3 -4)-2-x3 -sqrt(-18*x3.^2 - 108*x3 -126);
fdiff3= @(x3)-((-x3-3)/sqrt(-x3.^2 -6.*x3-4))-1+ ((-x3-3)*sqrt(-18*x3.^2 - 108*x3 -126)/(x3.^2 +6.*x3 +7)); 
x3 = -4;
iterations =5 ;
thirdint=x3;
for i=1:iterations
    thirdint= thirdint - f(thirdint)/fdiff3(thirdint);
    thirdinterception=real(thirdint);
    
end 
display(thirdinterception);
display("with " + iterations + " iterations of newtons method");
clear

%interception between y2 and y4
f=@(x4) -sqrt(-18*x4.^2 -108*x4-126) + sqrt(-x4.^2 -6*x4-4)-2-x4;
fdiff4= @(x4) (((-x4-3)*sqrt(-18*x4.^2 -108.*x4-126))/(x4.^2+6*x4+7)) + ((-x4-3)/sqrt(-x4.^2-6*x4-4))-1;
x4 = -1.5;
iterations =6;
fourthint=(x4);
for i=1:iterations
    fourthint= fourthint - f(fourthint)/fdiff4(fourthint);
    fourthinterception=real(fourthint);
end 
display(fourthinterception);
display("with " + iterations + " iterations of newtons method");






    