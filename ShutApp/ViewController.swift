//
//  ViewController.swift
//  ShutApp
//
//  Created by Isabelle Greenberg on 2/16/19.
//  Copyright © 2019 Isabelle Greenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var decibelLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var room: UIPickerView!
    var colors: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        var level = 7.7
                decibelLabel.text = (String)(level)
                if level >= 10 {
                    decibelLabel.center.x-=6;
                }
                if level >= 15 {
                    decibelLabel.textColor = UIColor.red;
                }
                else if level >= 7.5 {
                    decibelLabel.textColor = UIColor.yellow;
                }
                else {
                    decibelLabel.textColor = UIColor.green;
                }
        
        self.room.delegate = self
        self.room.dataSource = self
        colors = ["A101","A103","B102","B104"]
    
        add.frame = CGRect(x: 155, y: 590, width: 55, height: 55)
        add.layer.cornerRadius = 0.5 * add.bounds.size.width
        add.clipsToBounds = true
        add.backgroundColor = .cyan
        add.setTitle("+", for: .normal)
        add.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        
        self.view.addSubview(add)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.3
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        label.font = UIFont (name: "Helvetica Neue", size: 35)
        label.text =  colors[row]
        label.textAlignment = .center
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    @objc func addAction(sender: UIButton!) {
        print("Button tapped")
    }

}

