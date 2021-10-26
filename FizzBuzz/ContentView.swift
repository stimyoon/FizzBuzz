//
//  ContentView.swift
//  FizzBuzz
//
//  Created by Tim Yoon on 10/25/21.
//

import SwiftUI


struct ContentView: View {
    
    @State var currentNumber = "1"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var keepCounting = true
    @State var number = 1
    
    var body: some View {
        VStack{
            Text(currentNumber)
                .font(.system(size: 70))
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 300)
                
            Button {
                keepCounting.toggle()
            } label: {
                Text("Start/Stop")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .onReceive(timer) { _ in
            guard keepCounting else { return }
            number += 1
            currentNumber = convertIntToFizzBuzzString(number: number)
        }
    }
    
    func fizzBuzzString() -> String {
        var str = ""
        for index in 1...20 {
            str += convertIntToFizzBuzzString(number: index) + ", "
        }
        return str
    }
    
    func convertIntToFizzBuzzString(number: Int) -> String {
        if number % 3 == 0 && number % 5 == 0{
            return "fizzbuzz"
        }
        if number % 3 == 0 {
            return "fizz"
        }
        if number % 5 == 0 {
            return "buzz"
        }
        return String(number)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
