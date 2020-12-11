//
//  ViewController.swift
//  MediatorPattern
//
//  Created by rayeon lee on 2020/12/10.
//  Copyright © 2020 ryl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let concreteMediator = ConcreteMediator()
        
        let componentA = ComponentA()
        componentA.mediator = concreteMediator
        
        let componentB = ComponentB()
        componentB.mediator = concreteMediator
        
        concreteMediator.addDestination(destination: DestinationA())
        concreteMediator.addDestination(destination: DestinationB())
        
        componentA.onModeChange(mode: Mode.Connect)
        componentA.onModeChange(mode: Mode.Disconnect)
        
        componentB.onModeChange(mode: Mode.Connect)
        componentB.onModeChange(mode: Mode.Disconnect)
        
    }
}

