import Foundation

public final class APIClient {
    private init() {}
    public static let shared = APIClient()
    private let url = URL(string: "http://193.111.125.206:8000/api/arzlar")!
    
    public func getStocks(completion: @escaping (Result<[StockData], Error>) -> Void) {
        let req = URLRequest(url: url)
        URLSession.shared.dataTask(with: req) { data, response, error in
            guard error == nil else { return }
            guard let data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(decodedData.data))
            } catch {
                print(error)
            }
        }.resume()
    }
}
