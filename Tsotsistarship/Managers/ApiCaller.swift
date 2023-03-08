//
//  ApiCaller.swift
//  Tsotsistarship
//
//  Created by Lesego Mogorosi on 2023/03/07.
//

import Foundation

enum APIError: Error {
    case failedToGetData
}


class ApiCaller {
    
 static let shared = ApiCaller()
 
    
    func getWeatherData(completion: @escaping  (Result<WeatherResponse, Error>) ->Void ){
        
        guard let url = URL(string: "https://run.mocky.io/v3/1fd068d7-cbb2-4ceb-b697-da7fcc1c520b") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_, error in
            
            guard let data = data , error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(WeatherResponse.self,from: data)
                completion(.success(results))
                print(results)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
