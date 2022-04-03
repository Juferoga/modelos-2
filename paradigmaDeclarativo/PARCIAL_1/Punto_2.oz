declare
fun {Estudiante}
   Nombre = {NewCell 0}
   Id = {NewCell 0}
   proc {EscNombre A}
      Nombre:=A
      {Browse 'Escribo nombre'#@Nombre}
   end
   fun {LeerNombre}
      @Nombre
   end
   proc {EscId I}
      Id:=I
      {Browse 'Escribo Id'#@Id}
   end
   fun {LeerId}
      @Id
   end
in
   estudiante(leerId:LeerId escId:EscId escN:EscNombre leerN:LeerNombre)
end


{Browse Estudiante}

{Browse EscNombre JUAN}

{leerNombre yo}
{leeerId 1}
