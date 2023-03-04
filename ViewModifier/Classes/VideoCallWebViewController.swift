//
//  VideoCallWebViewController.swift
//  ViewModifier
//
//  Created by Vignesh S on 04/03/23.
//

import UIKit
import WebKit

struct VideoCallModel {
    var host: String?
    var appId: String?
    var callId: String?
    var secretKey: String?
}

class VideoCallWebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    var webView: WKWebView?
    var model: VideoCallModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let webView = WKWebView(
            frame: self.view.bounds,
            configuration: getWKWebViewConfiguration())
        webView.uiDelegate = self
        self.view.addSubview(webView)
        self.webView = webView
        generateURL()
    }

    func getWKWebViewConfiguration() -> WKWebViewConfiguration {
        let userController = WKUserContentController()
        userController.add(self, name: "closeSdkMessageHandler")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userController
        configuration.allowsInlineMediaPlayback = true
        return configuration
    }

}

extension VideoCallWebViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        self.dismiss(animated: true)
    }
}

extension VideoCallWebViewController {
    private func generateURL() {
        guard let host = model?.host, let appId = model?.appId, let secretKey = model?.secretKey else { return }

        if let callId = model?.callId {
            loadURL(urlString: "https://admin.degpeg.com/onetoone/createcall/?host=\(host)&session=\(callId.toBase64())&publickey=\(secretKey)&appid=\(appId)")
        } else {
            loadURL(urlString: "https://admin.degpeg.com/onetoone/createcall/?host=\(host)&publickey=\(secretKey)&appid=\(appId)")
        }
    }

    private func loadURL(urlString: String) {
        var filteredURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: filteredURL ?? "") else {
            return
        }
        webView?.load(URLRequest(url: url))
        webView?.allowsBackForwardNavigationGestures = true
    }
}

extension String {
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}

