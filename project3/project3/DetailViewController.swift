//
//  DetailViewController.swift
//  project1
//
//  Created by admin on 12/31/19.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedImage
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Camera", style: .plain, target: self, action: #selector(camera))
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook){
//          vc.setInitialText("Look at this great picture!")
//          vc.add(imageView.image!)
//          vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
//        present(vc, animated: true)
//    }
        present(vc, animated: true, completion: nil)
    }
    
    @objc func camera() {
        
    }
}

