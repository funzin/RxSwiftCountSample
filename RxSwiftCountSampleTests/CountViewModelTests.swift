//
//  CountViewModelTests.swift
//  RxSwiftCountSampleTests
//
//  Created by 中澤 郁斗 on 2019/12/20.
//  Copyright © 2019 funzin. All rights reserved.
//

import RxCocoa
import RxSwift
import XCTest
@testable import RxSwiftCountSample

class CountViewModelTests: XCTestCase {

    private var viewModel: CountViewModel!
    private var plusButtonTap: PublishRelay<Void>!
    private var minusButtonTap: PublishRelay<Void>!

    override func setUp() {
        plusButtonTap = PublishRelay()
        minusButtonTap = PublishRelay()
        viewModel = CountViewModel(plusButtonTap: plusButtonTap.asObservable(),
                                   minusButtonTap: minusButtonTap.asObservable())
    }

    override func tearDown() {}

    func test_init() {
        let count = BehaviorRelay(value: "not initialized yet")

        let disposable = viewModel.count.bind(to: count)

        XCTAssertEqual(count.value, "0")
        disposable.dispose()
    }

    func test_plusButtonTap() {
        let count = BehaviorRelay(value: "not initialized yet")

        let disposable = viewModel.count.bind(to: count)
        plusButtonTap.accept(())

        XCTAssertEqual(count.value, "1")
        disposable.dispose()
    }

    func test_minusButtonTap() {
        let count = BehaviorRelay(value: "not initialized yet")

        let disposable = viewModel.count.bind(to: count)
        minusButtonTap.accept(())

        XCTAssertEqual(count.value, "-1")
        disposable.dispose()
    }
}
