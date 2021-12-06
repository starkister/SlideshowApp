//
//  AppController.swift
//  SlideshowApp
//
//  Created by Apple on 2021/11/30.
//

import Foundation
import UIKit

class AppController : UIViewController{
    
    var mainViewController: ViewController? = nil
    var expandViewController: ExpandViewController? = nil
    
    var timer: Timer!
    var timerOn: Bool = false;
    
    //the image showing will change according to this value(=index value)
    var currentPageIndex:Int = 0;
    let imageNames = ["pexels-francesco-ungaro-2835436",
                      "pexels-kim-daejeong-2734512",
                      "pexels-s-migaj-747964",
                      "pexels-singkham-1108572"]
   
    func initialize(){
        self.currentPageIndex = 0;
        self.mainViewController?.updatePageLabel(currentPage: currentPageIndex+1, totalPage: imageNames.count)
    }
    
    @objc func processPlayStop(){
        if self.timerOn {
            stopTimer()
        }
        else{
            startTimer()
        }
    }
    @objc func startTimer(){
        print("Timer started")
        self.timerOn = true
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(processNext), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer(){
        self.timerOn = false
        self.timer.invalidate()
        self.timer = nil;
    }
    
    @objc func processPrevious(){
        print("previous")
        self.currentPageIndex -= 1;
        if self.currentPageIndex < 0{
            self.currentPageIndex = self.imageNames.count-1;
        }
        mainViewController!.reloadImage()
        mainViewController!.updatePageLabel(currentPage: self.currentPageIndex+1, totalPage: imageNames.count)
        
    }
    
    @objc func processNext(){
        print("next")
        self.currentPageIndex += 1;
        if self.currentPageIndex >= imageNames.count{
            self.currentPageIndex = 0;
        }
        mainViewController!.reloadImage()
        mainViewController!.updatePageLabel(currentPage: self.currentPageIndex+1, totalPage: self.imageNames.count)
    }
}

