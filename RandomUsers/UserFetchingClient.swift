//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by MAC on 01/09/22.
//

import Foundation

//Creando una estructura
//Recuperará datos de usuario aleatorios

struct UserFetchingClient {
    //Propiedad de url estatica
  static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    /*//Añadiendo una función que recupere los datos de usuario aleatorios.
    //Solo se utilizará el valor de datos para DATA
    static func getUsers() async throws -> String { //throws para indicar que puede generar un error
        //La segunda propiedad es _  porque no se necesita el URLResponse
        async let (data, _) = URLSession.shared.data(from: url)
        
       /* //mostrar datos sin procesar como una cadena
        let value = try await String(data: data, encoding: .utf8)! //accediendo con await para verificar que los datos esten presentes antes de continuar, al igual que try marca que puede haber un error.
        */
        
        //Actualizando para devolver la cadena de los usuarios aleatorios agregando -> String
        return try await String(data: data, encoding: .utf8)!
        
    }*/
    
    // Modifiquemos la función para que devuelva una matriz de instancias de usuario utilizando un JSONDecoder para decodificar los datos en una respuesta.
    static func getUsers() async throws -> [User] {
       async let (data, _) = URLSession.shared.data(from: url)
       let response = try await JSONDecoder().decode(Response.self, from: data)
       return response.users
     }
    
}

