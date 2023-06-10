extension Sequence {
	public func keyed<Key>(
		by keyForValue: (Element) -> Key,
		uniquingKeysWith combine: ((Element, Element) -> Element)? = nil
	) -> [Key: Element] {
		withoutActuallyEscaping(keyForValue) { keyForValue in
			if let combine {
				return Dictionary(self.lazy.map { (keyForValue($0), $0) }, uniquingKeysWith: combine)
			} else {
				return Dictionary(uniqueKeysWithValues: self.lazy.map { (keyForValue($0), $0) } )
			}
		}
	}
}
