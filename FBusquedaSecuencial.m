%Edgar Moises Hernandez-Gonzalez
%05/02/19
%Busqueda Secuencial

function bandera = FBusquedaSecuencial(vector,elemento)
    bandera=0;
    for i=1:length(vector)
        if(vector(i)==elemento)
            bandera=1;
            break;
        end
    end
end