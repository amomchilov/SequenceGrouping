extension Sequence {
	public func grouped<GroupKey>(
		by keyForValue: (Element) throws -> GroupKey
	) rethrows -> [GroupKey: [Element]] {
		try Dictionary(grouping: self, by: keyForValue)
	}
}
