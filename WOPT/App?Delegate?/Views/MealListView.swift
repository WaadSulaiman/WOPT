//
//  ContentView.swift
//  WOPT
//
//  Created by Waad on 2021-02-04.
//

import SwiftUI

struct MealListView: View {
    var body: some View {
        // TODO: create a completion image
        // CANDO: Set everything in navigationview and put up navigationbartitle
        VStack {
            
            HStack {
                Text("Meals")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 140.0)
                
                Button(action: {}) {
                    Image(systemName: "plus.rectangle")
                        .resizable()
                        .frame(width: 30, height: 25)
                    
                    
                    
                    
                }
                
            }
            VStack {
                List(1..<6) { item in
                    Image(systemName: "square")
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                    Text("Implement the UI")
                        .padding(.vertical, 50.0)
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                    }
                }
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
