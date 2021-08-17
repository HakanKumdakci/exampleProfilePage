//
//  ProfileEditViewController.swift
//  testApp
//
//  Created by Akakce on 17.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileEditViewController: UIViewController, UIScrollViewDelegate {
    
    let disposeBag = DisposeBag()
    
    let info: BehaviorRelay<[String]> = BehaviorRelay(value: [
        "NULL","NAME", "Daenerys", "ABOUT ME", "Hello, World!"
    ])
    
    
    var tableView: UITableView = {
        var table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.separatorStyle = .none
        return table
    }()
    
    
    @objc func edit(){
        print()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)

        self.title = "Edit Profile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.edit))

        
        view.backgroundColor = .systemGray6
        
        let widthOfSmallBoxes = view.frame.width/3.85
        let heightOfSmallBoxes = view.frame.height/6
                
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.systemGray6
        view.addSubview(tableView)
        tableView.anchor(top: view.readableContentGuide.topAnchor, leading: view.leadingAnchor, bottom: view.readableContentGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        
        info.bind(to: tableView.rx.items){ [self](tv, row, item) -> UITableViewCell in
            let indexPath = IndexPath(row: row, section: 0)
            
            if (row == 0){
                let cell = tv.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
                cell.backgroundColor = .systemGray6
                cell.image1.backgroundColor = .red
                cell.image2.backgroundColor = .yellow
                cell.image3.backgroundColor = .blue
                tableView.rowHeight = 350
                //cell.heightAnchor.constraint(equalToConstant: 500)
                return cell
                
            }
            
            tableView.rowHeight = 50
            
            let cell = tv.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            
            if (row%2 == 0){
                
                cell.textLabel?.font = UIFont(name: "Avenir-Light", size: 16)
                cell.textLabel?.numberOfLines = 0
                cell.textLabel?.text = "\(item)"
            }else{
                cell.backgroundColor = UIColor.clear
                
                cell.textLabel?.attributedText = NSMutableAttributedString().bold("\(item)")
                //cell.textLabel?.font = UIFont(name: "Sans-Serif-Bold", size: 16)
            }
            
            
            return cell
            
                

        }.disposed(by: disposeBag)
        
        
        
        
        
        /*
        info.bind(to: tableView.rx.items(cellIdentifier: "cell")) { row, model, cell in
            
            if (row%2 == 1){
                
                cell.textLabel?.font = UIFont(name: "Avenir-Light", size: 16)
                cell.textLabel?.numberOfLines = 0
            }else{
                cell.backgroundColor = UIColor.clear
                //cell.backgroundColor = .systemGray6
                cell.textLabel?.font = UIFont(name: "Sans-Serif-Bold", size: 16)
            }
            
            cell.textLabel?.text = "\(model)"
        }.disposed(by: disposeBag)
        */
        
        
    }
    
    

    

}


extension NSMutableAttributedString {
    var fontSize:CGFloat { return 22 }
    var boldFont:UIFont { return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    /* Other styling methods */
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func blackHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}

