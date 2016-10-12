
import SwiftShell
import Foundation

extension String {
	func subString(between: String, and: String) -> String? {
		guard let start = range(of: between)?.upperBound,
			let end = range(of: and, range: start..<endIndex)?.lowerBound
			else { return nil }
		return self[start..<end]
	}
}

typealias TestFunctions = [(class: String, funcs: [String])]

func getTestFunctions(_ input: ReadableStream) -> TestFunctions {
	var result = TestFunctions()
	for line in input.lines() {
		if line.contains("XCTestCase"),
			let classname = line.subString(between: "class", and: ":")?.trimmingCharacters(in: .whitespaces) {

			result.append((classname,[]))

		} else if var currentclass = result.last,
			let newfunc = line.subString(between: "func ", and: "()")?.trimmingCharacters(in: .whitespaces),
			newfunc.hasPrefix("test") {

			currentclass.funcs.append(newfunc)
			result[result.endIndex-1] = currentclass
		}
	}
	return result
}

guard let swiftfile = try main.arguments.first.map ({try open($0)}) else {
	exit(errormessage: "Missing argument for swift file")
}

print(getTestFunctions(swiftfile))
