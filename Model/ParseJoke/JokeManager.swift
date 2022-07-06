//
//  JokeManager.swift
//  Alias
//
//  Created by Таня on 26.05.2022.
//

import Foundation

protocol JokeManagerDelegate {
    func updateJoke(jokeModel: JokeModel)
}

struct JokeManager {
    
    var jokeUrl = "https://joke.deno.dev/"
    var delegate: JokeManagerDelegate?
    
    func getUrl() {
       let url = jokeUrl
        perfomRequiest(urlString: url)
    }
    
    func perfomRequiest (urlString: String) {
        
       if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data, response, error in
               if error != nil {
                   print(error)
                   return
               }
               
               if let safeData = data {
                   if let parseData = parseJson(safeData) {
                       delegate?.updateJoke( jokeModel: parseData)
                   }
               }
           }
           task.resume()
        }
    }
    
    func parseJson(_ data: Data) -> JokeModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(JokeData.self, from: data)
            let setUpId = decodeData.setup
            let punchlineId = decodeData.punchline
            let jokeModel = JokeModel(joke: setUpId, response: punchlineId)
            return jokeModel
        }
        catch {
            print(error)
            return nil
        }
    }
    
}
