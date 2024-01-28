//
//  RunPythonCode.swift
//  Stock Sense
//
//  Created by Nishanth Gandhe on 1/28/24.
//

import Foundation
import PythonKit

func RunPythonScript() -> PythonObject {
    let sys = Python.import("sys")
    sys.path.append("/Users/nishanthgandhe/Downloads/Stock Sense/Stock Sense/")
    let file = Python.import("PythonCode")
    
    let response = file.hello()
    print(response)
    return response
}

