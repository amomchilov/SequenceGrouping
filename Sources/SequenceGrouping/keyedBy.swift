extension Sequence {
	public func keyed<Key>(
		by keyForValue: (Element) throws -> Key,
		uniquingKeysWith combine: ((Key, Element, Element) throws -> Element)? = nil
	) rethrows -> [Key: Element] {
		var result = [Key: Element]()

		if combine != nil {
			for element in self {
				let key = try keyForValue(element)
				
				if let oldValue = result.updateValue(element, forKey: key) {
					// Need to use a force unwrap otherwise you get this error:
					// ❌ Call can throw, but the error is not handled; a function declared 'rethrows' may only throw if its parameter does
					let valueToKeep = try combine!(key, oldValue, element)
					
					// This causes a second look-up for the same key. The standard library can avoid that
					// by calling `mutatingFind` to get access to the bucket where the value will end up,
					// and updating in place.
					// Swift Algorithms doesn't have access to that API, so we make due.
					// When this gets merged into the standard library, we should optimize this.
					result[key] = valueToKeep
				}
			}
		} else {
			for element in self {
				let key = try keyForValue(element)

				guard result.updateValue(element, forKey: key) == nil else {
				 fatalError("Duplicate values for key: '\(key)'")
				}
			}
		}

		return result
	}
}
