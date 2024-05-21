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
        guard let url = URL(string: "https://run.mocky.io/v3/d3abb408-31b1-45ef-a59c-6c26bb682048") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Status Code.. \(response.statusCode)")
            }
            
            if let data = data {
                do {
                    let consolesResponse = try JSONDecoder().decode(ConsolesResponse.self, from: data)
                    var feedConsole: [FeedConsole] = []
                    
                    for console in consolesResponse.consoles {
                        var feedJogos: [Jogo] = []
                        
                        for jogos in console.jogos {
                            feedJogos.append(Jogo(
                                name: jogos.name,
                                image: jogos.image,
                                youtubeLink: jogos.youtubeLink,
                                description: jogos.description))
                        }
                        
                        let feedConsoleInstance = FeedConsole(name: console.name, image: console.image, jogos: feedJogos)
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
    }
}
