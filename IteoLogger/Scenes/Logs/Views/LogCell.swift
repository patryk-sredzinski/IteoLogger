//
//  LogCell.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 18/01/2021.
//

import UIKit

final class LogCell: UITableViewCell {

    static let reuseIdentifier = String(describing: LogCell.self)
    
    @IBOutlet private var cellContainer: UIView!
    @IBOutlet private var levelContainer: UIView!
    @IBOutlet private var prefixLabel: UILabel!
    @IBOutlet private var frameworkContainer: UIView!
    @IBOutlet private var frameworkLabel: UILabel!
    @IBOutlet private var moduleContainer: UIView!
    @IBOutlet private var moduleLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var logLabel: UILabel!
    @IBOutlet private var logIndexLabel: UILabel!
    
    private var longTapAction: SimpleAction?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDoubleTapGesture()
        roundCell()
        roundModuleContainer()
        configureColors()
    }
    
    func setup(with item: IteoLoggerItem, longTapAction: SimpleAction?, isExpanded: Bool) {
        
        let indexValue = "#\(item.index)"
        let levelColor = item.level.color
        let modulePrefix = item.module.prefix
        let frameworkBackgroundColor = item.framework.backgroundColor
        let frameworkLabelColor = item.framework.labelColor
        let frameworkName = item.framework
        let moduleBackgroundColor = item.module.backgroundColor
        let moduleLabelColor = item.module.labelColor
        let moduleName = item.module.name
        let dateString = DateFormatManager.shared.string(from: item.date, format: .fullDate)
        let logString = item.output
                
        logIndexLabel.text = indexValue
        levelContainer.backgroundColor = levelColor
        prefixLabel.text = modulePrefix
        frameworkContainer.backgroundColor = frameworkBackgroundColor
        frameworkLabel.textColor = frameworkLabelColor
        frameworkLabel.text = frameworkName
        moduleContainer.backgroundColor = moduleBackgroundColor
        moduleLabel.textColor = moduleLabelColor
        moduleLabel.text = moduleName
        dateLabel.text = dateString
        logLabel.text = logString
        logLabel.numberOfLines = isExpanded ? 0 : 3
        self.longTapAction = longTapAction
    }

}

private extension LogCell {
    
    private func setupDoubleTapGesture() {
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction))
        self.contentView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func longPressGestureAction() {
        longTapAction?()
    }
    
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
    
    private func configureColors() {
        contentView.backgroundColor = .systemBackground
        cellContainer.backgroundColor = .secondarySystemBackground
        logIndexLabel.textColor = .tertiarySystemBackground
        logLabel.textColor = .label
        prefixLabel.textColor = .label
        dateLabel.textColor = .label
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

extension String {
    
    var backgroundColor: UIColor {
        let hash = hash
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
