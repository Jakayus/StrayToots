//
//  Config.swift
//  StrayToots
//
//  Created by Joel Sereno on 4/15/23.
//

import Foundation

// STRING MANIPULATION EXTENSIONS

/// Convert HTML to string that can be used in SwiftUI
// TODO: Update this extension or find another method of string output
extension String {
    func htmlToString() -> String {
        guard let data = self.data(using: .utf8) else {
            print("Error: Could not convert string to UTF-8 data.")
            return ""
        }

        do {
            let attributedString = try NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil
            )
            return attributedString.string
        } catch {
            print("Error creating NSAttributedString: \(error)")
            return ""
        }
    }
}

// TODO: Add Unit Tests to verify if these extensions can be used (Both are Stack Overflow recommendations)
extension String {

    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
}



// TOKEN ACCESS FUNCTIONS
// TODO: Make these functions more efficient, perhaps combining some of their aspects

func getAccessToken() -> String {
    guard let configURL = Bundle.main.url(forResource: "Tokens", withExtension: "plist"), // check for plist file
          let configDictionary = NSDictionary(contentsOf: configURL),                     // create dictionary
          let accessToken = configDictionary["access_token"] as? String else {            // attempt to String-ify dictionary value
        print("error")
        return ""
    }
    return accessToken
}

func getClientSecret() -> String {
    guard let configURL = Bundle.main.url(forResource: "Tokens", withExtension: "plist"), // check for plist file
          let configDictionary = NSDictionary(contentsOf: configURL),                     // create dictionary
          let clientSecret = configDictionary["client_secret"] as? String else {          // attempt to String-ify dictionary value
        print("error")
        return ""
    }
    return clientSecret
}

func getClientID() -> String {
    guard let configURL = Bundle.main.url(forResource: "Tokens", withExtension: "plist"), // check for plist file
          let configDictionary = NSDictionary(contentsOf: configURL),                     // create dictionary
          let clientID = configDictionary["client_id"] as? String else {                  // attempt to String-ify dictionary value
        print("error")
        return ""
    }
    return clientID
}

func getRedirectURI() -> String {
    guard let configURL = Bundle.main.url(forResource: "Tokens", withExtension: "plist"), // check for plist file
          let configDictionary = NSDictionary(contentsOf: configURL),                     // create dictionary
          let redirectURI = configDictionary["redirect_uri"] as? String else {            // attempt to String-ify dictionary value
        print("error")
        return ""
    }
    return redirectURI
}



