//
//  AuthService.swift
//  testMobileup
//
//  Created by Артем Соловьев on 31.03.2022.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    private let appId = "8122101"
    private let vkSdk: VKSdk
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    weak var delegate: AuthServiceDelegate?
    
    func wakeUpSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .initialized:
                print("init")
                VKSdk.authorize(scope)
            case .authorized:
                print("auth")
                delegate?.authServiceSignIn()
            default:
                delegate?.authServiceSignInDidFail()
                print(error?.localizedDescription as Any)
            }
        }
        
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil{
            delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSignInDidFail()
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }

}
