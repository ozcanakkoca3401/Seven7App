//
//  CoreImages.swift
//  
//
//  Created by Ozcan Akkoca on 7.01.2024.
//

import UIKit

public struct CoreImages {
    public struct General {
        public static var Checked: UIImage { .load(named: "general_checked") }
        public static var UnChecked: UIImage { .load(named: "general_un_checked") }
    }
    
    public struct LiveSupport {
        public static var MessageItemIcon: UIImage { .load(named: "live_support_item_icon") }
    }
}



