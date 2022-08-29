import Alamofire
import Foundation

public class APIManager {
	
	public static let shared: APIManager = APIManager()
    
    private init() {}
	
	public func fetch<T: Decodable>(url: String, method: String, parameters: [String:String]? = nil, handler: @escaping (T?)->()) {
		
		AF.request(
			url,
			method: HTTPMethod(rawValue: method),
			parameters: parameters,
			encoder: JSONParameterEncoder.default
		).response { response in
			switch response.result {
			case .success(_):
				let decoder = JSONDecoder()
				if let data = response.data {
					let result = try? decoder.decode(T.self, from: data)
					handler(result)
				}
				break
			case .failure(_):
				debugPrint(response.data ?? "")
				break
			}
		}
	}
	
}
