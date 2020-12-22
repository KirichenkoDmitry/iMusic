//
//  SearchPresenter.swift
//  iMusic
//
//  Created by Дмитрий Кириченко on 21.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
  
    switch response {
    case .some:
        print("presenter.some")
    case .presentTracks(let searchResults):
        searchResults?.results.map({ (track) in
            print(track.collectionName)
        })
        print("presenter.presentTracks")
        viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks)
    }
  }
  
}
