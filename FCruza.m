%Edgar Moises Hernandez-Gonzalez
%07/02/19
%Cruza usando cortar y rellenar

function hijo = FCruza(j, k, hijo, padre)
	if FBusquedaSecuencial(hijo,padre(k))==0
        hijo(j)=padre(k);
    else
        k=k+1;
        if k>8
            k=1;
        end
        hijo=FCruza(j, k, hijo, padre);
    end
end