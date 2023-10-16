import Foundation

class Networking {
    static func loadData() async throws -> [Quote]{
        //  crate a file in bundle "data.txt" and store API Key
        let path = Bundle.main.path(forResource: "data", ofType: "txt")
        var apiKey = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        apiKey = apiKey.trimmingCharacters(in: .whitespaces)
        
        
        guard let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category=happiness")else { fatalError("Invalid URL") }
        // set api key
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        // receive the data
        let (data, _) = try await URLSession.shared.data(for: request)
        // decode JSON
        let quote = try JSONDecoder().decode([Quote].self, from: data)
        return quote
    }
    
}
