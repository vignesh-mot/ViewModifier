//
//  File.swift
//  ViewModifier
//
//  Created by Vignesh S on 02/03/23.
//

import Foundation

public class DegpegVideoCallManager {
    
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
