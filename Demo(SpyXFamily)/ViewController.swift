//
//  ViewController.swift
//  Demo(SpyXFamily)
//
//  Created by Sin on 2023/1/3.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //player 要寫成contorller的property，生成播放音樂的 AVPlayer 物件
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //👇用AVPlayer播放音樂
        
        let url = URL(string: "https://drive.google.com/uc?export=download&id=1E6VoRczm6Wm7Y0q5VzdeuoZqMGL3_Bnn")
        //利用 AVPlayerItem 生成要播放的音樂
        let playerItem = AVPlayerItem(url: url!)
        //設定 player 要播放的 AVPlayerItem
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        //👇加入背景
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 393, height: 852))
        backgroundImage.image = UIImage(named: "spybackground")
        view.addSubview(backgroundImage)
        //👇加入遮罩圖層
        //(先加入底層圖片，就是被蓋住的那張圖)
        let whiteImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 254, height: 297))
        whiteImage.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        //(再加入上層圖片，就是最後要呈現的形狀，記得去背)
        let logoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 254, height: 297))
        logoImage.image = UIImage(named: "spyfamily")
        //（下層的圖片的遮罩）做好遮罩後再調整整個遮罩的位置
        whiteImage.mask = logoImage
       
        whiteImage.frame = CGRect(x: 70, y: 78, width: 254, height: 297)
        //呼叫剛剛做好的遮罩
        view.addSubview(whiteImage)
        
        //👇加入GIF
        let imageView = UIImageView(frame: CGRect(x: 12, y: 483, width: 369, height: 369))
        view.addSubview(imageView)
        //產生代表動畫圖片的 UIImage 物件，並設定每張圖的秒數
        let animatedImage = UIImage.animatedImageNamed("anya-", duration: 1)
        //將 imageView 的 image 指定為代表動畫圖片的 UIImage 物件
        imageView.image = animatedImage
        
        
        //👇用CAEmitterLayer 製造發射粒子效果
        //先設定CAEmitterLayer裡的物件CAEmitterCell
        let peanutEmitterCell = CAEmitterCell()
        //由於 contents 要求的型別是 CGImage，因此我們產生 UIImage 後要再讀取型別 CGImage 的屬性 cgImage
        peanutEmitterCell.contents = UIImage(named: "peanut")?.cgImage
        
        
        //設定每秒要發射幾個粒子，這邊設定1秒6個
        peanutEmitterCell.birthRate = 4
        //設定粒子在畫面的停留時間，這邊讓粒子停留20秒
        peanutEmitterCell.lifetime = 20
        //設定粒子移動的速度
        peanutEmitterCell.velocity = 10
        //設定粒子移動速度的可變化量（設定速度區間）
        peanutEmitterCell.velocityRange = 10
        //設定粒子下降的加速度，用 yAcceleration 設定向下移動的加速度。（當 yAcceleration > 0 時會向下移動，yAcceleration ＜ 0 時會向上移動。我們也可以設定 xAcceleration，xAcceleration > 0 會向右移動，xAcceleration < 0 會向左移動。）
        peanutEmitterCell.yAcceleration = 10
        peanutEmitterCell.xAcceleration = 0
        //設定粒子的大小比例
        peanutEmitterCell.scale = 1
        //設定粒子大小比例的可變化量（設定大小區間）
        peanutEmitterCell.scaleRange = 0.5
        //設定粒子的大小在畫面中時的變化速度
        peanutEmitterCell.scaleSpeed = -0.02
        //設定粒子的旋轉速度
        peanutEmitterCell.spin = 0.5
        //設定粒子的旋轉速度可變化量（設定旋轉角度區間）
        peanutEmitterCell.spinRange = 0.8
        //設定發射角度
        peanutEmitterCell.emissionRange = .pi*0.5
        
        
        //設定CAEmitterLayer，將它的 emitterCells 指定為剛剛產生的花生粒子 peanutEmitterCell
        let peanutEmitterLayer = CAEmitterLayer()
        peanutEmitterLayer.emitterCells = [peanutEmitterCell]
        
        
        //設定發射中心位置
        peanutEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width/2, y: -50)
        //設定發射的形狀大小
        peanutEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        //設定發射的形狀，.line 將讓雪花從水平線發射
        peanutEmitterLayer.emitterShape = .line
        
        //呼叫到畫面上
        view.layer.addSublayer(peanutEmitterLayer)
        
    }


}

