//
//  HomeViewModel.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/07.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    // For NewData Sheet
    @Published var isNewData = false
    
    // Checking And Updating Date
    let calender = Calendar.current
    
    func checkDate() -> String {
        if calender.isDateInToday(date) {
            return "Today"
        } else if calender.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return "Other day"
        }
    }
    
    func updateDate(value: String) {
        if value == "Today" {
            date = Date()
        } else if value == "Tomorrow" {
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        } else {
            // do something
        }
    }
    
    func writeData(context: NSManagedObjectContext) {
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        // saving data
        do {
            try context.save()
            
            // success means closing view
            isNewData.toggle()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
