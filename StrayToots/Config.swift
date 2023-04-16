//
//  Config.swift
//  StrayToots
//
//  Created by Joel Sereno on 4/15/23.
//

import Foundation

func getAccessToken() -> String {
    guard let configURL = Bundle.main.url(forResource: "Tokens", withExtension: "plist"), // check for plist file
          let configDictionary = NSDictionary(contentsOf: configURL),                     // check dictionary?
          let accessToken = configDictionary["access_token"] as? String else {            // check for actual token
        print("error")
        return ""
    }
    return accessToken
}

func getClientSecret() -> String {
    guard let configURL = Bundle.main.url(forResource: "Tokens", withExtension: "plist"), // check for plist file
          let configDictionary = NSDictionary(contentsOf: configURL),                     // check dictionary?
          let clientSecret = configDictionary["client_secret"] as? String else {            // check for actual token
        print("error")
        return ""
    }
    return clientSecret
}

func getClientID() -> String {
    guard let configURL = Bundle.main.url(forResource: "Tokens", withExtension: "plist"), // check for plist file
          let configDictionary = NSDictionary(contentsOf: configURL),                     // check dictionary?
          let clientID = configDictionary["client_id"] as? String else {            // check for actual token
        print("error")
        return ""
    }
    return clientID
}

func getRedirectURI() -> String {
    guard let configURL = Bundle.main.url(forResource: "Tokens", withExtension: "plist"), // check for plist file
          let configDictionary = NSDictionary(contentsOf: configURL),                     // check dictionary?
          let redirectURI = configDictionary["redirect_uri"] as? String else {            // check for actual token
        print("error")
        return ""
    }
    return redirectURI
}
