%Edgar Moises Hernandez-Gonzalez
%07/02/19
%Mutar a un hijo con intercambio

function hijoMutado = FMutar(hijoMutado)
    indicMutar = randsample(8,2);
    temporal=hijoMutado(indicMutar(1));
    hijoMutado(indicMutar(1))=hijoMutado(indicMutar(2));
    hijoMutado(indicMutar(2))=temporal;
end