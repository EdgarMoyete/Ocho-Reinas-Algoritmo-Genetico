%Edgar Moises Hernandez-Gonzalez
%01/02/19-06/02/19
%Numero de choques en el problema de las 8 reinas

function fitness = FOchoReinas(x)
%x = permutaciones, la altura de las reinas en cada columna

%mapear para el tablero
filas=zeros(1,8);
for i=1:length(x)
    switch x(i)
        case 1
            filas(i) = 8;
        case 2
            filas(i) = 7;
        case 3
            filas(i) = 6;
        case 4
            filas(i) = 5;
        case 5
            filas(i) = 4;
        case 6
            filas(i) = 3;
        case 7
            filas(i) = 2;
        case 8
            filas(i) = 1;
    end
end

columnas=1:8;

tablero = zeros(8,8);
for i=1:length(x)
    tablero(filas(i),columnas(i))=100;
end

[f, c] = size(tablero);
for i=1:f
    for j=1:c
        if (tablero(i,j) > 99)
            for k=1:f
                if(i-k < 1 | j-k < 1)
                    break;
                end
                tablero(i-k,j-k)=tablero(i-k,j-k) + 1;
            end
            for k=1:f
                if(i-k < 1 | j+k > 8)
                    break;
                end
                tablero(i-k,j+k)=tablero(i-k,j+k) + 1;
            end
            for k=1:f
                if(i+k > 8 | j+k > 8)
                    break;
                end
                tablero(i+k,j+k)=tablero(i+k,j+k) + 1;
            end
            for k=1:f
                if(i+k > 8 | j-k < 1)
                    break;
                end
                tablero(i+k,j-k)=tablero(i+k,j-k) + 1;
            end
            %tablero
        end
    end
end

fitness = 0;
for i=1:f
    for j=1:c
        if tablero(i,j) > 100
           fitness=fitness + tablero(i,j) - 100; 
        end
    end
end
end