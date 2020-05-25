//
//  ContentView.swift
//  GoodWeather
//
//  Created by Brad Booysen on 22/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM = WeatherViewModel()
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            TextField("Enter city name", text: self.$weatherVM.cityName) {
                
                //Fires whenever the the textfield is submitted
                self.weatherVM.search()
                
            }.font(.custom("Arial", size: 50))
            .foregroundColor(Color.white)
            .padding()
            .fixedSize()
            
            Text(self.weatherVM.temperature)
                .foregroundColor(Color.white)
                .font(.custom("Arial", size: 100))
                .offset(y: 100)
                .padding()
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue)
            .edgesIgnoringSafeArea(.all)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
