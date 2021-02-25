//
//  MainPageView.swift
//  WOPT
//
//  Created by Waad on 2021-02-11.
//

import SwiftUI

struct MainPageView: View {
    let workouts = workoutsData
    
    var body: some View {
        
     
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                
                Text("WOPT")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.horizontal,20)
                    .padding(.top, 15)
                    
                    
                    
                
                    
                    
                
                VStack{
                    
                    NavigationLink(destination: SessionView()) {
                        
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
                                    .padding(.top, 30)

                                
                            }
                            .padding()
                            .frame(width: 400)
                            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5122357299)))
                        }
                        .frame(width: 360, height: 200)
                        .cornerRadius(20)
                        .clipped()
                        .shadow(radius: 8)
                        .padding()
                        
                    }
                    
                    
                    NavigationLink(destination: MealListView()) {
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
                                .padding(.top, 110)
                                
                        }
                            
                            .frame(width:380,height: 200)
                            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5122357299)))
                            
                        }
                        
                        .frame(width: 360, height: 200)
                        .cornerRadius(20)
                        .shadow(radius: 8)
                        .padding(.top,1)
                        .clipped()
                        
                    }
                    //.padding(.bottom, 30)
                    
                    
                    
                    
                    
                    
                        
                    
                    }
                VStack(alignment: .leading){
                    Text("Veckans Träningsplan")
                        .font(.system(size: 28))
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.top,20)
                        .padding(.horizontal, 20)
                    
                }
                
                
                
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        
                        ForEach(workouts){ Workout in
                            
                            ZStack {
                                Image(Workout.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 200)
                               
                                VStack {
                                    
                                    Spacer()
                                        
                                    Text(Workout.dag)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        
                                    Text(Workout.kroppsdel)
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
                    .padding(.bottom, 60)
                    .padding()
                    
                }
                .offset(x:0, y:-20)
                
              
                Spacer()
                
                
                
                
                
                
                
            }
            
        }
       
       
        
        
       
    }
    
    
    
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

struct Workout: Identifiable {
    
    
    var id = UUID()
    var dag: String
    var kroppsdel: String
    var image: String
    var routine: [String]
    
}

let workoutsData = [
Workout(dag: "Måndag", kroppsdel: "Bröst & triceps", image: "Working-Out-With-Chalk",
        routine: ["Bänkpress", "Flies", "Dips"]),
    
Workout(dag: "Tisdag", kroppsdel: "Rygg & biceps", image:"one", routine: ["Chins","lat pulldown", "marklyft", "biceps curl"]),
    
Workout(dag: "Onsdag", kroppsdel: "Ben & Mage", image:"four", routine: ["Squats","BenSpark", "Utfallsteg", "Sittups"]),
    
Workout(dag: "Torsdag", kroppsdel: "Axlar ", image:"man-stretching", routine: ["Chins","lat pulldown", "marklyft", "biceps curl"]),

Workout(dag: "Fredag", kroppsdel: "Armar", image:"three", routine: ["Dips","Curls", "Tricep Pushdown", "Hammer curls"]),
    
Workout(dag: "Lördag", kroppsdel: "Rest", image:"two", routine: ["rest"]),
    
Workout(dag: "Söndag", kroppsdel: "Rest", image:"fitness-weight-lifting", routine: ["rest"])




    ]
