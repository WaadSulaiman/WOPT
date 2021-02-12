//
//  RegisterView.swift
//  WOPT
//
//  Created by Waad on 2021-02-11.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var losenord: String = ""
    @State var error: String = ""
    
    
    var body: some View {
        
        VStack {
            Text("WOPT")
                .font(.system(size: 42,weight: .bold))
                .foregroundColor(Color.blue)
                .padding()
            
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
                
                SecureField("Lösenord", text: $losenord)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.black, lineWidth: 1))
            }
            .padding(.vertical, 48)
            
            Button(action: loggaIn, label: {
                Text("Logga in")
                .frame(minWidth: 0,  maxWidth: .infinity)
                .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    
                    
                    
                
            })
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
        .padding(.horizontal, 32)
        
    }
}
func loggaIn(){
    
}

struct SignUpView: View{
    @State var email: String = ""
    @State var losenord: String = ""
    @State var error: String = ""
    
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
                
                SecureField("Lösenord", text: $losenord)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5) .strokeBorder(Color.black,lineWidth: 1))
                    .padding(.horizontal,30)
            }
            .padding(.vertical,64)
            
            
            Text("Skapa konto")
                
        }
        
        Spacer()
        
        
        
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
        Group {
            RegisterView()
            RegisterView()
        }
    }
}
