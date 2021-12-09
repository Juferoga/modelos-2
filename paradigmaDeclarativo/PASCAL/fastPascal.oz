declare  AddList ShifLeft ShifRight 

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

fun {FastPascal N}
    if N==1 then [1]
    else
        local L in
            L={FastPascal N-1}
            {AddList {ShiftLeft L} {ShiftRight L} }
        end
    end
end

{Browse {FastPascal 30}}