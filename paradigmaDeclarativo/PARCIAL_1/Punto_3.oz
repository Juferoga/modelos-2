%% Codigo fuente 1

declare
fun {Suma1 Xs A}
    case Xs
    of X|Xr then
        {Suma1 Xr A+X}
        [] nil then A
    end
end
{Browse {Suma1 [21 41 61 81] 11}}

%% Codigo fuente 2

declare Suma2 A
A={NewCell 1}
fun {Suma2 Xs}
    case Xs
    of X|Xr then
        A:=@A+X
        {Suma2 Xr}
        [] nil then @A
    end
end

{Browse {Suma2 [21 41 61 81]}}