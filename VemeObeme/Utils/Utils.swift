//
//  Utils.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 12/11/20.
//

import Foundation

func isValidEmail(email: String) -> Bool {
    if email.count > 100 {
        return false
    }
    let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: email)
}

func isValidPasword(pass: String) -> Bool {
    var result = false
    if (pass.isEmpty){
        result = false
    }else{
        result = true
    }
    return result
}

func formatDate(date: Date) -> Date{
    let formatter = DateFormatter()
    formatter.dateFormat = "E, dd MMM yyyy"
    let formatedDate = formatter.date(from: "\(date)")!
    return formatedDate
}

func convertDateToString(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    let formatedDate = formatter.string(from: date)
    return formatedDate
}
func convertOnlyDateToString(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "dd 'de' MMMM, 'del' yyyy"
    let formatedDate = formatter.string(from: date)
    return formatedDate
}
