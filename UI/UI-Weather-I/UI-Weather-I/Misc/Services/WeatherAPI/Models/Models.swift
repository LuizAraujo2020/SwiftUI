import Foundation

// MARK: - Weather
struct Weather: Codable, Equatable {
    
    let queryCost: Int
    let latitude: Double
    let longitude: Double
    let resolvedAddress: String
    let address: String
    let timezone: String
    let tzoffset: Int
    let description: String
    let days: [CurrentConditions]
    let alerts: [JSONAny]
    let stations: [String: Station]
    let currentConditions: CurrentConditions
    
//    var wrapper = Wrapper()
//    var wrapperHeader = WrapperHeader()
    static let empty = Weather.init(queryCost: 0, latitude: 0, longitude: 0, resolvedAddress: "", address: "", timezone: "", tzoffset: 0, description: "", days: [], alerts: [], stations: [:], currentConditions: CurrentConditions.init(datetime: "", datetimeEpoch: 0.0, temp: 0.0, feelslike: 0.0, humidity: 0.0, dew: 0.0, precip: 0.0, precipprob: 0.0, snow: 0, snowdepth: 0, preciptype: [], windgust: 0.0, windspeed: 0.0, winddir: 0.0, pressure: 0.0, visibility: 0.0, cloudcover: 0.0, solarradiation: 0.0, solarenergy: 0.0, uvindex: 0, conditions: Conditions.clear, icon: .clearDay, stations: [], source: .comb, sunrise: "", sunriseEpoch: 0, sunset: "", sunsetEpoch: 0, moonphase: 0.0, tempmax: 0.0, tempmin: 0.0, feelslikemax: 0.0, feelslikemin: 0.0, precipcover: 0.0, severerisk: 0, description: "", hours: []))

    enum CodingKeys: String, CodingKey {
        case queryCost = "queryCost"
        case latitude = "latitude"
        case longitude = "longitude"
        case resolvedAddress = "resolvedAddress"
        case address = "address"
        case timezone = "timezone"
        case tzoffset = "tzoffset"
        case description = "description"
        case days = "days"
        case alerts = "alerts"
        case stations = "stations"
        case currentConditions = "currentConditions"
    }
    
    static func == (lhs: Weather, rhs: Weather) -> Bool {
        lhs.latitude == rhs.latitude &&
        lhs.longitude == rhs.longitude &&
        lhs.address == rhs.address
    }
}

import Foundation

// MARK: - CurrentConditions
struct CurrentConditions: Codable, Equatable {
    let datetime: String
    let datetimeEpoch: Double
    let temp: Double
    let feelslike: Double
    let humidity: Double
    let dew: Double
    let precip: Double
    let precipprob: Double
    let snow: Int
    let snowdepth: Int
    let preciptype: [Icon]?
    let windgust: Double?
    let windspeed: Double
    let winddir: Double
    let pressure: Double
    let visibility: Double
    let cloudcover: Double
    let solarradiation: Double
    let solarenergy: Double?
    let uvindex: Int
    let conditions: Conditions?
    let icon: Icon?
    let stations: [ID]?
    let source: Source?
    let sunrise: String?
    let sunriseEpoch: Int?
    let sunset: String?
    let sunsetEpoch: Int?
    let moonphase: Double?
    let tempmax: Double?
    let tempmin: Double?
    let feelslikemax: Double?
    let feelslikemin: Double?
    let precipcover: Double?
    let severerisk: Int?
    let description: String?
    let hours: [CurrentConditions]?

    enum CodingKeys: String, CodingKey {
        case datetime = "datetime"
        case datetimeEpoch = "datetimeEpoch"
        case temp = "temp"
        case feelslike = "feelslike"
        case humidity = "humidity"
        case dew = "dew"
        case precip = "precip"
        case precipprob = "precipprob"
        case snow = "snow"
        case snowdepth = "snowdepth"
        case preciptype = "preciptype"
        case windgust = "windgust"
        case windspeed = "windspeed"
        case winddir = "winddir"
        case pressure = "pressure"
        case visibility = "visibility"
        case cloudcover = "cloudcover"
        case solarradiation = "solarradiation"
        case solarenergy = "solarenergy"
        case uvindex = "uvindex"
        case conditions = "conditions"
        case icon = "icon"
        case stations = "stations"
        case source = "source"
        case sunrise = "sunrise"
        case sunriseEpoch = "sunriseEpoch"
        case sunset = "sunset"
        case sunsetEpoch = "sunsetEpoch"
        case moonphase = "moonphase"
        case tempmax = "tempmax"
        case tempmin = "tempmin"
        case feelslikemax = "feelslikemax"
        case feelslikemin = "feelslikemin"
        case precipcover = "precipcover"
        case severerisk = "severerisk"
        case description = "description"
        case hours = "hours"
    }
}

// Conditions.swift

import Foundation

enum Conditions: String, Codable, Equatable {
    case clear = "Clear"
    case overcast = "Overcast"
    case partiallyCloudy = "Partially cloudy"
    case rain = "Rain"
    case rainOvercast = "Rain, Overcast"
    case rainPartiallyCloudy = "Rain, Partially cloudy"
}

// Icon.swift

import Foundation

enum Icon: String, Codable, Equatable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case rain = "rain"
}

// Source.swift

import Foundation

enum Source: String, Codable, Equatable {
    case comb = "comb"
    case fcst = "fcst"
    case obs = "obs"
}

// ID.swift

import Foundation

enum ID: String, Codable, Equatable {
    case f5253 = "F5253"
    case remote = "remote"
    case sbbr = "SBBR"
}

// Station.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let station = try? newJSONDecoder().decode(Station.self, from: jsonData)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Station
struct Station: Codable, Equatable {
    let distance: Int
    let latitude: Double
    let longitude: Double
    let useCount: Int
    let id: ID?
    let name: String
    let quality: Int
    let contribution: Int

    enum CodingKeys: String, CodingKey {
        case distance = "distance"
        case latitude = "latitude"
        case longitude = "longitude"
        case useCount = "useCount"
        case id = "id"
        case name = "name"
        case quality = "quality"
        case contribution = "contribution"
    }
}

// JSONSchemaSupport.swift

import Foundation

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

// stdout

@propertyWrapper public struct NilOnFail<T: Codable>: Codable {
    
    public let wrappedValue: T?
    public init(from decoder: Decoder) throws {
        wrappedValue = try? T(from: decoder)
    }
    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}
