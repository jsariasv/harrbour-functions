/* Función para validar rut chileno, recibe 1 parametro obligatorio No. RUT 99.999.999-X
   los otros 3 parametros son para mi aplicacion que estoy trabajando asi que lo pueden
   adaptar a sus requerimientos, en su origen fue hecho para Harbour Minigui.
   Se utilizó el algoritmo "Modulo 11" para su codificación, ver mas en :
   https://es.m.wikipedia.org/wiki/Rol_%C3%9Anico_Tributario
*/

function validarut(cDato1,cDato2,cDato3,cDato4)
local nRu,nDato,nDiez,nResta,nOnce,cValor,Prueba
nDato:=0
cValor=space(01)
nRu:=subst(cDato1,1,2)+substr(cDato1,4,3)+substr(cDato1,8,3)
for i=1 to 8
   if i=1
      nDato:=nDato+(val(substr(nRu,8,1))*2)
    elseif i=2
      nDato:=nDato+(val(substr(nRu,7,1))*3)
    elseif i=3
      nDato:=nDato+(val(substr(nRu,6,1))*4)
    elseif i=4
      nDato:=nDato+(val(substr(nRu,5,1))*5)
    elseif i=5
      nDato:=nDato+(val(substr(nRu,4,1))*6)
    elseif i=6
      nDato:=nDato+(val(substr(nRu,3,1))*7)
    elseif i=7
      nDato:=nDato+(val(substr(nRu,2,1))*2)
    elseif i=8
      nDato:=nDato+(val(substr(nRu,1,1))*3)
   endif
next
nDiez:=INT(nDato/11)
nResta:=nDato-(11*nDiez)
nOnce:=11-nResta
if nOnce=11
   cValor:="0"
 elseif nOnce=10
   cValor:="K"
 else
   cValor:=ltrim(str(nOnce))
endif
nRu:=substr(cDato1,12,1)
if nRu=cValor
   Grabadato(cDato1,cDato2,cDato3,cDato4)
 else
   msgbox("RUT ingresado es incorrecto, verifique " , "Atencion")
   In_Datos.txtRut.SetFocus
endif
return
