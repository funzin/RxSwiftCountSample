//
//  CountViewController.swift
//  RxSwiftCountSample
//
//  Created by 中澤 郁斗 on 2019/12/20.
//  Copyright © 2019 funzin. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

final class CountViewController: UIViewController {

    @IBOutlet private var countLabel: UILabel!
    @IBOutlet private var plusButton: UIButton!
    @IBOutlet private var minusButton: UIButton!

    private lazy var viewModel = CountViewModel(plusButtonTap: plusButton.rx.tap.asObservable(),
                                                minusButtonTap: minusButton.rx.tap.asObservable())
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.count
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

