//
//  RegisterView.swift
//  WOPT
//
//  Created by Waad on 2021-02-11.
//

import SwiftUI
import Firebase

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    @State var isShowingMainPage = false
    
    func signIn(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
               return
           }
            
        isShowingMainPage = true
            
        }
        
       /* session.signIn(email: email, password: password) {(result, error) in
            
            if let error = error {
                self.error = error.localizedDescription
                
            } else {
                
                self.email = ""
                self.password = ""
            }
           
            
        }*/
        
    }
    func getUser(){
        session.listen()
    }
    
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                VStack {
                    Text("WOPT")
                        .font(.system(size: 42,weight: .bold))
                        .foregroundColor(Color.blue)
                        .padding(.top)
                    
                    Text("Välkommen Tillbaka!")
                        .font(.system(size: 32,weight: .heavy))
                        .foregroundColor(Color.blue)
                    
                    
                    Text("Logga in för att gå vidare")
                        .font(.system(size: 18, weight:.light))
                        .foregroundColor(Color.gray)
                        
                    
                    VStack(spacing: 18){
                        TextField("Email adress", text: $email)
                            .font(.system(size: 14))
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 1))
                        
                        SecureField("Lösenord", text: $password)
                            .font(.system(size: 14))
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 1))
                    }
                    .padding(.vertical, 48)
                    
                     
                    NavigationLink(destination: MainPageView(), isActive: $isShowingMainPage){ EmptyView()}
                    Button(action: signIn){
                                    Text("Logga in")
                                    .frame(minWidth: 0,  maxWidth: .infinity)
                                    .frame(height: 50)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .bold))
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(10)
                         }
                        
                            
                           
                            
                            
                                
                                
                                
                            
                        }
                    }
                    Spacer ()
                        
                    NavigationLink(destination: SignUpView()){
                        HStack {
                            Text ("Har du inget konto?")
                                .font(.system(size:14,weight:.light))
                                .foregroundColor(.primary)
                            Text("Registrera dig")
                                .font(.system(size:14, weight: .semibold))
                         
                        }
                    }
               
                 
                    
                     
                }
                .onAppear(perform: getUser)
            .padding(.horizontal, 32)
        }
        
        
        }
        



        
        
    
    


struct SignUpView: View{
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error{
                self.error = error.localizedDescription
            }else {
                self.email = ""
                self.password = ""
            }
            
        }
    }
    
    func getUser(){
        session.listen()
    }
    var body: some View {
        
        
        
        VStack{
            Text("Registrera Dig")
                .font(.system(size: 32,weight: .heavy))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Text("skapa ett konto för att komma igång")
                .foregroundColor(.gray)
            
            VStack(spacing: 18){
                TextField("Email adress", text: $email)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5) .strokeBorder(Color.black,lineWidth: 1))
                    .padding(.horizontal,30)
                
                SecureField("Lösenord", text: $password)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5) .strokeBorder(Color.black,lineWidth: 1))
                    .padding(.horizontal,30)
            }
            .padding(.vertical,64)
            
            
            Button(action: signUp){
                Text("Skapa konto")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height:50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)            }
                
        }
        
        Spacer()
        
            .onAppear(perform: getUser)

        
            .padding(.horizontal,32)
        
    }
    
}

struct RegisterView: View {
    var body: some View {
        NavigationView{
            SignInView()
            
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
    
        RegisterView().environmentObject(SessionStore())
            
        }
    }
