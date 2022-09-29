//
//  User.swift
//  RandomUsers
//
//  Created by MAC on 01/09/22.
//

import Foundation

//Crear una estructura de respuesta que contenga una matriz de usuarios.


struct Response: Decodable {
  let users: [User]
    
    // Declarando una enumeración que se adapte con CodingKey
    enum CodingKeys: String, CodingKey {
       case users = "results"
     }

}

//Debido a que cualquier estructura personalizada utilizada dentro de Response también debe ajustarse a Decodable, deberá tener el usuario y el nombre de conformidad con Decodable.
struct User : Decodable, Identifiable {
    var id:String
  //let id: String
    //En el JSON, el título, el nombre y el apellido están incrustados en una propiedad con la clave "nombre".
  let name: Name
    
  let picture: Picture
    
    //Será útil tener una propiedad fullName que combine las propiedades individuales de Name en una sola cadena para mostrarla a los usuarios de la aplicación.
    
    var fullName: String {
        name.title + ". " + name.first + " " + name.last
      }
    
    //Crear un inicializador personalizado para decodificar el JSON utilizando las nuevas enumeraciones.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
          name = try values.decode(Name.self, forKey: .name)
        picture = try values.decode(Picture.self, forKey: .picture)
        
        let loginInfo = try values.nestedContainer(keyedBy: LoginInfoCodingKeys.self,
                                                     forKey: .login)
          id = try loginInfo.decode(String.self, forKey: .uuid)    }
    
    enum CodingKeys: String, CodingKey {
        case login
        case name
        case picture
      }
    //Agregando una enumeración para decodificar el uuit
    
    enum LoginInfoCodingKeys: String, CodingKey {
        case uuid
      }
}

struct Name: Decodable {
  let title: String
  let first: String
  let last: String
}

//Por ejemplo, el usuario tiene una propiedad id que no coincide con el JSON. Afortunadamente, podemos usar CodingKeys para encontrar el ID apropiado en el JSON e inicializar la propiedad id nosotros mismos.

struct Picture: Decodable {
  let large: String
  let medium: String
  let thumbnail: String
}
