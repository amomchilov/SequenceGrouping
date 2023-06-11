extension Sequence {
	public func keyed<Key>(
		by keyForValue: (Element) throws -> Key,
		// TODO: pass `Key` into `combine`: (Key, Element, Element) throws -> Element
		uniquingKeysWith combine: ((Element, Element) throws -> Element)? = nil
	) rethrows -> [Key: Element] {
		// Note: This implementation is a bit convoluted, but it's just aiming to reuse the existing stdlib logic,
		// to ensure consistent behaviour, error messages, etc.
		// If this API ends up in the stdlib itself, it could just call the underlying `_NativeDictionary` methods.
		try withoutActuallyEscaping(keyForValue) { keyForValue in
			if let combine {
				return try Dictionary(self.lazy.map { (try keyForValue($0), $0) }, uniquingKeysWith: combine)
			} else {
				return try Dictionary(uniqueKeysWithValues: self.lazy.map { (try keyForValue($0), $0) } )
			}
		}
	}
}
