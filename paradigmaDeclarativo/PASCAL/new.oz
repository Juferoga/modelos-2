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

declare
local C in
    C={NewCell 0}
    fun {increm}
        {Assign C {Access C}+1}
        {Access C}
    end
end

fun {Pascal N}

   {Browse {increm}}
   if N==1 then [1]
   else
      {AddList
       {ShiftLeft {Pascal N-1}}
       {ShiftRight {Pascal N-1}}}
   end
end

{Browse {Pascal 10}}