//
//  GroupListView.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import SwiftUI

struct GroupListView: View {
    
    @StateObject var viewModel: GroupListViewModel
    
    var body: some View {
        VStack {
            tableView
        }
        .onAppear(perform: onApperSend)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("GroupsList")
    }
}

private extension GroupListView {
    var tableView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.output.groupList) { model in
                groupButton(model: model)
            }
        }
    }
    
    @ViewBuilder func groupButton(model: GroupModel) -> some View {
        Button(action: {
            modelSend(model)
        }) {
            GroupCellView(model: model)
        }
    }
}

private extension GroupListView {
    
    func onApperSend() {
        viewModel.input.onAppear.send()
    }
    
    func modelSend(_ model: GroupModel) {
        print("MODEL SENDED")
        viewModel.input.model.send(model)
    }
}

//struct GroupListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupListView()
//    }
//}
