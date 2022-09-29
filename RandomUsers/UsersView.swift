//
//  ContentView.swift
//  RandomUsers
//
//  Created by MAC on 01/09/22.
//

import SwiftUI

struct UsersView: View {
    
    // Comience por instanciar una propiedad userData y asignarla a una nueva instancia de UserData.
    //Declara userData con el modificador @StateObject, ya que debería actualizar la interfaz de usuario si los usuarios cambian.
    @StateObject var userData = UserData()

    var body: some View {
        // Cambiemos el ScrollView a una lista para mostrar una lista de usuarios. Además, eliminemos el VStack y el texto, ya que solo eran necesarios para mostrar los datos sin procesar JSON String anteriores.
      NavigationView {
              /*VStack {
                Text("Raw JSON Data:")
                  //Para mostrar los datos JSON
                ScrollView {
                  Text(userData.users)
                }
              }
              .padding()
              .navigationTitle("Random Users")*/
          List(userData.users) { user in
              
              HStack {
                        AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                          image.clipShape(Circle())
                        } placeholder: {
                          Image(systemName: "person")
                          .frame(width: 50, height: 50, alignment: .center)
                        }
                  
                  Text(user.fullName)
                }
          }
                .navigationTitle("Random Users")
      }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
