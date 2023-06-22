//
//  ViewController.swift
//  Projects_1-3_Flags
//
//  Created by Petro Strynada on 15.06.2023.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        countries.append(contentsOf: ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "spain", "uk", "us"])

        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true


    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryNames", for: indexPath)

        let countryName = countries[indexPath.row]
        cell.textLabel?.text = countryName.uppercased()
        if let flagImage = UIImage(named: countryName) {
            let resizedImage = flagImage.resize(toSize: CGSize(width: 30, height: 30)) // Resize the image
            cell.imageView?.image = resizedImage
        }

        cell.imageView?.layer.borderWidth = 1.0
        cell.imageView?.layer.borderColor = UIColor.gray.cgColor

        cell.accessoryType = .disclosureIndicator // Added chevron sign

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedCountry = countries[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

extension UIImage {
    func resize(toSize targetSize: CGSize) -> UIImage {
        let size = self.size

        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height

        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }

        let renderer = UIGraphicsImageRenderer(size: newSize)
        let image = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }

        return image
    }
}
