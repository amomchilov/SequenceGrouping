extension Sequence {
	public func keyed<Key>(
		by keyForValue: (Element) throws -> Key,
		uniquingKeysWith combine: ((Element, Element) throws -> Element)? = nil
	) rethrows -> [Key: Element] {
		try withoutActuallyEscaping(keyForValue) { keyForValue in
			if let combine {
				return try Dictionary(self.lazy.map { (try keyForValue($0), $0) }, uniquingKeysWith: combine)
			} else {
				return try Dictionary(uniqueKeysWithValues: self.lazy.map { (try keyForValue($0), $0) } )
			}
		}
	}
}
