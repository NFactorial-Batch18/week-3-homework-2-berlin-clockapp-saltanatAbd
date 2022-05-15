//
//  ContentView.swift
//  Berlin Clock
//
//  Created by Saltanat Kuanyshbek on 10.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date()
    @State var berlinClockArray: [String] = []
    
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.1))
                .ignoresSafeArea(.all, edges: .all)
            VStack(alignment: .center, spacing: 10){
                VStack{
                    Text("Time is \(currentTime, format: Date.FormatStyle().hour().minute().second())")
                        .environment(\.locale, Locale(identifier: "ru_Ru"))
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.bottom,20)
                    ZStack{
                        clockInterface()
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 255/245, green: 255/245, blue: 255/245))
                            .frame(width: 358, height: 54, alignment: .center)
                            .shadow(radius: 7)
                        HStack{
                            Text("Insert time")
                            DatePicker("00", selection: $currentTime, displayedComponents: .hourAndMinute)
                                .datePickerStyle(.compact)
                                .environment(\.locale, Locale(identifier: "ru_Ru"))
                            
                        }.padding(.horizontal, 30)
                    }
                }
            }.padding(.bottom, 270)
        }.onAppear {
            getTimeComponents(currentTime: currentTime)
        }
    }
}

private  func getTimeComponents(currentTime:Date){
    let calender = Calendar.current
    let sec = calender.component(.second, from: currentTime)
    let min = calender.component(.minute, from: currentTime)
    let hour = calender.component(.hour, from: currentTime)
}

struct Time{
    var sec: Int
    var min: Int
    var hour:Int
}

struct clockInterface: View{
    //@Binding var currentTime = Date()
    var body: some View{
        let berlinClockArray  = ["Y", "R", "R", "O", "O",
                                 "O", "O", "O", "O",
                                 "YYR", "YYR", "YYR", "YY",
                                 "Y","Y", "Y", "O"]
        ZStack{
            VStack(alignment: .center, spacing: 10){
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 255/245, green: 255/245, blue: 255/245))
                            .frame(width: 358, height: 312, alignment: .center)
                            .shadow(radius: 7)
                        VStack{
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 56, height: 56, alignment: .center)
                            
                            HStack(alignment: .center, spacing: 10){
                                ForEach((1..<5)) { i in
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 74, height: 32, alignment: .center)
                                        .foregroundColor(berlinClockArray[i] == "R" ? Color.red : Color.red.opacity(0.2))
                                    
                                }
                            }
                            HStack(alignment: .center, spacing: 10){
                                ForEach((1..<5)) { i in
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 74, height: 32, alignment: .center)
                                        .foregroundColor(berlinClockArray[i] == "R" ? Color.red : Color.red.opacity(0.2))
                                }
                            }
                            HStack(alignment: .center, spacing: 10){
                                ForEach((1..<12)) { i in
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 21, height: 32, alignment: .center)
                                        .foregroundColor(berlinClockArray[i] == "YYR" ? Color.red : Color.red.opacity(0.2))
                                }
                            }
                            HStack(alignment: .center, spacing: 10){
                                ForEach((1..<5)) { i in
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 74, height: 32, alignment: .center)
                                        .foregroundColor(berlinClockArray[i] == "Y" ? Color.red : Color.red.opacity(0.2))
                                }
                            }
                            
                        }.padding(.horizontal, 16)
                            .padding(.vertical,32)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}

