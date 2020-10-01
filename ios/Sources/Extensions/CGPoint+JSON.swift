/*
 * This file is part of the Scandit Data Capture SDK
 *
 * Copyright (C) 2020- Scandit AG. All rights reserved.
 */

import Foundation

extension CGPoint {
    var jsonString: String {
        return """
        {"x": \(x), "y":\(y)}
        """
    }

    init?(json: String) {
        guard let data = json.data(using: .utf8) else { return nil}
        guard let object = try? JSONSerialization.jsonObject(with: data, options: []) else { return nil }
        let point = RCTConvert.cgPoint(object)

        self.init(x: point.x, y: point.y)
    }
}
