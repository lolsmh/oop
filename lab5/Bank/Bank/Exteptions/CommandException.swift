//
//  CommandError.swift
//  Bank
//
//  Created by Даниил Апальков on 03.12.2020.
//

import Foundation

enum CommandException: Error {
    case isNotImplemented(massage: String = "Command is not implemented")
}
