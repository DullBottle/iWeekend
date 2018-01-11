//
//  InsViewReactor.swift
//  Midas
//
//  Created by __End on 2018/1/11.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import ReactorKit
import RxSwift

class InsViewReactor: Reactor {
    
    enum Action {
        case refresh
    }
    
    enum Mutation {
        case setRefreshing(Bool)
        case setNode([Ins])
    }
    
    struct State {
        var isRefreshing: Bool = false
        var list: [Ins] = []
    }
    
    let initialState = State()
    
    fileprivate let insService: InsServiceType
    
    init(service: InsServiceType) {
        self.insService = service
        _ = self.state
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .refresh:
            guard !self.currentState.isRefreshing else { return Observable.empty() }
            let startRefreshing = Observable<Mutation>.just(.setRefreshing(true))
            let endRefreshing = Observable<Mutation>.just(.setRefreshing(false))
            let setNode = self.insService.instagram("").asObservable().map { ins -> Mutation in
                return .setNode([ins])
            }
            return .concat([startRefreshing, setNode, endRefreshing])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setRefreshing(let isRefreshing):
            state.isRefreshing = isRefreshing
            return state
        case .setNode(let list):
            state.list = list
            return state
        }
    }
    
}
