import Foundation

class Networking {
    static func loadData() async throws -> [Quote]{
      
        guard let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category=happiness")else { fatalError("Invalid URL") }
        // set api key
        var request = URLRequest(url: url)
        request.setValue("get api key from api-ninjas.com", forHTTPHeaderField: "X-Api-Key")
        // receive the data
        let (data, _) = try await URLSession.shared.data(for: request)
        // decode JSON
        let quote = try JSONDecoder().decode([Quote].self, from: data)
        return quote
    }
    
}
