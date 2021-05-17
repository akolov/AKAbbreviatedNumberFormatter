import Foundation

open class AKAbbreviatedNumberFormatter: NumberFormatter {

  public struct Abbrevation {
    let threshold: Decimal
    let divisor: Decimal
    let suffix: String

    public init(threshold: Decimal, divisor: Decimal, suffix: String) {
      self.threshold = threshold
      self.divisor = divisor
      self.suffix = suffix
    }
  }

  open var abbreviations: [Abbrevation] = [
    .init(threshold: 0, divisor: 1, suffix: ""),
    .init(threshold: 1_000, divisor: 1_000, suffix: "K"),
    .init(threshold: 100_000, divisor: 1_000_000, suffix: "M"),
    .init(threshold: 100_000_000, divisor: 1_000_000_000, suffix: "B")
  ]

  open override func string(from number: NSNumber) -> String? {
    let decimal = NSDecimalNumber(decimal: number.decimalValue)
    let abbreviation: Abbrevation = {
      var prevAbbreviation = abbreviations[0]
      for tmpAbbreviation in abbreviations {
        if decimal.compare(tmpAbbreviation.threshold as NSDecimalNumber) == .orderedAscending {
          break
        }
        prevAbbreviation = tmpAbbreviation
      }
      return prevAbbreviation
    }()

    let value = decimal.dividing(by: abbreviation.divisor as NSDecimalNumber)
    positiveSuffix = abbreviation.suffix
    negativeSuffix = abbreviation.suffix
    allowsFloats = true
    minimumIntegerDigits = 1
    minimumFractionDigits = 0
    maximumFractionDigits = 1

    return super.string(from: value)
  }

}
