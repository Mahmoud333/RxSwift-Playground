//: Playground - noun: a place where people can play

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//import UIKit
//var str = "Hello, playground"

import RxSwift


let names = Variable(["Peter"])

names.value

names.asObservable()
    //.subscribe(onNext: <#T##(([String]) -> Void)?##(([String]) -> Void)?##([String]) -> Void#>, onError: <#T##((Error) -> Void)?##((Error) -> Void)?##(Error) -> Void#>, onCompleted: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDisposed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    //Types of event and we can choose them and choose what it should do with each one
    
    
    .throttle(0.5, scheduler: MainScheduler.instance) //sometime the values changes so fast here we can tell it to react if amount of time has passed since the last react, this amount is 0.5
        //will remove 1 & 2, show after 0.5 sec
    
    .filter { value in
        
        return value.count > 1
    } //filter what we need to react to, if the value > 300 something like that, can't see ones that had one element in there
        //will remove 3 & 4, show more than 2
    
    .debug() //it tells me which file which line and what happened
    
    .map { value in
        return ".map users: \(value)"
    } //change the array to like string like if we wanna show it on a label or so
    
    
    .subscribe { (value) in //onNext:
        print(value)
    } //should always be the last, kind of the trigger for all things to work



print()
names.value = ["Peter", "John"] //1
print()
names.value = ["Alice", "Wendy"] //2


DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
    print()
    names.value = ["Wendy"] //3
}
DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
    print()
    names.value = ["Admin"] //4
}













































