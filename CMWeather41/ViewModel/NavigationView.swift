//
//  NavigationView.swift
//  CMWeather41
//
//  Created by cmStudent on 2023/02/13.
//

import SwiftUI

struct NavigationView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        Menu(content: {
            Button(action: {
                viewModel.selectedArea(area: .Ibaraki)
            }, label: {
                Text("茨城")
            })
            Button(action: {
                viewModel.selectedArea(area: .Gunma)
            }, label: {
                Text("群馬")
            })
            Button(action: {
                viewModel.selectedArea(area: .Tochigi)
            }, label: {
                Text("栃木")
            })
            Button(action: {
                viewModel.selectedArea(area: .Chiba)
            }, label: {
                Text("千葉")
            })
            Button(action: {
                viewModel.selectedArea(area: .Kanagawa)
            }, label: {
                Text("神奈川")
            })
            Button(action: {
                viewModel.selectedArea(area: .Saitama)
            }, label: {
                Text("埼玉")
            })
            Button(action: {
                viewModel.selectedArea(area: .Toyko)
            }, label: {
                Text("東京")
            })
        }, label: {
            Image(systemName: "list.bullet")
        })
    }
}
