//
//  ViewController.swift
//  translateTools
//
//  Created by 千千 on 2019/10/4.
//  Copyright © 2019 千千. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    let url = "https://fanyi-api.baidu.com/api/trans/vip/translate"

    @IBOutlet weak var inputTextField: UITextView!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func translateBtn(_ sender: UIButton) {
        getHttpsRequest()
        print("hahahahhahaa***************")
    }
    @IBAction func pasteBtn(_ sender: UIButton) {
        print(inputTextField.text ?? "")
        //MARK: - 在这里粘贴剪切板的内容
        getPasteBoard()
        getHttpsRequest()
    }
    func getHttpsRequest() {
        let parameters = BaiduAPI(question: inputTextField.text ?? "").params
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            if(response.result.isSuccess){
                self.outputLabel.text = JSON(response.result.value!)["trans_result"][0]["dst"].stringValue
                print(response.request!)
                print(JSON(response.result.value!)["trans_result"][0]["dst"])
            }
        }

    }
    func getPasteBoard() {
         let pasteBoard = UIPasteboard.general
        inputTextField.text = pasteBoard.string ?? ""
         print(pasteBoard.string ?? "")
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        // Do any additional setup after loading the view.
    }
    func config() {
        
    }

}

