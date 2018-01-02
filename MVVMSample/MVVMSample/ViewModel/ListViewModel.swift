//
//  ListViewModel.swift
//  MVVMSample
//
//  Created by Vijay Radake on 14/11/17.
//  Copyright © 2017 Vijay Radake. All rights reserved.
//

import UIKit

class ListViewModel: NSObject {
	
	@IBOutlet var apiClient:APIClient!
	var apps: [[String:Any]]?
	
	func getApps(_ completion: @escaping () -> Void) {
		apiClient.fetchAppList { (appsList) in
			DispatchQueue.main.async {
				self.apps = appsList
				completion()
			}
		}
	}
	
	func numberOfItemsToDisplay(in section: Int) -> Int {
		return apps?.count ?? 0
	}
	
	func appTitleToDisplay(for indexPath: IndexPath) -> String {
		return apps?[indexPath.row]["name"] as? String ?? ""
	}
	
	func appRatingToDisplay(for indexPath: IndexPath) -> String {
		return apps?[indexPath.row]["releaseDate"] as? String ?? ""
	}
	
	func appImageUrlToDisplay(for indexPath: IndexPath) -> String {
		return apps?[indexPath.row]["artworkUrl100"] as? String ?? ""
	}
}
