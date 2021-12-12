//
//  SectionType.swift
//  Pods
//
//  Created by porohov on 12.12.2021.
//

import Foundation

public struct OldSection<GeneratorType, HeaderGeneratorType, FooterGeneratorType> {
    public var generators: [[GeneratorType]]
    public var headers: [HeaderGeneratorType]
    public var footers: [FooterGeneratorType]

    public init(generators: [[GeneratorType]], headers: [HeaderGeneratorType], footers: [FooterGeneratorType]) {
        self.generators = generators
        self.headers = headers
        self.footers = footers
    }
}

public struct SectionType<GeneratorType, HeaderGeneratorType, FooterGeneratorType> {
    public var generators: [GeneratorType]
    public var header: HeaderGeneratorType
    public var footer: FooterGeneratorType

    public init(generators: [GeneratorType], header: HeaderGeneratorType, footer: FooterGeneratorType) {
        self.generators = generators
        self.header = header
        self.footer = footer
    }
}
