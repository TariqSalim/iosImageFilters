//
//  ViewController.swift
//  ImageFilters
//
//  Created by Tariq Salim on 2020-06-03.
//  Copyright © 2020 Tariq Suleiman Salim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var FilterSliderEffect: UISlider!
    
    var defaultImg: UIImage? = nil
    
    @IBOutlet weak var ImgLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        defaultImg = ImgView.image
        
        
    }
    
    @IBAction func BlurBtn(_ sender: Any) {
    
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg,kCIInputRadiusKey:FilterSliderEffect.value]
        ApplyFilters(filterName: "CIBoxBlur", filterParams: filterParams)
        
    
    }
    
    @IBAction func SepiaToneBtn(_ sender: Any) {
    
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg,kCIInputIntensityKey:FilterSliderEffect.value]
        ApplyFilters(filterName: "CISepialTone", filterParams: filterParams)
  
    }
    
    
    @IBAction func VignetteBtn(_ sender: Any) {
        
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg,kCIInputIntensityKey: FilterSliderEffect.value,kCIInputRadiusKey:FilterSliderEffect.value]
        ApplyFilters(filterName: "CIVignette", filterParams: filterParams)
        
    }

    
    @IBAction func FadeEffectBtn(_ sender: Any) {
        
        
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        ApplyFilters(filterName: "CICategoryColorEffect", filterParams: filterParams)
        
    }
    
    
    @IBAction func AreaAverageBtn(_ sender: Any) {
     
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        ApplyFilters(filterName: "CIAreaAverage", filterParams: filterParams)
        
    }
    
    
    @IBAction func ComicEffectBtn(_ sender: Any) {
    
        var rawImg = CIImage(image: ImgView.image!)
        var filterParams:[String:Any] = [kCIInputImageKey:rawImg]
        ApplyFilters(filterName: "CIComicEffect", filterParams: filterParams)
    
    }
    
    
    @IBAction func ResetImgBtn(_ sender: Any) {
        
        ImgView.image = defaultImg
    }
    
    func ApplyFilters(filterName:String , filterParams:[String:Any]){
        
        var filter = CIFilter(name: filterName, parameters: filterParams )
        
        //4. Create a context so that you can show the image back to use
        let context = CIContext(options: nil)
        
        
        //5. Convert CIImage result to CGI Image
     
        if let output = filter?.outputImage{
            
        if var cgiResult = context.createCGImage(output, from: output.extent){
                
                //6. Convert CGI Image into UIImage as a final result
                ImgView.image = UIImage(cgImage: cgiResult)
            
            }
    
      }

    }
}
