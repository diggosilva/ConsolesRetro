//
//  Service.swift
//  ConsolesRetro
//
//  Created by Diggo Silva on 21/05/24.
//

import Foundation

protocol ServiceProtocol {
    var dataTask: URLSessionDataTask? { get set }
    func getConsoles(onSuccess: @escaping([FeedConsole]) -> Void, onError: @escaping(Error) -> Void)
}

class Service: ServiceProtocol {
    var dataTask: URLSessionDataTask?
    
    func getConsoles(onSuccess: @escaping([FeedConsole]) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/0be56a07-3561-43f2-8758-39b6274c240e") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code.. \(response.statusCode)")
                }
                
                do {
                    let consolesResponse = try JSONDecoder().decode(ConsolesResponse.self, from: data ?? Data())
                    var feedConsole: [FeedConsole] = []
                    
                    for console in consolesResponse.consoles {
                        var feedJogos: [Game] = []
                        
                        for jogos in console.games {
                            feedJogos.append(Game(
                                name: jogos.name,
                                image: jogos.image,
                                youtubeLink: jogos.youtubeLink,
                                description: jogos.description))
                        }
                        
                        let feedConsoleInstance = FeedConsole(consoles: [Console(name: console.name, image: console.image, games: feedJogos)])
                        feedConsole.append(feedConsoleInstance)
                    }
                    onSuccess(feedConsole)
                    print("DEBUG: Imagens dos CONSOLES.. \(feedConsole)")
                } catch {
                    onError(error)
                    print("DEBUG: Erro ao decodificar CONSOLES \(error.localizedDescription)")
                }
            }
        })
        dataTask?.resume()
    }
}
