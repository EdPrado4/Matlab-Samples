
%Problema de la Mochila
clc, clear all, close all;

%Definici�n del tama�o de la muestra:
samplesize = 32;
%Poblaci�n Total
Pop = 1:1:31;
%Definic�on del tama�o del cromosoma:
lcrom = 5;
%Rangos M�nimo y m�ximo:
MinRan = 0;
MaxRan = 31;
%Pesos y Beneficios de los objetos:
W = [30 20 22 10 7];
B = [100 75 80 40 20];
%Capacidad m�xima de la mochila
maxC = 40;
%Reserva de Memoria y banderas
ValidSample = zeros(lcrom,14);
decValid = zeros(1,14);
isValid = 0;

%Determinaci�n de la muestra:
for i=1:samplesize-1
   %Convertir la muestra
   sample = dec2binvec(Pop(i),lcrom);
   %Calcular el peso de la muestra seleccionada
   Wsample = W*sample';
   %Filtrar las muestras �tiles
   if((Wsample <= maxC)&&(Wsample ~= 0))
       isValid = isValid + 1;
       ValidSample(:,isValid)=sample;
       decValid(isValid)=Pop(i);
   end
   
end

%Calcular los pesos y beneficios de las muestras validas:
WTotal = W*ValidSample;
BTotal = B*ValidSample;

%Graficar los resultados
subplot(2,1,1)
stem(decValid,BTotal, 'Fill')
xlabel('Individuo')
ylabel('Beneficio')
grid on
title('Grafica 1: Individuo vs Beneficio');

subplot(2,1,2)
stem(decValid,WTotal, 'Fill', 'red')
xlabel('Individuo')
ylabel('Peso')
grid on
title('Grafica 2: Individuo vs Peso');





