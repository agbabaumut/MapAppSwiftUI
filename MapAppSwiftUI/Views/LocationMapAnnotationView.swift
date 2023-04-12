//
//  LocationMapAnnotationView.swift
//  MapAppSwiftUI
//
//  Created by Umut Ağbaba on 12.04.2023.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(Color.white)
                .padding(6.0)
                .background(accentColor)
                .cornerRadius(36.0)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 60)
            
            
        }
        
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
    }
}
