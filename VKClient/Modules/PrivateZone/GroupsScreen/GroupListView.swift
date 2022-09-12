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
        .padding(.top, 10)
        .onAppear(perform: onApperSend)
        .navigationTitle("Мои группы")
        .navigationBarColor(.white, textColor: .black)
    }
}

private extension GroupListView {
    var tableView: some View {
        List {
            ForEach(viewModel.output.groupList) { model in
                groupButton(model: model)
            }
        }
        .listStyle(.inset)
        .refreshable {
            withAnimation {
                onApperSend()
            }
        }
    }
    
    @ViewBuilder func groupButton(model: GroupModel) -> some View {
        GroupCellView(model: model)
            .onTapGesture {
                modelSend(model)
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
