//
//  IntroViewController.swift
//  Week 2 Carousel
//
//  Created by Ngai, Sabrina on 8/28/16.
//  Copyright © 2016 Ngai, Sabrina. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBAction func onTapSignInButton(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    
    //starting positions
    var xOffsets : [CGFloat] = [-40, 55, 36, 95, -120, -65]
    var yOffsets : [CGFloat] = [-285, -260, -445, -428, -530, -530]
    var scales : [CGFloat] = [1, 1.7, 1.6, 1.8, 1.9, 1.7]
    var rotations : [CGFloat] = [-20, -18, 15, 15, 15, -15]
    
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view : UIView!, atIndex index : Int, offset : CGFloat) {
    }
    
    func updateViewTransformsWithOffset(offset : CGFloat){
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.contentSize = introImageView.image!.size
        scrollView.delegate = self
        
        scrollView.sendSubviewToBack(introImageView)
        
    }
    
    //track the scrolling
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
       var offset = CGFloat(scrollView.contentOffset.y)
        
        //animate from starting position to resting position
        
        //TILE 1
        var tx1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -40, r2Max: 0)
        var ty1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var scale1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -20, r2Max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx1), CGFloat(ty1))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale1), CGFloat(scale1))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation1) * M_PI / 180))
        
        //TILE 2
        var tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 55, r2Max: 0)
        var ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -260, r2Max: 0)
        var scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -18, r2Max: 0)
        
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(scale2), CGFloat(scale2))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotation2) * M_PI / 180))
        
        //TILE 3
        var tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 36, r2Max: 0)
        var ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -445, r2Max: 0)
        var scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        var rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 15, r2Max: 0)
        
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(scale3), CGFloat(scale3))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        //TILE 4
        var tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -120, r2Max: 0)
        var ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -428, r2Max: 0)
        var scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.8, r2Max: 1)
        var rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 15, r2Max: 0)
        
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(scale4), CGFloat(scale4))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
        //TILE 5
        var tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -120, r2Max: 0)
        var ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -530, r2Max: 0)
        var scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.9, r2Max: 1)
        var rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 15, r2Max: 0)
        
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(scale5), CGFloat(scale5))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotation5) * M_PI / 180))
        
        //TILE 6
        var tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -65, r2Max: 0)
        var ty6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -530, r2Max: 0)
        var scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -15, r2Max: 0)
        
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(scale6), CGFloat(scale6))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotation6) * M_PI / 180))
        
        
        
        //print("content offset: \(scrollView.contentOffset.y)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
