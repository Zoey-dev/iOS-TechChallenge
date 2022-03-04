//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @StateObject var viewModel = TransactionViewModel()
    
    var body: some View {
        
        ZStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.allHeaderData, id: \.id) { value in
                            Button {
                                viewModel.getEachCategory(eachCategory: value.category)
                                viewModel.total = 0
                                viewModel.calculateTotalAmount(eachCategory: value.category)
                                viewModel.categoryColor = value
                            } label: {
                                Text(value.category)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .padding(.horizontal, 20)
                                    .font(.system(.title2))
                                
                            } .frame(height: 50)
                                .background(viewModel.getHeaderColors(color: value))
                                .cornerRadius(25)
                            
                        }
                    }.padding()
                }.frame(height: 80)
                    .background(Color("headerColor"))
                
                List {
                    ForEach(viewModel.singleCategory) { transaction in
                        TransactionView(transaction: .constant(transaction))
                            .onTapGesture {
                                for i in 0..<viewModel.singleCategory.count {
                                    if viewModel.singleCategory[i].id == transaction.id {
                                        viewModel.singleCategory[i].pin = !viewModel.singleCategory[i].pin
                                        
                                    }
                                    
                                }
                                viewModel.calculateTotalAmount(eachCategory: viewModel.category)
                            }
                    }
                }
                
                VStack {
                    HStack {
                        Spacer()
                        Text(viewModel.category)
                            .foregroundColor(viewModel.getHeaderColors(color: viewModel.categoryColor))
                    }
                    
                    HStack {
                        Text("Total Spent:")
                        Spacer()
                        Text(viewModel.total.delimiter)
                            .bold()
                    }
                }.padding(.horizontal, 10)
                    .frame(height: 90)
                    .border(Color.black, width: 2)
                    .cornerRadius(8)
                    .padding([.bottom, .trailing, .leading], 9)
            }
            
        }.animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
