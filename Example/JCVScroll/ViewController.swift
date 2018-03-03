//
//  ViewController.swift
//  JCVScroll
//
//  Created by Pelvs on 02/28/2018.
//  Copyright (c) 2018 Pelvs. All rights reserved.
//

import UIKit
import JCVScroll

class ViewController: UIViewController {
    
    @IBOutlet var collapsableViews: [UIView]!
    @IBOutlet var topConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        JCVScroll.fadeColors = [.red , .blue, .white]
        JCVScroll.fadeAnimationSpeed = 0.8
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "SimpleTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        JCVScroll.setup(for: collapsableViews, scrollView: scrollView, viewConstraints: topConstraints)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell", for: indexPath) as? SimpleTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

