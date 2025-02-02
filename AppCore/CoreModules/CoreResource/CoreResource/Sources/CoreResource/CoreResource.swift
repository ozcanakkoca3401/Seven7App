import UIKit

public struct CoreResource {
    public private(set) var text = "Hello, World!"
    public let color: UIColor? = UIColor(named: "midnightBlue")
    public let localizeText = CoreLocalize.General.Info
    public let playIcon: UIImage? = UIImage(named: "play", in: .module, with: nil)

    
    public init() {
    }
}


