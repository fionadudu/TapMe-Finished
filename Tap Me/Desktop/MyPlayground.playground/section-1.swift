// Playground - noun: a place where people can play

import UIKit
protocol Speaker {
    func Speak()
}




class DateSimulator {
    
    let a:Speaker
    let b:Speaker
    
    init(a:Speaker, b:Speaker) {
        self.a = a
        self.b = b
    }
    
    class Vicki: Speaker {
        func Speak() {
            println("Hello, I am Vicki!")
        }
        func TellJoke() {
            println("Q: What did Sushi A say to Sushi B?")
        }
    }
    
    class Ray: Speaker {
        func Speak() {
            println("Yo, I am Ray!")
        }
        func TellJoke() {
            println("Q: Whats the object-oriented way to become wealthy?")
        }
        func WriteTutorial() {
            println("I'm on it!")
        }
    }

    
    func simulate() {
        println("Off to dinner...")
        a.Speak()
        b.Speak()
        println("Walking back home...")
        a.TellJoke?()
        b.TellJoke?()
    }
}

let sim = DateSimulator(a:Vicki(), b:Ray())
sim.simulate()

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim:DateSimulator, a: Speaker, b:Speaker)
}

class LoggingDateSimulator:DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker) {
        println("Date started!")
    }
    func dateSimulatorDidEnd(sim:DateSimulator, a: Speaker, b: Speaker)  {
        println("Date ended!")
    }
}