import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    // MARK: Published Variables -
    @Published var apiError: String?
    @Published var allCountriesData = [CountryDetails]()
    
    // MARK: Shared Variables -
    var cancellables = Set<AnyCancellable>()
    
    // MARK: deinit -
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}

extension HomeViewModel {
    
    func getCountriesDetailsRequest() {
        
        let requestParams = APIRequestParams(
            endpoint: .allCountries,
            methodType: .get,
            contentType: .json,
            params: [:]
        )
        
        RemoteRequestManager.shared.dataTask(
            type: AllCountriesData.self,
            requestParams: requestParams
        )
        .sink { [weak self] result in
            switch result {
            case .failure(let error):
                switch error {
                case .errorMessage(let errMsg):
                    self?.apiError = errMsg // <-- Capture error message here
                default:
                    self?.apiError = "An unknown error occurred." // <-- Handle other errors
                    break
                }
            default: break
            }
        } receiveValue: { [weak self] resp in
            self?.allCountriesData = resp
        }
        .store(in: &cancellables)
    }
}
