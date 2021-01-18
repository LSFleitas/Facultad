https://docs.google.com/document/d/1_840MR7MK7HPGmkRJ34c6jOD_Yr-BxDZ-L4n8x8E9DA/edit?usp=sharing


Respuesta consigna a)
Los conceptos que facilitan esta implementacion son herencia y polimorfismo.
Como existe polimorfismo entre HojitaBlock y EstampillaConmemorativa, puedo aplicar
el concepto de herencia lo cual me evita repetir codigo.

Respuesta consigna b)
Antes de dar la respuesta, aclaro que en la forma que defini el codigo de la clase HojitaBlock,
no se van a poder repetir estampillas que la compongan ya que lo trabaje desde el punto
de vista de conjuntos.
Siguiendo con la consigna, la consecuencia será que al igual que cualquier tipo de estampilla,
es decir, si hay mas de 10 personas que posean esa estampilla al menos una vez, no importa cuantas,
va a ser comun. Que una estampilla sea comun o no depende de las personas que la contengan en su
coleccion, no de si forma parte o no de una o varias HojitasBlock.

Respuesta consigna c)

En el caso de que una HojitaBlock cuente como una sola estampilla, se agrega a la coleccion
de cualquier persona como cualquier otra estampilla de otro tipo.
Codigo:
const lucas = new Miembro(coleccion=#{Argentina,Rusia})
Argentina ya está definida, Rusia tambien.

En el caso de que Rusia cuente como la cantidad de estampillas que la componen, bastaria con
hacer un forEach en Rusia, en la que para cada estampilla que la compone, esta se agregue
a la coleccion de la persona.