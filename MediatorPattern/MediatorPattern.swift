//
//  MediatorPattern.swift
//  MediatorPattern
//
//  Created by rayeon lee on 2020/12/10.
//  Copyright © 2020 ryl. All rights reserved.
//

import Foundation

enum Mode {
    case Connect
    case Disconnect
}

protocol IDestination {
    func receiveEvent(from:String, mode :Mode)
}

class DestinationA : IDestination{
    func receiveEvent(from:String, mode :Mode) {
        print("\(from) \(mode) : DestinationA receiveEvent 호출")
    }
}

class DestinationB : IDestination{
    func receiveEvent(from:String, mode :Mode) {
        print("\(from) \(mode) : DestinationB receiveEvent 호출")
    }
}

protocol Mediator : AnyObject {
    func action(compenent: String, mode: Mode)
}

class ConcreteMediator : Mediator {
    
    var destinations : [IDestination] = []
    
    func addDestination(destination :IDestination){
        destinations.append(destination)
    }
    
    func action(compenent:String, mode: Mode) {
        for destination in destinations{
            destination.receiveEvent(from:compenent,mode: mode)
        }
    }
}

protocol IComponent {
    var mediator: Mediator? { get set }
    
    func onModeChange(mode: Mode)
    
}

class ComponentA : IComponent {
    var mediator: Mediator? = nil
    
    func onModeChange(mode: Mode) {
        self.mediator?.action(compenent: "ComponentA", mode: mode)
    }
}

class ComponentB : IComponent {
    var mediator: Mediator? = nil

    func onModeChange(mode: Mode) {
        self.mediator?.action(compenent: "ComponentB",mode: mode)
    }
}


