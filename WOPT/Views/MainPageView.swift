//
//  MainPageView.swift
//  WOPT
//
//  Created by Waad on 2021-02-11.
//

import SwiftUI

struct MainPageView: View {
    let workouts = workoutsData
    
    private let sessionStore = SessionStore()
    @Binding var isShowingMainPage : Bool
 
    private func getCurrentDay() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = . full
        
        let dateString = dateFormatter.string(from: date)
        let dateArr = dateString.split(separator: ",")
        
        switch dateArr[0] {
        case "Sonday":
            return "Söndag"
        case "Monday":
            return "Måndag"
        case "Tuesday":
            return "Tisdag"
        case "Wednesday":
            return "Onsdag"
        case "Thursday":
            return "Torsdag"
        case "Friday":
            return "Fredag"
        default:
            return "Lördag"
        }
    }
    var body: some View {
    ScrollView {
        HStack {
            Spacer()
            Button("Logga ut", action: {
                sessionStore.signOut()
                self.isShowingMainPage = false
            })
            .padding()
            
            
            
        }
        VStack {
            
            
            Text("WOP")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.horizontal,20)
                .padding(.top, 15)
            
            
            
            
            
            
            
            
            
            
            
            
            // Spacer()
            
            //VStack{
            
            NavigationLink(destination: SessionView(today: getCurrentDay())) {
                
                ZStack {
                    Image("gym-weights")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                    
                    
                    
                    VStack {
                        
                        Spacer()
                        
                        Text("Dagens Träningsplan")
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
            .navigationBarBackButtonHidden(true)
            
            
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
                    
                    .frame(width:360,height: 200)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5122357299)))
                    
                }
                
                .frame(width: 360, height: 200)
                .cornerRadius(20)
                .shadow(radius: 8)
                .padding(.top,1)
                .clipped()
                
            }
            //.padding(.bottom, 30)
            
            
            
            
            
            
            
            
            //}
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
                    
                    ForEach(workouts) { Workout in
                        NavigationLink(destination: SessionView(today: Workout.dag)) {
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
                                    
                                
                                    
                                    
                                    
                                }
                                .padding()
                                .frame(width: 150)
                                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5122357299)))
                                
                                
                            }}
                            .frame(width: 150, height: 200)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        
                    }
                }
                //.padding(.bottom, 60)
                .padding()
                
                
            }
            .offset(x:0, y:-20)
            
            
            Spacer()
            
            
            
            
            
            
        }
        .padding(.bottom,15)
        
        
        
        
        
        }
    .navigationBarHidden(true)
        
    }
    
    
    
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(isShowingMainPage: .constant(true))
    }
}

struct Workout: Identifiable {
    
    
    var id = UUID()
    var dag: String
    //var kroppsdel: String
    var image: String
   // var routine: [String]
    
}

let workoutsData = [
    Workout(dag: "Måndag", image: "Working-Out-With-Chalk"),
    
    Workout(dag: "Tisdag",  image:"one"),
    
    Workout(dag: "Onsdag", image:"four"),
    
    Workout(dag: "Torsdag", image:"man-stretching"),
    
    Workout(dag: "Fredag", image:"three"),
    
    Workout(dag: "Lördag",  image:"two"),
    
    Workout(dag: "Söndag",  image:"fitness-weight-lifting")
    
    
    
    
]
