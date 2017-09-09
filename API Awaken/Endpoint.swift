//
//  Endpoint.swift
//  API Awaken
//
//  Created by Rohit Devnani on 9/9/17.
//  Copyright © 2017 Rohit Devnani. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var pageNumberQueryItem: URLQueryItem { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = [pageNumberQueryItem]
        
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum SWAPI {
    case characters(page: Int)
    case vehicles(page: Int)
    case starships(page: Int)
}

extension SWAPI: Endpoint {
    var base: String {
        return "http://swapi.co"
    }
    
    var path: String {
        switch self {
        case .characters: return "/api/people"
        case .vehicles: return "/api/vehicles"
        case .starships: return "/api/starships"
        }
    }
    
    var pageNumberQueryItem: URLQueryItem {
        // FIXME: - I don't want to handle it this way.
        switch self {
        case .characters(let page), .starships(let page), .vehicles(let page):
            return URLQueryItem(name: "page", value: "\(page)")
        }
    }
    
    static func pageWith(url: String) -> URLRequest {
        let url = URL(string: url)!
        return URLRequest(url: url)
    }
}
