//
//  ViewController.swift
//  AzRxSwiftSample
//
//  Created by Sefa Aycicek on 11.03.2024.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class ViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var txtSoyadi: UITextField!
    @IBOutlet weak var txtAdi: UITextField!
    
    let viewModel = ViewControllerViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.errorSubject
            .subscribe { result in
                print(result)
            }.disposed(by: disposeBag)
        
        viewModel.onCompleteSubject
            .subscribe { result in
                
            }.disposed(by: disposeBag)
        
        txtAdi.rx.text.orEmpty.bind(to: viewModel.nameText).disposed(by: disposeBag)
        txtSoyadi.rx.text.orEmpty.bind(to: viewModel.lastNameText).disposed(by: disposeBag)
    }

    @IBAction func save(_ sender: Any) {
        
        viewModel.save()
        
    }
    
    
    
    
}

class User {
    var adi : String = ""
    var soyadi : String = ""
}


extension ViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

