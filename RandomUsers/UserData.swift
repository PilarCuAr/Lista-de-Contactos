//
//  UserData.swift
//  RandomUsers
//
//  Created by MAC on 01/09/22.
//

import Foundation

//Definiendo una clase UserData

//la interfaz de usuario se actualice en el hilo principal añadiendo el atributo MainActor

@MainActor
class UserData: ObservableObject {
    
    //Dado que los usuarios generados al azar son una cadena, asígnela a una cadena vacía.
    //@Published var users: String = ""
    //Cambiando la variable para que sea de tipo [String]
    @Published var users: [User] = []
    
    /*//Agregue un inicializador para UserData que generará usuarios aleatorios. Establezca los usuarios iguales a la llamada a la función getUsers()
    init() {
        Task{
        do {
          let users = try await UserFetchingClient.getUsers()
          self.users = users
        }
        catch {
          print(error)
        }
      }
    }*/
    
    //Para fines organizativos colocamos
    init() {
        Task {
          await loadUsers()
        }
      }
     
      func loadUsers() async {
        do {
          let users = try await UserFetchingClient.getUsers()
            //
          self.users = users
        } catch {
          print(error)
        }
      }
}
