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
                Text("WOP")
                    .font(.system(size: 42,weight: .bold))
                    .foregroundColor(Color.blue)
                    .padding(.top, 10)
                
                Spacer()
                
                VStack {
                    
                    
                    Text("Välkommen Tillbaka!")
                        .font(.title).fontWeight(.bold)
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
                    
                    
                    NavigationLink(destination: MainPageView(isShowingMainPage: $isShowingMainPage), isActive: $isShowingMainPage){ EmptyView()}
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
                Spacer()
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
            .navigationBarHidden(true)
            .onAppear(perform: getUser)
            .padding(.horizontal, 32)
            .padding(.bottom, 10)
        }
        .navigationBarHidden(true)
        
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
            Spacer()
            Text("Registrera Dig")
                .font(.title).fontWeight(.bold)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Text("skapa ett konto för att komma igång")
                .foregroundColor(.gray)
            
            VStack{
                TextField("Email adress", text: $email)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5) .strokeBorder(Color.black,lineWidth: 1))
                    //.padding(.horizontal,30)
                    .padding(.vertical, 7)
                SecureField("Lösenord", text: $password)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5) .strokeBorder(Color.black,lineWidth: 1))
                  //  .padding(.horizontal,30)
                                    Button(action: signUp){
                    Text("Skapa konto")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height:50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                        
                }
                                    .padding(EdgeInsets(top:50, leading: 0, bottom: 0, trailing: 0))
                
            }
            .padding(.vertical,64)
         //   .padding(.horizontal, 30)
            
            
            
            Spacer()
            
        }
        .navigationBarTitle("WOP")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
       
            
            .onAppear(perform: getUser)
            
            
            .padding(.horizontal,32)
        
    }
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.blue]
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
