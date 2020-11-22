//
//  Authentication.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation
import UIKit
import Firebase


class EmailViewController: UIViewController {

  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!

    func Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            // [START_EXCLUDE]
            strongSelf.hideSpinner {
              if let error = error {
                let authError = error as NSError
                if (authError.code == AuthErrorCode.secondFactorRequired.rawValue) {
                  // The user is a multi-factor user. Second factor challenge is required.
                  let resolver = authError.userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
                  var displayNameString = ""
                  for tmpFactorInfo in (resolver.hints) {
                    displayNameString += tmpFactorInfo.displayName ?? ""
                    displayNameString += " "
                  }
                  self!.showTextInputPrompt(withMessage: "Select factor to sign in\n\(displayNameString)", completionBlock: { userPressedOK, displayName in
                    var selectedHint: PhoneMultiFactorInfo?
                    for tmpFactorInfo in resolver.hints {
                      if (displayName == tmpFactorInfo.displayName) {
                        selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
                      }
                    }
                    PhoneAuthProvider.provider().verifyPhoneNumber(with: selectedHint!, uiDelegate: nil, multiFactorSession: resolver.session) { verificationID, error in
                      if error != nil {
                        print("Multi factor start sign in failed. Error: \(error.debugDescription)")
                      } else {
                        self!.showTextInputPrompt(withMessage: "Verification code for \(selectedHint?.displayName ?? "")", completionBlock: { userPressedOK, verificationCode in
                          let credential: PhoneAuthCredential? = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: verificationCode!)
                          let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator.assertion(with: credential!)
                          resolver.resolveSignIn(with: assertion!) { authResult, error in
                            if error != nil {
                              print("Multi factor finanlize sign in failed. Error: \(error.debugDescription)")
                            } else {
                              strongSelf.navigationController?.popViewController(animated: true)
                            }
                          }
                        })
                      }
                    }
                  })
                } else {
                  strongSelf.showMessagePrompt(error.localizedDescription)
                  return
                }
              }
              strongSelf.navigationController?.popViewController(animated: true)
            }
            // [END_EXCLUDE]
          }
          // [END headless_email_auth]
        }
    

