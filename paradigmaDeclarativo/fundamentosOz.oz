% simple
{Browse 99*99}

% declarar variables
declare
V=9999*9999
{Browse V*V}

% declarar funciones
declare
 fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
 end

 % ejecutar funciones
{Browse {Fact 10}}

 % declarar funciones anidadas
declare
 fun {Comb N R}
   {Fact N}div({Fact R}*{Fact N-R})
 end
 
% ejecutar funciones
{Browse {Comb 10 3}}

% Declarar listas
declare
H=1
T=[2 3 4 5]
{Browse H|T}

% Tomar item de lista
declare
L=[5 6 7 8]

% Primer item
{Browse L.1}
% Segundo item
{Browse L.2.1}
% Tercer item
{Browse L.2.2.1}
% Cuarto item
{Browse L.2.2.2.1}

% Comparación de Patrones -> saber cabeza y cola
% se utiliza en alguno de los programas futuros :)
declare
L=[1 2 3 4]
case L of H|T then {Browse H}{Browse T} end



% Funciones sobre listas
% (Triangulo de pascal)
% Triangulo Pascal
declare  AddList ShifLeft ShifRight Pascal C 

fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else [0]
   end
end

fun {ShiftRight L}  0|L end

fun {AddList L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
	 H1+H2|{AddList T1 T2}
      end
   else nil end
end


fun {Pascal N}
     
 %  C := @C + 1
  % {Browse @C}
   if N==1 then [1]
   else
      {AddList
       {ShiftLeft {Pascal N-1}}
       {ShiftRight {Pascal N-1}}}
   end
end

{Browse {Pascal 10}}