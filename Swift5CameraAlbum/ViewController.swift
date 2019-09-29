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
    

    
    @IBAction func openCamera(_ sender: Any) {
        
        
        let sourceType = UIImagePickerController.SourceType.camera
        
        //カメラが利用可能かチェックする
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        
        let cameraPicekr = UIImagePickerController()
        cameraPicekr.sourceType = sourceType
        cameraPicekr.delegate = self
        cameraPicekr.allowsEditing = true
        present(cameraPicekr, animated: true, completion: nil)
        
        }else{
            
            print("エラー")
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func openAlbum(_ sender: Any) {
        
        let sourceType = UIImagePickerController.SourceType.photoLibrary
               
               //カメラが利用可能かチェックする
               
               if UIImagePickerController.isSourceTypeAvailable(.camera){
               
               let cameraPicekr = UIImagePickerController()
               cameraPicekr.sourceType = sourceType
               cameraPicekr.delegate = self
               cameraPicekr.allowsEditing = true
               present(cameraPicekr, animated: true, completion: nil)
               
               }else{
                   
                   print("エラー")
               }
        
        
    }
    
    //撮影が完了した時に呼ばれる（アルバムから画像が選択された時に呼ばれる）
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[.editedImage] as? UIImage{
            
            backImageView.image = pickedImage
            
            //写真の保存
            
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
            picker.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    //シェアするための機能
    
    @IBAction func share(_ sender: Any) {
        
        let text = "#"
        let imafge = backImageView.image?.jpegData(compressionQuality: 0.2)
        let items = [text.image] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(activityVC, animated: true, completion: nil)
        
        
        
        
    }
    
}
