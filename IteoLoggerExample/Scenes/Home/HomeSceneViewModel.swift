//
//  ContentViewModel.swift
//  IteoLoggerExample
//
//  Created by Patryk Średziński on 05/02/2021.
//

import Foundation
import IteoLogger

enum SampleLog:  String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case randomTenLogs
    case randomHundretLogs
    case simple
    case customModule
    case multipleArguments
    case multilineShort
    case multilineLong
    case json
    case dictionary
    case structure
    case object
    case structureList
    case objectList
    case numberArray
    case stringArray
    case dateArray
    case info
    case success
    case warning
    case error
    case networkSuccess
    case networkError
    case databaseSuccess
    case databaseInfo
    case databaseWarning
    case userDefaults
    case keyChain
    case screenView
    case auth
    case background
    case calendar
    case time
    case cache
    case bug
    case security
}

final class HomeSceneViewModel: ObservableObject {
    
    let logger = IteoLogger.default

    func logSample(_ log: SampleLog) {
        switch log {
        case .randomTenLogs:
            for _ in 0..<10 {
                randomLog()
            }
        case .randomHundretLogs:
            for _ in 0..<100 {
                randomLog()
            }
        case .simple:
            logger.log("Simple")
        case .customModule:
            let customModule = IteoLoggerModule("Example Custom Module", prefix: "📐")
            logger.log(.error, customModule, "Simple log in my custom module")
        case .multipleArguments:
            logger.log("Argument #1", 52, 15.215, Date(), shortLorem, person1, personList)
        case .multilineShort:
            logger.log(shortLorem)
        case .multilineLong:
            logger.log(longLorem)
        case .json:
            logger.log(.warning, .networkResponse, sampleJSONString)
        case .dictionary:
            logger.log(.warning,.dataBase, sampleDictionary)
        case .structure:
            logger.log(.error, .settings, person1)
        case .object:
            logger.log(.error, .settings, animal1)
        case .structureList:
            logger.log(.success, .settings, personList)
        case .objectList:
            logger.log(.success, .settings, animalList)
        case .numberArray:
            logger.log(.random, [1.52,2.521,3.12,4,5.65312,6.643,7.128,8.215])
        case .stringArray:
            logger.log(.random, ["Text 1", "Test 2", "Longer text 3"])
        case .dateArray:
            logger.log(.random, [Date(), Date(), Date()])
        case .info:
            logger.log(.info, "Simple info")
        case .success:
            logger.log(.success, "Simple success")
        case .warning:
            logger.log(.warning, "Simple warning")
        case .error:
            logger.log(.error, "Simple error")
        case .networkSuccess:
            logger.log(.success, .network, "Simple networkSuccess")
        case .networkError:
            logger.log(.error, .network, "Simple networkError")
        case .databaseSuccess:
            logger.log(.success, .network, "Simple databaseSuccess")
        case .databaseInfo:
            logger.log(.info, .network, "Simple databaseInfo")
        case .databaseWarning:
            logger.log(.warning, .network, "Simple databaseWarning")
        case .userDefaults:
            logger.log(.userDefaults, "Simple userDefaults")
        case .keyChain:
            logger.log(.keyChain, "Simple keyChain")
        case .screenView:
            logger.log(.screenView, "Simple screenView")
        case .auth:
            logger.log(.auth, "Simple auth")
        case .background:
            logger.log(.background, "Simple background")
        case .calendar:
            logger.log(.calendar, "Simple calendar")
        case .time:
            logger.log(.time, "Simple time", Date())
        case .cache:
            logger.log(.cache, "Simple cache")
        case .bug:
            logger.log(.bug, "Simple bug")
        case .security:
            logger.log(.security, "Simple security")
        }
    }
    
    private func randomLog() {
        let randomLevel = IteoLoggerLevel.allCases.randomElement() ?? .info
        let allModules: [IteoLoggerModule] = [.network, .networkRequest, .networkResponse, .webView, .userDefaults, .keyChain, .dataBase, .screenView, .layout, .auth, .background, .calendar, .time, .cache, .bug, .video, .audio, .random, .todo, .payments, .settings, .map, .security, .notifications, .analytics, .bluetooth, .watch, .keyboard, .widget, .augumentedReality, .games, .graphics, .motion, .push, .unknown]
        let randomModule = allModules.randomElement() ?? .unknown
        logger.log(randomLevel, randomModule, "Randomized Level and Module log - " + shortLorem)
    }
    
    private let shortLorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    private let longLorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tincidunt condimentum purus nec suscipit. Maecenas suscipit arcu sed odio hendrerit elementum. Nunc vel metus eu lorem efficitur egestas. Duis ornare nunc ut orci dictum, varius suscipit sapien rutrum. Phasellus pellentesque egestas odio, non congue tortor tempus a. Morbi accumsan arcu tortor, vitae finibus tellus tempus a. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla scelerisque mi tellus, vel scelerisque purus lacinia sed. Mauris varius molestie libero, vel porttitor massa luctus sit amet. Ut erat dolor, ornare id diam in, maximus semper augue. Maecenas molestie facilisis odio, et fermentum lectus tristique non. Cras purus odio, malesuada et nunc euismod, ullamcorper suscipit nibh. Aenean quis sodales tortor. Donec porttitor id enim eget posuere. Etiam et venenatis quam. Suspendisse in felis ut elit imperdiet fermentum. Mauris tincidunt leo risus. Aenean fringilla neque ipsum, a tincidunt tortor consectetur non. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam viverra lectus ipsum, eget lobortis leo efficitur id. Nam imperdiet scelerisque nulla, rutrum vestibulum ligula bibendum ac. Nam vitae feugiat diam. Vivamus hendrerit, erat non consectetur laoreet, quam elit aliquam ex, in varius est risus id mauris. Integer id rhoncus erat. Aenean convallis risus tellus, in congue quam efficitur et. Nam dignissim, turpis at dictum posuere, nunc lorem vestibulum urna, sed porttitor nibh est mattis velit. Nunc et interdum ex, ut egestas arcu."
    
    private let sampleJSONString = """
    [
      {
        "_id": "601d38a2895faa9836dbf8ed",
        "index": 0,
        "guid": "90c26f7c-86b5-43f7-8945-46baab530ebc",
        "isActive": true,
        "balance": "$3,305.00",
        "picture": "http://placehold.it/32x32",
        "age": 37,
        "eyeColor": "brown",
        "name": {
          "first": "Frederick",
          "last": "Hood"
        },
        "company": "ATGEN",
        "email": "frederick.hood@atgen.net",
        "phone": "+1 (879) 540-2857",
        "address": "985 Jewel Street, Wolcott, Massachusetts, 1487",
        "about": "Dolore minim labore non mollit officia ex sunt dolor irure dolor dolor ullamco. Est aliquip ea ex nulla Lorem culpa elit ex dolore tempor. Id ut cillum duis adipisicing excepteur fugiat ut deserunt.",
        "registered": "Tuesday, November 14, 2017 3:51 PM",
        "latitude": "-9.044841",
        "longitude": "-68.004013",
        "tags": [
          "nisi",
          "esse",
          "cillum",
          "pariatur",
          "et"
        ],
        "range": [
          0,
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9
        ],
        "friends": [
          {
            "id": 0,
            "name": "Noble Calhoun"
          },
          {
            "id": 1,
            "name": "Patrick Rhodes"
          },
          {
            "id": 2,
            "name": "Harvey James"
          }
        ],
        "greeting": "Hello, Frederick! You have 10 unread messages.",
        "favoriteFruit": "banana"
      },
      {
        "_id": "601d38a26a488e841ab78474",
        "index": 1,
        "guid": "cc6d9cb4-b7f0-46b1-ad76-02d820b89491",
        "isActive": true,
        "balance": "$2,485.11",
        "picture": "http://placehold.it/32x32",
        "age": 32,
        "eyeColor": "blue",
        "name": {
          "first": "Carol",
          "last": "Holder"
        },
        "company": "JIMBIES",
        "email": "carol.holder@jimbies.tv",
        "phone": "+1 (802) 409-2647",
        "address": "248 Gerritsen Avenue, Catherine, District Of Columbia, 7596",
        "about": "Sunt est adipisicing pariatur sit. Ut commodo sit elit ullamco tempor exercitation fugiat laborum quis non officia. Magna est eiusmod fugiat sunt. Eiusmod ipsum cillum eu aute et. Laboris anim ullamco sint eu magna.",
        "registered": "Wednesday, June 26, 2019 3:31 AM",
        "latitude": "25.088836",
        "longitude": "114.298403",
        "tags": [
          "qui",
          "anim",
          "ipsum",
          "aute",
          "ad"
        ],
        "range": [
          0,
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9
        ],
        "friends": [
          {
            "id": 0,
            "name": "Herminia Farmer"
          },
          {
            "id": 1,
            "name": "Gregory Walters"
          },
          {
            "id": 2,
            "name": "Sophie Sims"
          }
        ],
        "greeting": "Hello, Carol! You have 6 unread messages.",
        "favoriteFruit": "strawberry"
      },
      {
        "_id": "601d38a2c8a2c61df8e3e7ab",
        "index": 2,
        "guid": "83365de7-c875-4ee2-9514-dca1c6d3d0ec",
        "isActive": true,
        "balance": "$3,820.71",
        "picture": "http://placehold.it/32x32",
        "age": 32,
        "eyeColor": "brown",
        "name": {
          "first": "Barbara",
          "last": "Marquez"
        },
        "company": "SNACKTION",
        "email": "barbara.marquez@snacktion.ca",
        "phone": "+1 (962) 464-3964",
        "address": "771 Hutchinson Court, Bascom, Idaho, 1849",
        "about": "Ad ipsum tempor ipsum nulla consectetur deserunt esse duis pariatur adipisicing consequat ut proident sint. Ea aliquip nisi magna aliquip proident nostrud adipisicing do labore est do. Aliquip incididunt non voluptate ea fugiat Lorem consectetur ipsum quis in aute. Amet sit non velit consectetur ullamco aute Lorem exercitation amet. Commodo ea eiusmod irure ea anim non qui ad. Consequat ullamco officia ut ex. Aliqua ea veniam esse ex ad in amet reprehenderit veniam esse laboris.",
        "registered": "Thursday, May 15, 2014 1:41 PM",
        "latitude": "-41.133741",
        "longitude": "-156.686192",
        "tags": [
          "officia",
          "nisi",
          "commodo",
          "est",
          "consectetur"
        ],
        "range": [
          0,
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9
        ],
        "friends": [
          {
            "id": 0,
            "name": "Brooks May"
          },
          {
            "id": 1,
            "name": "Christensen Maynard"
          },
          {
            "id": 2,
            "name": "Bernice Vasquez"
          }
        ],
        "greeting": "Hello, Barbara! You have 8 unread messages.",
        "favoriteFruit": "strawberry"
      },
      {
        "_id": "601d38a21c755a9f394bd793",
        "index": 3,
        "guid": "4b35d225-5285-49c7-ba18-04563c423e9c",
        "isActive": true,
        "balance": "$1,901.78",
        "picture": "http://placehold.it/32x32",
        "age": 40,
        "eyeColor": "blue",
        "name": {
          "first": "Priscilla",
          "last": "Stephens"
        },
        "company": "XYMONK",
        "email": "priscilla.stephens@xymonk.info",
        "phone": "+1 (866) 487-2745",
        "address": "703 Croton Loop, Flintville, Maine, 8193",
        "about": "Duis enim nisi cupidatat velit. Est labore irure dolore aute. Commodo mollit sunt consectetur do qui ut labore sit in.",
        "registered": "Tuesday, February 18, 2014 8:50 PM",
        "latitude": "89.565043",
        "longitude": "47.552963",
        "tags": [
          "ut",
          "dolor",
          "nostrud",
          "nostrud",
          "ipsum"
        ],
        "range": [
          0,
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9
        ],
        "friends": [
          {
            "id": 0,
            "name": "Kelly Burks"
          },
          {
            "id": 1,
            "name": "Porter Sellers"
          },
          {
            "id": 2,
            "name": "Stout Stone"
          }
        ],
        "greeting": "Hello, Priscilla! You have 8 unread messages.",
        "favoriteFruit": "apple"
      },
      {
        "_id": "601d38a23124162a3bfcf69e",
        "index": 4,
        "guid": "3ab0485c-5aba-4064-a7c4-c1dd4e3e4cc9",
        "isActive": false,
        "balance": "$1,179.60",
        "picture": "http://placehold.it/32x32",
        "age": 20,
        "eyeColor": "blue",
        "name": {
          "first": "Lakisha",
          "last": "Shaffer"
        },
        "company": "BLUPLANET",
        "email": "lakisha.shaffer@bluplanet.com",
        "phone": "+1 (833) 431-3585",
        "address": "547 Lawn Court, Chesapeake, Florida, 7463",
        "about": "Sint aliquip eiusmod dolor adipisicing quis aute qui. Adipisicing aute magna ipsum nostrud cupidatat adipisicing qui duis. Excepteur cillum Lorem exercitation id mollit exercitation consequat occaecat ullamco labore nisi laboris. Magna exercitation elit excepteur id exercitation velit est veniam et.",
        "registered": "Monday, June 4, 2018 11:16 PM",
        "latitude": "-27.774359",
        "longitude": "-92.484905",
        "tags": [
          "sit",
          "culpa",
          "nisi",
          "reprehenderit",
          "sunt"
        ],
        "range": [
          0,
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9
        ],
        "friends": [
          {
            "id": 0,
            "name": "Gutierrez Ross"
          },
          {
            "id": 1,
            "name": "Angelica Lara"
          },
          {
            "id": 2,
            "name": "Campos Bowers"
          }
        ],
        "greeting": "Hello, Lakisha! You have 5 unread messages.",
        "favoriteFruit": "apple"
      }
    ]
    """
    
    private let sampleDictionary: [String: Any] = [
          "_id": "601d38a2895faa9836dbf8ed",
          "index": 0,
          "guid": "90c26f7c-86b5-43f7-8945-46baab530ebc",
          "isActive": true,
          "balance": "$3,305.00",
          "picture": "http://placehold.it/32x32",
          "age": 37,
          "eyeColor": "brown",
          "name": [
            "first": "Frederick",
            "last": "Hood"
          ],
          "company": "ATGEN",
          "email": "frederick.hood@atgen.net",
          "phone": "+1 (879) 540-2857",
          "address": "985 Jewel Street, Wolcott, Massachusetts, 1487",
          "about": "Dolore minim labore non mollit officia ex sunt dolor irure dolor dolor ullamco. Est aliquip ea ex nulla Lorem culpa elit ex dolore tempor. Id ut cillum duis adipisicing excepteur fugiat ut deserunt.",
          "registered": "Tuesday, November 14, 2017 3:51 PM",
          "latitude": "-9.044841",
          "longitude": "-68.004013",
          "tags": [
            "nisi",
            "esse",
            "cillum",
            "pariatur",
            "et"
          ],
          "range": [
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9
          ],
          "greeting": "Hello, Frederick! You have 10 unread messages.",
          "favoriteFruit": "banana"
    ]
    
    private let person1 = Person(firstName: "Patryk", lastName: "Średziński", cars: [
        Car(brand: "Opel", model: "Astra", year: 2016),
        Car(brand: "Toyota", model: "Camry", year: 2020)
    ])
    
    private let person2 = Person(firstName: "Adam", lastName: "Kowalski", cars: [
        Car(brand: "Ford", model: "Mondeo", year: 2005),
    ])
    
    private var personList: [Person] { return [person1, person2] }


    private let animal1 = Animal(name: "Lion", age: 3)
    private let animal2 = Animal(name: "Elephant", age: 6)
    
    private var animalList: [Animal] { return [animal1, animal2] }
}
