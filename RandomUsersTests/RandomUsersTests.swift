//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by MAC on 01/09/22.
//

/*import XCTest
@testable import RandomUsers

class RandomUsersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
*/

//Cambiando estas pruebas personalizandolo

import XCTest
@testable import RandomUsers

class RandomUsersTests: XCTestCase {
    
    //Cree una función. Al lado de la función, cree una variable jsonData que recupere los datos de muestra utilizando la función getTestJSONData().

    func testUserModel() throws {
        let jsonData = getTestJSONData()
     
        do {
         _ = try JSONDecoder().decode(Response.self, from: jsonData)
            
            //En lugar de decodificar en la estructura de Response, intente decodificar en la estructura de User.

            /*_ = try JSONDecoder().decode(User.self, from: jsonData) */
        }
        catch {
          XCTFail("Failed to decode JSON into the model: \(error)")
        }
      }
    
    
  private func getTestJSONData() -> Data {
    guard let path = Bundle.main.path(forResource: "randomUsers",
                                      ofType: "json") else {
      fatalError("randomUsers.json file not found")
    }
    let internalURL = URL(fileURLWithPath: path)
    return try! Data(contentsOf: internalURL)
  }
}

//Creando una función para probar que la decodificación de los datos de muestra en una respuesta funciona correctamente.
