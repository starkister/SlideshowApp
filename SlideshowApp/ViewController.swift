//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Apple on 2021/11/30.
//

import UIKit

class ViewController: UIViewController {

    let appController: AppController = AppController()
    
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var imageAsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初期化
        appController.mainViewController = self
        appController.initialize();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のResultViewControllerを取得する
        let expandViewController: ExpandViewController = segue.destination as! ExpandViewController
        expandViewController.nameOfImageToShow =  self.appController.imageNames[self.appController.currentPageIndex]
    }
   
    @IBAction func previousButton(_ sender: Any) {
        appController.processPrevious()
    }
    
    @IBAction func playStopButton(_ sender: Any) {
        appController.processPlayStop()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        appController.processNext()
    }
    
    func reloadImage(){
        imageAsButton.setBackgroundImage(UIImage(named:appController.imageNames[appController.currentPageIndex]), for: .normal)
        print("showing page number: \(appController.currentPageIndex)")
    }
    
    func updatePageLabel(currentPage:Int, totalPage:Int){
        self.pageLabel.text = "\(currentPage)/\(totalPage)"
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
    }
}

