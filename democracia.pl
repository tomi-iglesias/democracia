% BASE DE CONOCIMIENTOS

candidato(frank,rojo,50).
candidato(claire,rojo,52).
candidato(garrett,azul,64).
candidato(jackie,amarillo,38).
candidato(linda,azul,30).
candidato(catherine,rojo,59).
candidato(heather,amarillo,50).

partido(azul,buenosAires).
partido(azul,chaco).
partido(azul,tierraDelFuego).
partido(azul,sanLuis).
partido(azul,neuquen).
partido(rojo,buenosAires).
partido(rojo,tierraDelFuego).
partido(rojo,chubut).
partido(rojo,cordoba).
partido(rojo,santaFe).
partido(rojo,sanLuis).
partido(amarillo,chaco).
partido(amarillo,formosa).
partido(amarillo,tucuman).
partido(amarillo,salta).
partido(amarillo,santaCruz).
partido(amarillo,laPampa).
partido(amarillo,corrientes).
partido(amarillo,misiones).
partido(amarillo,buenosAires).

provincia(buenosAires,15355000).
provincia(chaco,1143201).
provincia(tierraDelFuego,160720).
provincia(sanLuis,489255).
provincia(neuquen,637913).
provincia(santaFe,3397532).
provincia(cordoba,3567654).
provincia(chubut,577466).
provincia(formosa,527895).
provincia(tucuman,1687305).
provincia(salta,1333365).
provincia(santaCruz,273964).
provincia(laPampa,349299).
provincia(corrientes,992595).
provincia(misiones,1189446).

intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

promete(azul,construir([edilicio(hospital,1000),edilicio(jardines,100),edilicio(escuelas,5)])).
promete(azul,inflacion(2,4)).
promete(amarillo,construir([edilicio(hospital,100),edilicio(universidad,1),edilicio(comisaria,200)])).
promete(amarillo,nuevosPuestosDeTrabajo(10000)).
promete(amarillo,inflacion(1,15)).
promete(rojo,nuevosPuestosDeTrabajo(80000)).
promete(rojo,inflacion(10,30)).

% Funciones Auxiliares

sonCandidatosDeUnaMismaProvincia(UnCandidato,OtroCandidato,UnaProvincia):-
    candidato(UnCandidato,Partido,_),
    candidato(OtroCandidato,OtroPartido,_),
    partido(Partido,UnaProvincia),
    partido(OtroPartido,UnaProvincia).

tieneMayorIntencionDeVotoQue(UnPartido,OtroPartido,UnaProvincia):-
    intencionDeVotoEn(UnaProvincia,UnPartido,UnPorcentaje),
    intencionDeVotoEn(UnaProvincia,OtroPartido,OtroPorcentaje),
    UnPorcentaje > OtroPorcentaje.

esPartidoGanador(UnPartido,UnaProvincia):-
    partido(UnPartido,UnaProvincia),
    forall((partido(OtroPartido,UnaProvincia), OtroPartido \= UnPartido),tieneMayorIntencionDeVotoQue(UnPartido,OtroPartido,UnaProvincia)).
% Por que si pongo OtroPartido \= UnPartido, antes de partido(OtroPartido,UnaProvincia) no me funciona?

esElMasJovenDeSuPartido(UnCandidato, UnPartido, UnaEdad):-
    candidato(UnCandidato,UnPartido,UnaEdad),
    forall((candidato(OtroCandidato,UnPartido,OtraEdad), OtroCandidato \= UnCandidato),UnaEdad < OtraEdad).

ganaEnEsaProvincia(UnPartido,UnaProvincia):-
    partido(UnPartido,UnaProvincia),
    forall((candidato(_,OtroPartido,_), OtroPartido \= UnPartido) ,tieneMayorIntencionDeVotoQue(UnPartido,OtroPartido,UnaProvincia)).


% Punto 2

esPicante(UnaProvincia):-
    esProvinciaGrande(UnaProvincia),
    partido(UnPartido,UnaProvincia),
    partido(OtroPartido,UnaProvincia),
    UnPartido \= OtroPartido.


esProvinciaGrande(UnaProvincia):-
    provincia(UnaProvincia,Habitantes),
    Habitantes > 1000000.

% Punto 3

leGanaA(UnCandidato,OtroCandidato,UnaProvincia):-
    sonCandidatosDeUnaMismaProvincia(UnCandidato,OtroCandidato,UnaProvincia),
    candidato(UnCandidato,UnPartido,_),
    candidato(OtroCandidato,OtroPartido,_),
    tieneMayorIntencionDeVotoQue(UnPartido,OtroPartido,UnaProvincia).
    
leGanaA(UnCandidato,OtroCandidato,UnaProvincia):-
    candidato(UnCandidato,UnPartido,_),
    partido(UnPartido,UnaProvincia),
    not(sonCandidatosDeUnaMismaProvincia(UnCandidato,OtroCandidato,UnaProvincia)).

leGanaA(UnCandidato,OtroCandidato,UnaProvincia):-
    candidato(UnCandidato,UnPartido,_),
    candidato(OtroCandidato,UnPartido,_),
    partido(UnPartido,UnaProvincia).

% Punto 4

elGranCandidato(UnCandidato):-
    candidato(UnCandidato,UnPartido,UnaEdad),
    forall(partido(UnPartido,UnaProvincia), esPartidoGanador(UnPartido,UnaProvincia)),
    esElMasJovenDeSuPartido(UnCandidato,UnPartido,UnaEdad).

% 1) Porque si consultamos elGranCandidato(QuienEs) , nos devuelve QuienEs = Frank unicamente. 
% 2) Deberíamos realizar una consulta de tipo Existencial, ya podemos conocer quien hace verdadera la consulta.
% 3) La consulta Existencial esta relacionada con el concepto del cuantificador Existencial. 

% Punto 5
ajusteConsultora(UnPartido,UnaProvincia,NuevoPorcentaje):-
    not(ganaEnEsaProvincia(UnPartido,UnaProvincia)),
    intencionDeVotoEn(UnaProvincia,UnPartido,UnPorcentaje),
    NuevoPorcentaje is UnPorcentaje + 5.

ajusteConsultora(UnPartido,UnaProvincia,NuevoPorcentaje):-
    ganaEnEsaProvincia(UnPartido,UnaProvincia),
    intencionDeVotoEn(UnaProvincia,UnPartido,UnPorcentaje),
    NuevoPorcentaje is UnPorcentaje - 20. 
    
/* Lo que hariamos, es modificar las reglas de intencionDeVotoEn , de la siguiente
intencionDeVotoEn(UnaProvincia, UnPartido, ajusteConsultora(UnPartido,UnaProvincia,NuevoPorcentaje))
*/


% PUNTO 7
% auxiliares

edificiosQueVarianLaIntencionDeVoto(hospital).
edificiosQueVarianLaIntencionDeVoto(jardines).
edificiosQueVarianLaIntencionDeVoto(universidad).
edificiosQueVarianLaIntencionDeVoto(escuelas).
edificiosQueVarianLaIntencionDeVoto(comisaria).

%
influenciaDePromesas(inflacion(Minimo,Maximo),VariacionIntencionDeVotos):-
    VariacionIntencionDeVotos is -((Minimo + Maximo) / 2).

influenciaDePromesas(nuevosPuestosDeTrabajo(UnaCantidad),3):-
    UnaCantidad > 50000.

influenciaDePromesas(construir(UnaListaDeEdilicios),VariacionIntencionDeVotos):-
    findall(UnaVariacion, (member(Edilicio, UnaListaDeEdilicios),pesoEnElElectorado(Edilicio,UnaVariacion)),ListaDeVariaciones),
    sum_list(ListaDeVariaciones, VariacionIntencionDeVotos).

pesoEnElElectorado(edilicio(hospital,_),2).
pesoEnElElectorado(edilicio(jardines,UnaCantidad),UnaVariacion):-
    UnaVariacion is (UnaCantidad / 10).
pesoEnElElectorado(edilicio(escuelas,UnaCantidad),UnaVariacion):-
    UnaVariacion is (UnaCantidad / 10).
pesoEnElElectorado(edilicio(comisaria,200),2).
pesoEnElElectorado(edilicio(universidad,_),0).
pesoEnElElectorado(edilicio(OtroEdificio,_),-1):-
    not(edificiosQueVarianLaIntencionDeVoto(OtroEdificio)).

% Punto 8
promedioDeCrecimiento(UnPartido,SumatoriaDeCrecimientoPorPromesa):-
    promete(UnPartido,_),
    findall(UnPorcentaje,(promete(UnPartido,UnaPromesa),influenciaDePromesas(UnaPromesa,UnPorcentaje)),ListaDePorcentajes),
    sum_list(ListaDePorcentajes,SumatoriaDeCrecimientoPorPromesa).