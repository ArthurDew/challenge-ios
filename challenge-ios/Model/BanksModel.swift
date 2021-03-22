//
//  BanksModel.swift
//  challenge-ios
//
//  Created by Arthur de Wurstemberger on 21/03/2021.
//

import Foundation

// MARK: - Group
struct Group: Decodable {
    let resources: [Resource]
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Decodable {
    let previous_uri: String?
    let next_uri: String
}

// MARK: - Resource
struct Resource: Decodable {
    let country_code: String?
    let parent_banks: [ParentBank]
}

// MARK: - ParentBank
struct ParentBank: Decodable {
    let name: String
    let logo_url: String?
    let banks: [Bank]
    let is_highlighted: Bool
    let display_order: Int
}

// MARK: - Bank
struct Bank: Decodable {
    let id: Int
    let resource_uri: String
    let resource_type: String
    let name: String
    let country_code: String
    let automatic_refresh: Bool
    let primary_color, secondary_color: String?
    let logo_url: String
    let deeplink_ios, deeplink_android: String?
    let transfer_enabled, payment_enabled: Bool
    let form: [Form]
    let authentication_type: String
    let parent_name: String?
    let capabilities: [String]
    let url: String?
    let payment, transfer: Payment?
}

// MARK: - Form
struct Form: Decodable {
    let label: String
    let type: String
    let isNum: String
    let max_length: Int?
}

// MARK: - Payment
struct Payment: Decodable {
    let nb_max_transactions, max_size_label: Int
}
