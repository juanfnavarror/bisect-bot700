%Metodos Numericos 543 18 de febrero de 2019
%Practica 2 - Ejercicio 2
%Navarro Rodriguez Juan Francisco
%Bisect bot 700
%Este programa aproxima por el metodo de biseccion
%a la raiz de la funcion 186*exp(-0.75*x)*sin(2.4*x))
clc;clear;
%Constantes
maxi = inf; %numero maximo de iteraciones (sin limite)
cifras = 6; %cantidad de cifras minimas de la aproximacion

xinf = 1; % x l inicial
xsup = 4.5; % x u inicial
xaprox = 0; % x r

eaprox = [];

tol = 0.5*power(10,2-cifras); %la tolerancia, cifras minimas para acabar

fprintf('\n\nBisect bot 701\n\tEste programa aproxima de forma numerica ');
fprintf('\n\tpor el metodo de biseccion, las raices de');
fprintf('\n\tfuncion f(x) = (186*exp(-0.75*x)*sin(2.4*x)).');
fprintf('\n\nAproximacion');
fprintf('\nSe espera una aproximacion a %d cifras significativas',cifras);
fprintf('\nes decir, una tolerancia de %f %%\n\n',tol);
fprintf('\n n')
fprintf('\t|Xinferior')
fprintf('\t|Xsuperior') 
fprintf('\t|Xaproxim')
fprintf('\t|Prueba\t')
fprintf('\t|Error Apr')


%grafica

res = 50; %resolucion
stepsize = (xsup-xinf)/res;
xvector = xinf:stepsize:xsup;
yvector = 186*exp(-0.75*xvector).*sin(2.4*xvector);

plot(xvector,yvector,'r');
xlabel('Valor de x');
ylabel('Valor de la funcion');
title('Grafica de la funcion');
grid on;

%con base en la grafica, me di cuenta 
%que la segunda raiz esta entre 2 y 3
xinf = 2;xsup = 3;i = 0;

while true
  i = i+1;
	xpast = xaprox;
	xaprox = (xinf+xsup)/2; %agrega la nueva aproximacion al vector
	signo = (186*exp(-0.75*xinf)*sin(2.4*xinf))*(186*exp(-0.75*xaprox)*sin(2.4*xaprox)); %evaluacion de subintervalo
    fprintf('\n%d\t|%f\t|%f\t|%f\t|%f',i,xinf,xsup,xaprox,signo)
    if (i ~= 1)
		eaprox = (abs((xaprox - xpast)/xaprox))*100;
        fprintf('\t|%f',eaprox)
    else
        fprintf('\t|\t')
    end
    
	if (signo < 0)
		xsup = xaprox; 	
	elseif (signo > 0)
		xinf = xaprox;
	end
	if (eaprox < tol)
		break;
	end
end
