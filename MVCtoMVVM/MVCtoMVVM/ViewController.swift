//
//  ViewController.swift
//  MVCtoMVVM
//
//  Created by SW_mac04 on 2021/09/16.
//

import UIKit
import LoremSwiftum

class ViewController: UIViewController {

    private lazy var activityIndicator = UIActivityIndicatorView(style: .medium)
    private lazy var label = UILabel()
    private lazy var button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "M(assive)VC"
        
        view.backgroundColor = .white
        
        view.addSubview(activityIndicator)
        
        button.setTitle("Load",for: .normal)
        // 버튼을 누르면 LoremSwiftum 에서 Label에 텍스트를 표시하는 것
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
        
        label.numberOfLines = 0
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        activityIndicator.frame = view.bounds
        label.frame = view.bounds.inset(by: UIEdgeInsets(top: 80, left: 20, bottom: 80, right: 20))
        button.frame = CGRect(x: 20, y: view.bounds.height-60, width: view.bounds.width-40, height: 40)
    }
    
    private func loadText(completion: @escaping (String) -> Void) {
        let lorem = Lorem.paragraphs(3)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            completion(lorem)
        }
    }
    
    @objc private func buttonClicked() {
        label.text = nil
        loadText {
            self.label.text = $0
        }
    }
}

