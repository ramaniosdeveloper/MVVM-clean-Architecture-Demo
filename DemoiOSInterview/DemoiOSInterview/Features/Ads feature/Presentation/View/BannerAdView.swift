//
//  BannerAdView.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 01/02/26.
//


import SwiftUI
import GoogleMobileAds
import UIKit

struct BannerAdView: UIViewRepresentable {

    func makeUIView(context: Context) -> BannerView {
        let banner = BannerView(adSize: AdSizeBanner)
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716" // TEST
        banner.rootViewController = context.coordinator.viewController
        banner.load(Request())
        return banner
    }

    func updateUIView(_ uiView: BannerView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    final class Coordinator {
        let viewController = UIViewController()
    }
}


