extension Sequence {
	public func grouped<GroupKey>(
		by keyForValue: (Element) -> GroupKey
	) -> [GroupKey: [Element]] {
		Dictionary(grouping: self, by: keyForValue)
	}
}
