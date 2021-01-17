//
//  DateFormatterExtension.swift
//  BayutDubizzle
//
//  Created by Arya Menon K on 17/01/2021.
//  Copyright © 2021 BayutDubizzle. All rights reserved.
//

import Foundation


extension DateFormatter {
    convenience init(format: String) {
        self.init()
        locale = Locale(identifier: "en_US_POSIX")
        dateFormat = format
    }
}

extension String {
    func formattedDate(from fromDateFormat: String,to toDateFormat: String) -> String? {
        let dateFormatter = DateFormatter(format: fromDateFormat)
        guard let date = dateFormatter.date(from: self) else { return nil }
        
        dateFormatter.dateFormat = toDateFormat
        return dateFormatter.string(from: date)
    }
}
