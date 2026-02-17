//
//  ImageData.swift
//  DemoiOSInterview
//
//  Created by Thakur, Sandeep (external - Service) on 17/01/26.
//


struct ImageData : Codable, Identifiable {
    let id: String
    let title: String
    let language: String
    let mediaType: Int
    let coverageURL: String
    let publishedAt: String
    let publishedBy: String
    let description: String
    let seoSlugWithId: String
    let thumbnail: Thumbnail
    let backupDetails: BackupDetails
    
}

struct Thumbnail : Codable {
    let id: String
    let version: Double
    let domain: String
    let basePath: String
    let key: String
    let aspectRatio: Double
    let qualities: [Int]
    
}

struct BackupDetails : Codable {
    let pdfLink: String
    let screenshotURL: String
}

