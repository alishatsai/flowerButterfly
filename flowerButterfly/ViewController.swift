//
//  ViewController.swift
//  flowerButterfly
//
//  Created by Alisha on 2020/12/12.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var butterflyMask: UIImageView!
    @IBAction func changeButton(_ sender: UIButton) {
        
        let number = Int.random(in: 1...6)
        picImageView.image = UIImage(named: "p\(number)")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //遮色片
        picImageView.mask = butterflyMask
        
        //skView 雪花
        let skView = SKView(frame: self.view.bounds)
        self.view.insertSubview(skView, at: 0)
        
        let scene = SKScene(size: skView.frame.size)
        scene.anchorPoint = CGPoint(x: 0.5, y: 1)
        scene.backgroundColor = UIColor.init(red: 0, green: 0, blue: 100/255, alpha: 1)
        
        let emitterNode = SKEffectNode(fileNamed: "SnowParticle")
        scene.addChild(emitterNode!)
        skView.presentScene(scene)
        
        //由上至下白色半透明漸層，透明度０到１，雪花到底部會有消融的感覺
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 0),
            CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)]
        
        //疊加在skView上
        skView.layer.addSublayer(gradientLayer)
        
    }


}

