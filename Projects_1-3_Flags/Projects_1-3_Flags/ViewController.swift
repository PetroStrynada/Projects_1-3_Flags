//
//  ViewController.swift
//  Projects_1-3_Flags
//
//  Created by Petro Strynada on 15.06.2023.
//

import UIKit

class ViewController: UIViewController {
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Storme View"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        guard let assetsURL = Bundle.main.url(forResource: "Assets", withExtension: ".xcassets") else {
            print("Assets folder not found.")
            return
        }
        let items = try! fm.contentsOfDirectory(at: assetsURL, includingPropertiesForKeys: nil, options: [])

        for itemURL in items {
            if itemURL.pathExtension == "png" {
                let flagName = itemURL.deletingPathExtension().lastPathComponent
                flags.append(flagName)
            }
        }

        print(flags) // Use the flags array as needed
    }
}

