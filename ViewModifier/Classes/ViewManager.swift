//
//  ViewManager.swift
//  ViewModifier
//
//  Created by Vignesh S on 04/03/23.
//

import Foundation

public class ViewManager {
    
    public static func getVideoCallView(
        host: String,
        appId: String,
        secretKey: String) -> UIViewController {

        let vc = VideoCallWebViewController()
        vc.model = VideoCallModel(
            host: host,
            appId: appId,
            secretKey: secretKey)
        return vc
    }

}
