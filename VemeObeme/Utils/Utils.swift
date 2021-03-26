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
    formatter.locale = Locale(identifier: "es_MX_POSIX")
    let formatedDate = formatter.date(from: "\(date)")!
    return formatedDate
}
func convertDateToString(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "es_MX_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    let formatedDate = formatter.string(from: date)
    return formatedDate
}
func convertOnlyDateToString(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "es_MX_POSIX")
    formatter.dateFormat = "dd 'de' MMMM, 'del' yyyy"
    let formatedDate = formatter.string(from: date)
    return formatedDate
}
func convertOnlyHourToString(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "es_MX_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    let formatedDate = formatter.string(from: date)
    return formatedDate
}
func formatStringDateForShowing(date: String) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "es_MX_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
    let formatedDate = formatter.date(from: date)!
    formatter.dateFormat = "dd 'de' MMMM, 'del' yyyy"
    let formatedDateString = formatter.string(from: formatedDate)
    return formatedDateString
}
func getMonthStringDateForShowing(date: String) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "es_MX_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
    let formatedDate = formatter.date(from: date)!
    formatter.dateFormat = "MMMM YYYY"
    let formatedDateString = formatter.string(from: formatedDate)
    return formatedDateString
}
