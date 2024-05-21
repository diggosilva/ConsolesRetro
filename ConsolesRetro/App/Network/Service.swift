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
        guard let url = URL(string: "https://run.mocky.io/v3/8159b31d-2bfe-4105-9484-f4e3006660e4") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code.. \(response.statusCode)")
                }
                
                do {
                    let consolesResponse = try JSONDecoder().decode(ConsolesResponse.self, from: data ?? Data())
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
                    
                    feedConsole = feedConsole.sorted { (console1, console2) -> Bool in
                        console1.name.caseInsensitiveCompare(console2.name) == .orderedAscending
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
