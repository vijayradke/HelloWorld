//
//  APIClient.swift
//  MVVMSample
//
//  Created by Vijay Radake on 14/11/17.
//  Copyright © 2017 Vijay Radake. All rights reserved.
//

import UIKit

class APIClient: NSObject {

	func fetchAppList(_ completion: @escaping ([[String: Any]]?) -> Void) {
		guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json") else {
			print("Invalid URL")
			return
		}
		
		let session = URLSession.shared
		let task = session.dataTask(with: url) { (data, response, error) in
			
			guard let unwrappedData = data else {
				print("Eror getting data")
				return
			}
			do {
				if let resultJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? [String: Any] {

					if let feeds = resultJSON["feed"] as? [String: Any], let apps = feeds["results"] as? [[String: Any]] {
						completion(apps)
					}
				}
			}
			catch {
				completion(nil)
				print("Erro getting API Data", error.localizedDescription)
			}
		}
		task.resume()
	}
	
}
