declare GenericPascal ShifLeft ShiftRight OpList

fun {ShifLeft L}
    case L
    of H|T then
        H|{ShifLeft T}
    else [0]
    end
end

fun {ShiftRight L}
    0|L
end

fun {OpList Op L1 L2}
    case L1
    of H1|T1 then
        case L2
        of H2|T2 then
            {Op H1 H2} | {OpList Op T1 T2}
        end
    else nil end
end

fun {GenericPascal Op N}
   if N==1 then [1]
   else L in L = {GenericPascal Op N-1}
      {OpList  Op {ShiftLeft L} {ShiftRight L}}
   end
end

declare Diff
fun {Diff X Y} 
    X-Y
end

% declare
% for I in 1..7 do
%     {Browse {GenericPascal Diff I}}
% end

fun {Mul1 X Y}
    (X+1)*(Y+1)
end

fun {MegaPascal N}
    {GenericPascal Mul1 N}
end

{Browse {MegaPascal 7}}