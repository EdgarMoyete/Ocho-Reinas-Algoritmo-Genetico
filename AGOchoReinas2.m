%Edgar Moises Hernandez-Gonzalez
%06/02/19-07/02/19
%Algoritmo genetico para el problema de las 8 reinas
%*modificando parametros*
%tamano de la poblacion a 80
%se seleccionan aleatoriamente a 10 individuos y los 2 mejores se
%reproducen
%para la cruza el primer padre hereda los primeros 4 genes

clear
clc

%tamano de la poblacion
n = 80;

%creando poblacion
poblacionInicial=zeros(n,8);
for i=1:n
    poblacionInicial(i, :) = randsample(8, 8)';
end

%evaluar la poblacion (contar el numero de choques entre las reinas)
evaluacion=zeros(n,1);
for i=1:n
    evaluacion(i) = FChoquesOchoReinas(poblacionInicial(i, :));
end

%ciclo de las n generaciones
for generaciones=1:25
    %disp(['---Generacion--- ', int2str(generaciones)]);
    poblacionSeleccionada = [poblacionInicial evaluacion];
    seleccionPadres = zeros(5,9);
    padresGanadores = zeros(2,9);
    hijos=[];

    %seleccionar padres, cruza y mutar
    for i=1:n/4 %20 iteraciones de las cuales saldran 40 hijos
        %seleccion de padres
        indices = randsample(n,10); %generar 5 numeros aleatorios sin repetir del 1 al 80
        for j=1:10
            seleccionPadres(j,:) = poblacionSeleccionada(indices(j),:); %10 aleatorios
        end
        [sumasFitness, indicesFitness]=sort(sum(seleccionPadres,2)); %ordena a los 5 aleatorios
        for j=1:2
            padresGanadores(j,:) = seleccionPadres(indicesFitness(j),:); %padres (ganadores) que se reproduciran
        end
        %cruza
        puntoCruze = 4; %el primer padre hereda los primeros 4 genes
        padre1 = padresGanadores(1,:);
        padre2 = padresGanadores(2,:);
        hijo1 = zeros(1,8);
        hijo2 = zeros(1,8);
        for j=1:puntoCruze
            hijo1(j)=padre1(j);
        end
        j=j+1;
        while j<9
            k=j;
            hijo1 = FCruza(j, k, hijo1, padre2);
            j=j+1;
        end
        for j=1:puntoCruze
            hijo2(j)=padre2(j);
        end
        j=j+1;
        while j<9
            k=j;
            hijo2 = FCruza(j, k, hijo2, padre1);
            j=j+1;
        end
        %mutacion
        hijo1Mutado=FMutar(hijo1);
        hijo2Mutado=FMutar(hijo2);
        hijos = [hijos; hijo1Mutado; hijo2Mutado]; %matriz de todos los hijos
    end

    %evaluar la poblacion
    evaluacionHijos=zeros(40,1);
    for i=1:40
        evaluacionHijos(i) = FChoquesOchoReinas(hijos(i, :)); %numero de choques
    end
    hijosEvaluados = [hijos evaluacionHijos];
    poblacionMasHijos = [poblacionSeleccionada; hijosEvaluados];

    poblacionSeleccionada=zeros(n,9);
    [sumasFitness, indicesFitness]=sort(sum(poblacionMasHijos,2)); %ordenar la poblacion
    for i=1:n
        poblacionSeleccionada(i,:) = poblacionMasHijos(indicesFitness(i),:); %individuos para la siguiente generacion
    end
    %imprimir las soluciones (mejores fitness en cada generacion)
    for i=1:10
        if poblacionSeleccionada(i,9) == 0 %si no hay choques entonces es una solucion
            disp(['*****Solucion en generacion ', int2str(generaciones)]);
            disp(poblacionSeleccionada(i,:)) %imprime la solucion
        else
            break;
        end
    end
%     promedio=mean(poblacionSeleccionada(:,9)); %promedio de fitness (numero de choques)
%     mediana=median(poblacionSeleccionada(:,9)); %mediana
%     desviacionStd=std(poblacionSeleccionada(:,9)); %desviacion estandar
%     peor=poblacionSeleccionada(n,:); %peor
%     disp('Promedio');
%     disp(promedio);
%     disp('mediana');
%     disp(mediana);
%     disp('desviacion std');
%     disp(desviacionStd);
%     disp('peor');
%     disp(peor);
end