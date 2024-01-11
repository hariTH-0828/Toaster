import UIKit
import SnapKit

enum actions {
    case success
    case failure
}

class Toast: UIStackView {
    
    let stateLabel: UILabel = {
        let stateLabel = UILabel()
        stateLabel.numberOfLines = 0
        stateLabel.font = .boldSystemFont(ofSize: 18.0)
        stateLabel.textAlignment = .center
        stateLabel.textColor = .white
        return stateLabel
    }()
    
    let stateIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI() {
        self.axis = .horizontal
        self.distribution = .fillProportionally
        self.alignment = .leading
        self.backgroundColor = .black
        self.layer.cornerRadius = 20
        self.layer.opacity = 0
    
        self.addArrangedSubview(stateIcon)
        stateIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(28)
        }
        self.addArrangedSubview(stateLabel)
        stateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(_ viewController: UIViewController, action: actions) {
        setupConstraint(on: viewController)
        switch action {
        case .success:
            configureForSuccess()
        case .failure:
            configureForFailure()
        }
        
    }
    
    private func configureForSuccess() {
        self.layer.opacity = 1.0
        stateLabel.text = "success"
        stateIcon.tintColor = .systemGreen
        if #available(iOS 13.0, *) {
            stateIcon.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            fatalError("iOS Version is too low...Need iOS 13.0 to run this")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hide()
        }
    }
    
    private func configureForFailure() {
        self.layer.opacity = 1.0
        stateLabel.text = "failed"
        stateIcon.tintColor = .systemRed
        if #available(iOS 13.0, *) {
            stateIcon.image = UIImage(systemName: "xmark.circle.fill")
        } else {
            fatalError("iOS Version is too low...Need iOS 13.0 to run this")
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.hide()
        }
    }
    
    private func hide() {
        UIView.animate(withDuration: 1.0, animations: {
            self.layer.opacity = 0.0
        })
    }
    
    private func setupConstraint(on viewController: UIViewController) {
        viewController.view.addSubview(self)
        snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
    }
}
