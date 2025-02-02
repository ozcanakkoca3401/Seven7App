//
//  CoreLocalize.swift
//  
//
//  Created by Ozcan Akkoca on 7.01.2024.
//

import Foundation

public struct CoreLocalize {
    public struct General {
        public static var Info: String {
            return NSLocalizedString("general_info", bundle: .module, comment: "General")
        }
        
        public static var Error: String {
            return NSLocalizedString("general_error", bundle: .module, comment: "General")
        }
        
        public static var ErrorTitle: String {
            return NSLocalizedString("general_error_title", bundle: .module, comment: "General")
        }
        
        public static var OkButton: String {
            return NSLocalizedString("general_ok_button", bundle: .module, comment: "General")
        }
        
        public static var ExitButton: String {
            return NSLocalizedString("general_exit_button", bundle: .module, comment: "General")
        }
        
        public static var YesButton: String {
            return NSLocalizedString("general_yes_button", bundle: .module, comment: "General")
        }
        
        public static var NoButton: String {
            return NSLocalizedString("general_no_button", bundle: .module, comment: "General")
        }
        
        public static var AssistantExitConfirmation: String {
            return NSLocalizedString("general_assistant_exit_confirmation", bundle: .module, comment: "General")
        }
    }
    
    public struct Home {
        public static var Title: String { return NSLocalizedString("home_title", bundle: .module, comment: "Home") }
        public static var Name: String { return NSLocalizedString("home_name", bundle: .module, comment: "Home") }
        public static var Company: String { return NSLocalizedString("home_company", bundle: .module, comment: "Home") }
        public static var City: String { return NSLocalizedString("home_city", bundle: .module, comment: "Home") }
        public static var Email: String { return NSLocalizedString("home_email", bundle: .module, comment: "Home") }
    }
}
