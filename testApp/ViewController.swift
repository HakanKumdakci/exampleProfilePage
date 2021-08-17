//
//  ViewController.swift
//  testApp
//
//  Created by Akakce on 17.08.2021.
//

import UIKit



class ViewController: UIViewController {
    
    
    var button: UIButton = {
        var btn = UIButton(type: .system)
        btn.setTitle("Profile", for: .normal)
        btn.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 18
        return btn
    }()
    
    
    
    @objc func editProfile(){
        let vc  = ProfileEditViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width/3 ).isActive = true
        button.heightAnchor.constraint(equalToConstant: view.frame.height/9).isActive = true
        
    }


}

extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
    
        if (size.width != 0){
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if (size.height != 0){
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
