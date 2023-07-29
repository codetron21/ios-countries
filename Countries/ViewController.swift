//
//  ViewController.swift
//  Countries
//
//  Created by Adadua karunia Putera on 29/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var countries = [
        "Indonesia",
        "Amerika",
        "Jepang"
    ]
    
    private struct Constant {
        static let cellID = "cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.cellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let index = indexPath.row
        
        if index == countries.count - 1 {
            performSegue(withIdentifier: "ToDetail", sender: self)
            return
        }
        
        let screen = UIViewController()
        
        if index % 2 == 0 {
            screen.view.backgroundColor = .green
            present(screen, animated: true)
            return
        }
        
        if index % 2 == 1 {
            screen.view.backgroundColor = .blue
            navigationController?.pushViewController(screen, animated: true)
            return
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.text = countries[indexPath.row]
        cell.contentConfiguration = configuration
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    

}

