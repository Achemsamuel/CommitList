//
//  CommitListViewControllerTest.swift
//  CommitListTests
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import CommitList

class CommitListViewControllerTest: FBSnapshotTestCase {

    var sut: CommitListViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: CommitListViewController.self)) as? CommitListViewController else {
            return XCTFail("Could not instantiate CommitListViewController from storyboard")
        }
        sut = vc
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func verifyView() {
        FBSnapshotVerifyView(sut.view)
    }
    
    func testViewModelNotNil() {
        XCTAssertNotNil(sut.viewModel)
    }
}
