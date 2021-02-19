//
//  MainPageView.swift
//  WOPT
//
//  Created by Waad on 2021-02-11.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        
        VStack {
            
            
            Text("WOPT")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .fontWeight(.heavy)
                .padding(.top, 10)
                
                
            
            VStack {
                ZStack {
                    Image("gym-weights")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                       
                    
                    VStack {
                        
                        Spacer()
                            
                        Text("Min Träningsplan")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)

                        
                    }
                    .padding()
                    .frame(width: 400)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5122357299)))
                }
                .frame(width: 370, height: 200)
                .cornerRadius(20)
                .clipped()
                .shadow(radius: 8)
                .padding(.top,5)
                
                
                ZStack {
                    Image("korean-bbq-and-restaurant-dining")
                    
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        
                    
                    VStack{
                    
                    Text("Min Träningskost")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top, 70)
                        
                }
                    
                    .frame(width:380,height: 200)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5122357299)))
                    
                }
                
                .frame(width: 370, height: 200)
                .cornerRadius(20)
                .shadow(radius: 8)
                .padding(.top, 10)
                .clipped()
                .padding(.bottom, 20)
                
                
                Text("Veckans Träningsplan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                }
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    
                    ForEach(0..<7){ item in
                        
                        ZStack {
                            Image("")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                           
                            VStack {
                                
                                Spacer()
                                    
                                Text("Måndag")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    
                                Text("Bröst & triceps")
                                    .fontWeight(.regular)
                                    .foregroundColor(.white)
                                

                                
                            }
                            .padding()
                            .frame(width: 150)
                            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5122357299)))
                            
                            
                        }
                        .frame(width: 150, height: 200)
                        .clipped()
                        .cornerRadius(20)
                        .shadow(radius: 8)
                        
                    }
                }
            }
            
          
            Spacer()
            
            
            
            
            
            
            
        }
       
       
        
        
       
    }
    
    
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
