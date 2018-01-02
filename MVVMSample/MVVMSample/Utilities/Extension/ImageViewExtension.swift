//
//  ImageViewExtension.swift
//  MVVMSample
//
//  Created by Vijay Radake on 14/11/17.
//  Copyright © 2017 Vijay Radake. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
	
	func loadFromURL(_ url: String) {
		guard let imageUrl = URL(string:url) else {
			return
		}
		let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
			if error != nil {
				print(error?.localizedDescription ?? "")
			}
			if let imageData = data {
				DispatchQueue.main.sync {
					self.image = UIImage(data: imageData)
				}
			}
		}
		task.resume()
	}
}
