# ITBASAURUS REX
* DISU
    * Mauro Baez - @mauritobaez
    * Mauro Vella - @maurovella
    * Gonzalo Martone - @ImNotGone

* Documento de Identidad Sanitaria Único
El objetivo es acortar los tiempos de espera a la hora de entregar los datos personales en el hospital y la historia clínica al médico que lo va a atender. Además, en caso de que el paciente no pueda comunicarse con las autoridades de salúd (por ejemplo, después de un siniestro vial), estos podrían simplemente registrar la tarjeta para conseguir datos pertinentes a la situación como por ejemplo el tipo de sangre del paciente.  
Para esto, necesitamos información básica del paciente en una tarjeta con tecnología NDK, pero aparte un par de keys para acceder a la historia clínica la cual se encuentra en un sistema IPFS, el cual está resguardado ya que está encriptado y se desencripta justamente con las keys que se encuentran en la tarjeta.
Utilizamos Solidity para manejar la subida de datos, además del acceso a los mismos ya que dicho lenguaje tiene gran control para este tipo de cosas.
