//
//  FilterCell.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 18/01/2021.
//

import UIKit

final class FilterCell: UITableViewCell {

    static let reuseIdentifier = String(describing: FilterCell.self)
    
    @IBOutlet private var cellContainer: UIView!
    @IBOutlet private var prefixLabel: UILabel!
    @IBOutlet private var moduleContainer: UIView!
    @IBOutlet private var moduleLabel: UILabel!
    @IBOutlet private var switchControl: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundCell()
        roundModuleContainer()
    }
    
    func setup(with level: IteoLoggerLevel, selected: Bool) {

        let levelPrefix = level.icon
        let levelBackgroundColor = level.color
        let levelLabelColor = level.color.brightness > 0.5 ? UIColor.black : UIColor.white
        let levelName = level.rawValue

        prefixLabel.text = levelPrefix
        moduleContainer.backgroundColor = levelBackgroundColor
        moduleLabel.textColor = levelLabelColor
        moduleLabel.text = levelName
        switchControl.tintColor = .systemOrange
        switchControl.set(offTint: .tertiarySystemBackground)
        
        switchControl.isOn = selected
    }
    
    func setup(with module: IteoLoggerModule, selected: Bool) {

        let modulePrefix = module.prefix
        let moduleBackgroundColor = module.backgroundColor
        let moduleLabelColor = module.labelColor
        let moduleName = module.name

        contentView.backgroundColor = .systemBackground
        cellContainer.backgroundColor = .secondarySystemBackground
        prefixLabel.textColor = .label

        prefixLabel.text = modulePrefix
        moduleContainer.backgroundColor = moduleBackgroundColor
        moduleLabel.textColor = moduleLabelColor
        moduleLabel.text = moduleName
    
        switchControl.isOn = selected
    }
    
}

private extension FilterCell {
   
    private func roundCell() {
        roundLayer(cellContainer.layer)
    }
    
    private func roundModuleContainer() {
        roundLayer(moduleContainer.layer)
    }
    
    private func roundLayer(_ layer: CALayer) {
        layer.masksToBounds = true
        layer.cornerRadius = 4
    }
    
}

private extension IteoLoggerLevel {
    
    var color: UIColor {
        switch self {
        case .error:
            return UIColor(hue: 0.00, saturation: 1.00, brightness: 1.0, alpha: 1.0)
        case .warning:
            return UIColor(hue: 0.13, saturation: 1.00, brightness: 1.0, alpha: 1.0)
        case .success:
            return UIColor(hue: 0.38, saturation: 0.25, brightness: 1.0, alpha: 1.0)
        case .info:
            return UIColor(hue: 0.61, saturation: 0.25, brightness: 1.0, alpha: 1.0)
        }
    }
    
}

private extension IteoLoggerModule {
    
    var backgroundColor: UIColor {
        let hash = name.hash
        srand48(hash)
        let r = CGFloat(drand48())
        let g = CGFloat(drand48())
        let b = CGFloat(drand48())
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    var labelColor: UIColor {
        return backgroundColor.brightness > 0.5 ? UIColor.black : UIColor.white
    }
    
}


private extension UIColor {
    var brightness: CGFloat {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: nil)
        return 0.2126 * r + 0.7152 * g + 0.0722 * b
    }
}


private extension UISwitch {
    func set(offTint color: UIColor ) {
        let minSide = min(bounds.size.height, bounds.size.width)
        layer.cornerRadius = minSide / 2
        backgroundColor = color
        tintColor = color
    }
}
