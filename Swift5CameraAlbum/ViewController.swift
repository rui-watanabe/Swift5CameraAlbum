//
//  ViewController.swift
//  Swift5CameraAlbum
//
//  Created by watar on 2019/09/29.
//  Copyright © 2019 rui watanabe. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
                
            case .authorized:
                print("許可されています。")
            case .denied:
                print("拒否されました。")
            case .notDetermined:
                print("未設定です。")
            case .restricted:
                print("制限されています")
  
            }
            
        }
        
    


}

