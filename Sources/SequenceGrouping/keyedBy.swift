extension Sequence {
	public func keyed<Key>(
		by keyForValue: (Element) -> Key
	) -> [Key: Element] {
		withoutActuallyEscaping(keyForValue) { keyForValue in
			return Dictionary(uniqueKeysWithValues: self.lazy.map { (keyForValue($0), $0) } )
		}
	}
}
