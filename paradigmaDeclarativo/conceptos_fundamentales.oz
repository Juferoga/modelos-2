Mozart Compiler 1.3.1 (20040617) playing Oz 3
%Calculadora
declare
V=9999*9999
{Browse V}
% --------------------
declare
V=99990*99990
{Browse V}
%---------------------
%Factorial
declare
    fun {Fact N}
	 if N==0 then 1 else N*{Fact N-1} end
    end

{Browse {Fact 10}}

{Browse {Fact 100}}
% -------------------- 
%Combinatorio
declare
      fun {Comb N R}
	 {Fact N} div ({Fact R}*{Fact N-R})
       end

{Browse {Comb 10 3}}
% --------------------
%Listas
declare
	H=1
	T = [2 3 4 5]
	{Browse H|T}
% -------------------- 
declare 
   H=5
   T= [ 1 2 3 4]
   {Browse H | T}
% -------------------- 
declare
   L = [5 6 7 8]
   {Browse L.1}
   {Browse L.2}
% -------------------- 
declare
   L= [1 2 3 4]
   case L of H|T then {Browse H} {Browse T} end
% -------------------- 
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


C={NewCell 0}
fun {Pascal N}
     
   C := @C + 1
   {Browse @C}
   if N==1 then [1]
   else
      {AddList
       {ShiftLeft {Pascal N-1}}
       {ShiftRight {Pascal N-1}}}
   end
end


{Browse {Pascal 10}}
% --------------------
{Browse {Pascal 10}}
% -------------------- 
{Browse {Pascal 20}}
% -------------------- 
{Browse {Pascal 30}}
% -------------------- 
%Triang. Pascal mejorado
declare T FastPascal
T = {NewCell 0}
fun {FastPascal N}
   T := @T+1
   {Browse @T}
   if N==1 then [1]
   else
       	local L in
	   L={FastPascal N-1}
	   {AddList {ShiftLeft L} {ShiftRight L}}
	end
   end
%   {Browse @T}
end
{Browse {FastPascal 20}}
% -------------------- 
%Funciones perezosas
declare
fun lazy {Ints N}
   N|{Ints N+1}
end

declare 
   L = {Ints 0}
   {Browse L}
   case L of A|B|C|_ then {Browse A+B+C} end

   {Browse L.2}
% -------------------- 
   {Browse L.2.1}
% --------------------
   {Browse L.2.2}
% -------------------- 
   {Browse L.1}
% -------------------- 
   {Browse L.2}
%--------------------
   {Browse L.2.2}

% ------------------
%Calculos por demanda
declare
fun lazy {PascalList Row}
   Row | {PascalList 
          {AddList 
		{ShiftLeft Row}
		{ShiftRight Row}}}
end
% -------------------- 
declare
fun lazy {PascalList Row}
   Row | {PascalList 
          {AddList 
		{ShiftLeft Row}
		{ShiftRight Row}}}
end
% -------------------- 
declare
fun lazy {PascalList Row}
   Row | {PascalList 
          {AddList 
		{ShiftLeft Row}
		{ShiftRight Row}}}
end
% -------------------- 
declare
L = {PascalList [1]}
{Browse L}
{Browse L.1}
{Browse L.2.1}
% -------------------- 
L = {PascalList [1]}
{Browse L}
% -------------------- 
{Browse L.1}
% -------------------- 
{Browse L.2.1}
% -------------------- 
declare 
   L = {Ints 0}
% -------------------- 
{Browse L.2.1}
% -------------------- 
{Browse L.2.2}
% -------------------- 
{Browse L.2}
% -------------------- 
{Browse L.2.2}
% -------------------- 
{Browse L.2}
% -------------------- 
declare
L = {PascalList [1]}
% -------------------- 
{Browse L.2.1}
% -------------------- 
{Browse L}
% -------------------- 
%Otro Pascal, fila siguiente a...
declare
fun lazy {PascalList2 N Row}
   if N==1 then [Row]
      else
	Row | {PascalList2 N-1 
        {AddList   {ShiftLeft Row}
		   {ShiftRight Row}}}
	end
end
% -------------------- 
{Browse {PascalList2 10 [1]}}
% -------------------- 
{Browse {PascalList2 11 [1]}}
declare R
R =  {PascalList2 11 [1]}
{Browse R.2.2}
% -------------------- 
thread
   P in
   P = {FastPascal 21}
   {Browse P}
end
{Browse 99*99}
% -------------------- accepted
%Estado con celdas
declare
C = {NewCell 0}
{Assign C {Access C}+1}
{Browse {Access C}}
% -------------------- 
declare C FastPascal
C = {NewCell 0}
fun {FastPascal N}
        C:= @C + 1
%	{Assign C {Access C}+1}
	{GenericPascal Add N}
end
{Browse {FastPascal 12}}
{Browse @C}
%----------------------
%Programacion de alto orden
declare
fun {Xor X Y} 
	if X==Y then 0 else 1 end
end

% -------------------- 
declare Xor GenericPascal
fun {Xor X Y} if X==Y then 0 else 1 end end

fun {GenericPascal Op N}
   if N==1 then [1]
   else L in L = {GenericPascal Op N-1}
      {OpList  Op {ShiftLeft L} {ShiftRight L}}
   end
end
fun {OpList Op L1 L2} 
	case L1 of H1|T1 then
		case L2 of H2|T2 then
	 	      {Op H1 H2}|{OpList Op T1 T2}
		end
      	else nil end
end

declare Add Xor
fun {Add N1 N2} N1+N2 end
declare
fun {Xor X Y} 
	if X==Y then 0 else 1 end
end

fun {FastPascal N} {GenericPascal Add N} end
fun {ParidadPascal N} 
	{GenericPascal Xor N} 
end

% --------------------
declare 
C = {NewCell 0}
declare
fun {FastPascal N}
	{Assign C {Access C}+1}
	{GenericPascal Add N}
end
Declared variables:
  C: cell
Declared variables:
  FastPascal: procedure/2
% -------------------- 
{Browse {Access C}}
% -------------------- 
declare
fun {FastPascal N}
	{Assign C {Access C}+1}
	{GenericPascal Add N}
end
% -------------------- 
declare C N
C = {NewCell 0}
declare
fun {FastPascal N}
	{Assign C {Access C}+1}
	{GenericPascal Add N}
end
% -------------------- 
thread
   P in
   P = {FastPascal 21}
   {Browse P}
end
{Browse 99*99}
% -------------------- 
thread
R in
R={FastPascal 10}
{Browse {Access C}}
end

%******************** binding analysis warning ******************
%**
%** local variable R used only once
%**
%** in file "f:/CLASES_UD/CURSOS ESPECIALES/UNAB/Sesi�n I/Code.oz", line 193, column 0
% -------------------- accepted
thread
R in
R={FastPascal 10}
{Browse {Access C}}
end

% --------------------
%Objetos
declare
local C in
   C = {NewCell 0}
   fun {Increm}
      {Assign C {Access C}+1}
      {Access C}
   end
end

declare
fun {FastPascal N}
	{Browse {Increm}}
	{GenericPascal Add N}
end

thread
R in
R={FastPascal 10}
end
% -------------------- 
thread
R in
R={FastPascal 20}
end

% -------------------- 
%Clases
declare
fun {NuevoContador}
   	local C Increm Leer in
      	C = {NewCell 0}
     	 	fun {Increm}
      		{Assign C {Access C}+1}
      		{Access C}
      	end
            fun {Leer}
                       {Access C}
            end
           contador(increm:Increm leer:Leer)
   	end
end
% -------------------- accepted
declare
fun {NuevoContador}
   	local C Increm Leer in
      	C = {NewCell 0}
     	 	fun {Increm}
      		{Assign C {Access C}+1}
      		{Access C}
      	end
            fun {Leer}
                       {Access C}
            end
           contador(increm:Increm leer:Leer)
   	end
end
% -------------------- 
declare
	Ctr1={NuevoContador}
	Ctr2={NuevoContador}
	{Browse {Ctr1.increm}}
	{Browse {Ctr2.increm}}
% -------------------- accepted
%Sugar syntactic
local X Y T Z in
   X = 5
   Y = 10
   T = (X>=Y)
   if T then Z = X else Z = Y end
   {Browse Z}end
%%%%%%
local X Y Z in
   X = 5
   Y = 10
   if X>=Y then Z = X else Z = Y end
   {Browse Z}end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Scope lexic or static
local X in 
   X = 1
   local X in
      X=2
      {Browse X} 
   end
   {Browse X}
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%extern references
local Y Max2 in
	Y=10
   proc {Max2  X  ?Z}
      if X >= Y then Z = X else Z = Y end
   end
   local Y=15 Z in
         {Browse {Max2 5}}
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%dynamic scoping vs. static scoping
local P Q in
proc {Q X} {Browse estat(X)} end
proc {P X} {Q X} end
local Q in
	proc {Q X} {Browse din(X)} end
%	{Q cualquiercosa}
	{P ver}
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%dataflow behavior
local X Y Z in 
	X=10
	if X>=Y then Z=X else Z=Y end
end
%%%%%%%%%
local X Y Z in 
   thread
      X=10
      if X>=Y then Z=X else Z=Y end
      {Browse Z}
   end
   thread
      Y=15
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
