//
//  Service.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

protocol ServiceProtocol {
    var dataTask: URLSessionDataTask? { get set }
    func getConsoles(onSuccess: @escaping([Console]) -> Void, onError: @escaping(Error) -> Void)
}

class Service: ServiceProtocol {
    var dataTask: URLSessionDataTask?
    
    func getConsoles(onSuccess: @escaping([Console]) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/2af698da-78b1-4504-8931-b5e90ee5207a") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code.. \(response.statusCode)")
                }
                
                do {
                    let consolesResponse = try JSONDecoder().decode(ConsolesResponse.self, from: data ?? Data())
                    var feedConsole: [Console] = []
                    
                    for console in consolesResponse.consoles {
                        var feedJogos: [Game] = []
                        
                        for jogos in console.games {
                            feedJogos.append(Game(
                                name: jogos.name,
                                image: jogos.image,
                                youtubeLink: jogos.youtubeLink,
                                description: jogos.description))
                        }
                        
                        let feedConsoleInstance = Console(
                                name: console.name,
                                description: console.description,
                                image: console.image,
                                games: feedJogos)
                        feedConsole.append(feedConsoleInstance)
                    }
                    onSuccess(feedConsole)
                } catch {
                    onError(error)
                    print("DEBUG: Erro ao decodificar CONSOLES \(error.localizedDescription)")
                }
            }
        })
        dataTask?.resume()
    }
}
