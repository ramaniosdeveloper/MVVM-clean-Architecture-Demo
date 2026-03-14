//
//  UIApplication+TopViewController.swift.swift
//  DemoiOSInterview
//
//  Created by Raman kumar on 01/02/26.
//

import UIKit

extension UIApplication {
    var topViewController: UIViewController? {
        guard let scene = connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return nil
        }
        return window.rootViewController
    }
}
