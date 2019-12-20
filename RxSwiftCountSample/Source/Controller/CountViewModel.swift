//
//  CountViewModel.swift
//  RxSwiftCountSample
//
//  Created by 中澤 郁斗 on 2019/12/20.
//

import RxCocoa
import RxSwift

final class CountViewModel {

    private let _count = BehaviorRelay(value: 0)
    let count: Observable<String>

    private let disposeBag = DisposeBag()

    init(plusButtonTap: Observable<Void>,
         minusButtonTap:  Observable<Void>) {

        Observable<Operation>.merge(plusButtonTap.map { .plus },
                                    minusButtonTap.map { .minus })
            .withLatestFrom(_count) { ($0, $1) }
            .map { operation, count -> Int in
                switch operation {
                case .plus:
                    return count + 1
                case .minus:
                    return count - 1
                }
            }
            .bind(to: _count)
            .disposed(by: disposeBag)

        count = _count.map { String($0) }
    }
}

extension CountViewModel {

    private enum Operation: Int, Equatable {
        case plus
        case minus
    }
}
