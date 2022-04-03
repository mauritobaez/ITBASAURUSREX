## ITBASAURUS REX
* DISU
    * Mauro Baez - @mauritobaez
    * Mauro Vella - @maurovella
    * Gonzalo Martone - @ImNotGone

# ¿Para qué sirve?
DISU es el Documento de Identidad Sanitaria Unico que deberian tener todas las personas en su bolsillo.
Este documento es una tarjeta que cuenta con un código NFC, que da acceso al historial clínico y las recetas médicas del paciente. De esta forma ambos paciente y doctor, escaneando la tarjeta mismo con el celular pueden acceder a toda esta información en cuestión de un click.
Este desarrollo da la oportunidad de por ejemplo en un caso de emergencia en que el paciente es atendido en una ambulancia y necesitan saber el tipo de sangre para una transfusión, o si el paciente tiene alergias a cierta medicación, se pueden ganar varios minutos críticos. Esta información será la primera en aparecer cuando un médico escanee el documento.

# ¿Cómo funciona?
La información se registra de forma ordenada en la nube con InterPlanetary File System (IPFS) , y con un contrato de solidity se maneja la subida de datos, y el encriptado y desencriptado de los datos sensibles.
El parche NFC en la tarjeta tiene espacio para guardar el Nombre, Apellido, fecha de nacimiento del paciente, y además se puede guardar el tipo de sangre y las alergias más importantes en formato básico. También se encuentran en el parche las llaves Pública y Privada que conectan con el BlockChain y buscan la información a IPFS.
Solidity se utiliza para manejar la subida de datos, además del acceso a los mismos ya que dicho lenguaje tiene gran control para este tipo de cosas.
