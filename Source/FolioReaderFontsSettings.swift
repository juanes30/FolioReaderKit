//
//  FolioReaderFontsSettings.swift
//  AEXML
//
//  Created by Juan Londoño Tabares on 14/06/20.
//

import UIKit

public enum GlobalFonts: Int {
    case andada = 0
    case lato
    case lora
    case raleway
    case roboto
    case robotoBold
    case robotoMedium
    case robotoBlack
    
    public static func font(fontName: GlobalFonts, size: CGFloat) -> UIFont {
        switch fontName {
        case .roboto:
            return UIFont.init(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
        case .robotoBold:
            return UIFont.init(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
        case .robotoMedium:
            return UIFont.init(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
        case .robotoMedium:
            return UIFont.init(name: "Roboto-Black", size: size) ?? UIFont.systemFont(ofSize: size)
        default:
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    public var cssIdentifier: String {
        switch self {
        case .andada: return "andada"
        case .lato: return "lato"
        case .lora: return "lora"
        case .raleway: return "raleway"
        case .roboto: return "roboto"
        case .robotoBold: return "robotoBold"
        case .robotoMedium: return "robotoMedium"
        case .robotoBlack: return "robotoBlack"
        }
    }
}

class FolioReaderFontsSettings: UIViewController{
    private var containerView = UIView()
    private var titleLabel: UILabel!
    private var fontSizeLabel: UILabel!
    private var backButton: FloatingActionButton!
    private var smallFontButton: UIButton!
    
    fileprivate var readerConfig: FolioReaderConfig
    fileprivate var folioReader: FolioReader
    
    init(folioReader: FolioReader, readerConfig: FolioReaderConfig){
        self.folioReader = folioReader
        self.readerConfig = readerConfig
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContainerView()
        self.configureBackButton()
        self.configureTitleLabel()
        self.configureFontSizeLabel()
        self.configureFontSmallButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.containerView.frame = self.view.bounds
    }
    
    // MARK: Layout
    func configureContainerView(){
        self.containerView = UIView()
        self.containerView.backgroundColor = .white
        self.preferredContentSize = CGSize.init(width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(self.containerView)
        
        let leftConstraint = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: self.containerView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0)
        let topConstraint = NSLayoutConstraint(item: self.containerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let botConstraint = NSLayoutConstraint(item: self.containerView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        view.addConstraints([leftConstraint, rightConstraint, topConstraint, botConstraint])
    }
    
    func configureBackButton(){
        let bounds = CGRect(x: 10, y: 20, width: 40, height: 40)
        let backIcon = UIImage(readerImageNamed: "back-icon")
        backButton = FloatingActionButton()
        backButton.buttonColor = .white
        backButton.frame = bounds
        backButton.setImage(backIcon, for: .normal)
        backButton.addTarget(self, action: #selector(closeReader(_:)), for: .touchUpInside)
        self.containerView.addSubview(backButton)
    }
    
    func configureTitleLabel() {
        self.titleLabel = UILabel()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.font = GlobalFonts.font(fontName: .robotoBold, size: 22)
        self.titleLabel.text = "Settings"
        
        self.containerView.addSubview(self.titleLabel)
        
        let leftConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .left, relatedBy: .equal, toItem: containerView, attribute: .left, multiplier: 1.0, constant: 20)
        let rightConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1.0, constant: -20)
        let topConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.backButton, attribute: .bottom, multiplier: 1, constant: 32)
        
        self.containerView.addConstraints([leftConstraint, rightConstraint, topConstraint])
    }
    
    func configureFontSizeLabel() {
        self.fontSizeLabel = UILabel()
        self.fontSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.fontSizeLabel.font = GlobalFonts.font(fontName: .roboto, size: 15)
        self.fontSizeLabel.text = "Font size"
        
        self.containerView.addSubview(self.fontSizeLabel)
        
        let leftConstraint = NSLayoutConstraint(item: self.fontSizeLabel, attribute: .left, relatedBy: .equal, toItem: containerView, attribute: .left, multiplier: 1.0, constant: 20)
        let rightConstraint = NSLayoutConstraint(item: self.fontSizeLabel, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1.0, constant: -20)
        let topConstraint = NSLayoutConstraint(item: self.fontSizeLabel, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 32)
        
        self.containerView.addConstraints([leftConstraint, rightConstraint, topConstraint])
    }
    
    func configureFontSmallButton() {
        self.smallFontButton = UIButton()
        self.smallFontButton.translatesAutoresizingMaskIntoConstraints = false
        self.smallFontButton.backgroundColor = UIColor.red
        self.smallFontButton.setTitle("AAAaAAAAAAAAAAAAAAAAAAA", for: .normal)
        self.containerView.addSubview(self.smallFontButton)
        
        let leftConstraint = NSLayoutConstraint(item: self.smallFontButton, attribute: .leadingMargin, relatedBy: .greaterThanOrEqual, toItem: self.fontSizeLabel, attribute: .leading, multiplier: 1.0, constant: 50)
        let rightConstraint = NSLayoutConstraint(item: self.smallFontButton, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1.0, constant: -20)
        let topConstraint = NSLayoutConstraint(item: self.smallFontButton, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 32)
        
        self.containerView.addConstraints([leftConstraint, rightConstraint, topConstraint])
    }
    
    func configureFontLargeButton(){
        
    }
    
    @objc func closeReader(_ sender: UIBarButtonItem) {
        dismiss()
    }
}
