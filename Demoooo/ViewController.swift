//
//  ViewController.swift
//  Demoooo
//
//  Created by Gurpal Rajput on 13/05/20.
//  Copyright © 2020 Gaint coders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var searchBar: UISearchBar!{
    didSet{
    self.searchBar.delegate = self
    }
  }
  
  var lastSearchedTxt = ""
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
}
extension ViewController:UISearchBarDelegate{
  
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    if (lastSearchedTxt.isEmpty){
      lastSearchedTxt = searchText
    }
    
    NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(makeNetworkCall(sender:)), object: lastSearchedTxt)
    lastSearchedTxt = searchText
    self.perform(#selector(makeNetworkCall(sender:)), with: searchText, afterDelay: 0.7)
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
  }
  
  @objc private func makeNetworkCall(sender:String) {
    print("\(sender)")
  }
  
}

