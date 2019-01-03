function x = CalcDistanceBetweenVectors(vectorA,vectorB)
%calculates distance between vectors
%

[m1,n1]=size(vectorA);

[m2,n2]=size(vectorB);

%check valid input here
%%TODO


sum =0;
for t=1:n1
sum = sum + power((vectorA(t,1)-vectorB(t,1)),2);
end
x=sqrt(sum);