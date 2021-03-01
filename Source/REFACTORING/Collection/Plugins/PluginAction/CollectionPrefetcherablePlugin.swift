//
//  CollectionPrefetcherablePlugin.swift
//  ReactiveDataDisplayManager
//
//  Created by Anton Eysner on 12.02.2021.
//  Copyright © 2021 Александр Кравченков. All rights reserved.
//

/// Plugin to support `PrefetcherableFlow` with prefetcher
///
/// `ContentPrefetcher` prefetches and caches data to eliminate delays when requesting the same data later.
public class CollectionPrefetcherablePlugin<Prefetcher: ContentPrefetcher, Generator: PrefetcherableFlow>: BaseCollectionPlugin<PrefetchEvent> {

    // MARK: - Private Properties

    private let prefetcher: Prefetcher

    // MARK: - Initialization

    /// - parameter prefetcher: Prefetches and caches data to eliminate delays when requesting the same data later.
    init(prefetcher: Prefetcher) {
        self.prefetcher = prefetcher
    }

    // MARK: - BaseCollectionPlugin

    public override func process(event: PrefetchEvent, with manager: BaseCollectionManager?) {
        switch event {
        case .prefetch(let indexPaths):
            startPrefetching(from: manager, at: indexPaths)
        case .cancelPrefetching(let indexPaths):
            cancelPrefetching(from: manager, at: indexPaths)
        }
    }

}

// MARK: - Private Methods

private extension CollectionPrefetcherablePlugin {

    func startPrefetching(from manager: BaseCollectionManager?, at indexPaths: [IndexPath]) {
        let contents = indexPaths.compactMap { getPrefetcherableFlowCell(from: manager, at: $0)?.requestId as? Prefetcher.Content }
        prefetcher.startPrefetching(for: contents)
    }

    func cancelPrefetching(from manager: BaseCollectionManager?, at indexPaths: [IndexPath]) {
        let contents = indexPaths.compactMap { getPrefetcherableFlowCell(from: manager, at: $0)?.requestId as? Prefetcher.Content }
        prefetcher.cancelPrefetching(for: contents)
    }

    func getPrefetcherableFlowCell(from manager: BaseCollectionManager?, at indexPath: IndexPath) -> Generator? {
        return manager?.generators[safe: indexPath.section]?[safe: indexPath.row] as? Generator
    }

}

// MARK: - Public init

public extension BaseCollectionPlugin {

    /// Plugin to support `PrefetcherableFlow` with prefetcher
    ///
    /// - parameter prefetcher: Prefetches and caches data to eliminate delays when requesting the same data later.
    static func prefetch<Prefetcher: ContentPrefetcher,
                         Generator: PrefetcherableFlow>(prefetcher: Prefetcher) -> CollectionPrefetcherablePlugin<Prefetcher, Generator> {
        .init(prefetcher: prefetcher)
    }

}
