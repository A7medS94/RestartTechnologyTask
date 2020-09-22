//
//  HomeContentDTO.swift
//  RestartTechnologyTask
//
//  Created by Ahmed Samir on 9/22/20.
//  Copyright © 2020 Ahmed Samir. All rights reserved.
//

import Foundation

// MARK: - HomeContentDTO
struct HomeContentDTO: Codable {
    let status_code: Int?
    let message: String?
    let data: HomeContentData?
}

// MARK: - HomeContentData
struct HomeContentData: Codable {
    let attractions: [Attraction]?
    let events: [Event]?
    let hot_spots: [HotSpot]?
}

// MARK: - Attraction
struct Attraction: Codable {
    let id: Int?
    let name: String?
    let is_active: Int?
    let description, lat, lng, arabic_name: String?
    let working_hours: [WorkingHour]?
    let photos: [String]?
    let profile_photo: String?
    let categories: [AttractionCategory]?
    let features: [Feature]?
    let offers: [Offer]?
    let tryps_id: String?
    let markup: Int?
    let duration, duration_unit, general_terms, terms: String?
    let exlcude: String?
    let city: City?
}

// MARK: - AttractionCategory
struct AttractionCategory: Codable {
    let id: Int?
    let name: String?
    let ar_name: String?
    let icon_image_url, cover_image_url: String?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Feature
struct Feature: Codable {
    let id: Int?
    let name: String?
    let arabic_name: String?
}

// MARK: - Offer
struct Offer: Codable {
    let id, quantity: Int?
    let is_valid, offer_type, discount_type: Int?
    let code: String?
    let discount_value: Int?
    let number_of_times: Int?
}

// MARK: - WorkingHour
struct WorkingHour: Codable {
    let id: Int?
    let from, to: String?
}

// MARK: - Event
struct Event: Codable {
    let id: Int?
    let name: String?
    let description, short_description: String?
    let city_id: Int?
    let address: String?
    let views: Int?
    let start_date: String?
    let end_date, price_per_day, whole_price, ticket_price: String?
    let video_preview: String?
    let city: City?
    let categories: [AttractionCategory]?
    let features: [Feature]?
}

// MARK: - HotSpot
struct HotSpot: Codable {
    let id: Int?
    let name: String?
    let description, short_description, price_of_two, arabic_name: String?
    let cityID, neighborhood: CityID?
    let address, lat, lng: String?
    let views: Int?
    let photos: [String]?
    let profile_photo: String?
    let city: City?
    let categories: [HotSpotCategory]?
    let features: [Feature]?
    let cuisineTypes: [CuisineType]?
    let video: String?
    let menus: [String]?
}

// MARK: - HotSpotCategory
struct HotSpotCategory: Codable {
    let id: Int?
    let name: String?
    let order: Int?
}

// MARK: - CityID
struct CityID: Codable {
    let id: Int?
    let name: String?
    let created_at, updated_at: String?
    let city_id: Int?
}

// MARK: - CuisineType
struct CuisineType: Codable {
    let id: Int?
    let name: String?
}
