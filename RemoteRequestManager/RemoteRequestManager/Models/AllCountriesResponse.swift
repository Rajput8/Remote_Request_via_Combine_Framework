import Foundation

// MARK: CountryDetails -
struct CountryDetails: Codable {
    let flags: Flag?
    let name: Name?
}

// MARK: Flag -
struct Flag: Codable {
    let png: String?
}

// MARK: Name -
struct Name: Codable {
    let common, official: String?
}

typealias AllCountriesData = [CountryDetails]
