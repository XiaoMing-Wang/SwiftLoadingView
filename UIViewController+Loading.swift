//
//  UIViewController+Loading.swift
//  IM_Client_Swift
//
//  Created by wq on 2020/5/31.
//  Copyright © 2020 wq. All rights reserved.
//
import UIKit
import Foundation


extension UIViewController {
    
    func currentSelf() -> Bool {
        return self.navigationController?.visibleViewController == self
    }
    
    func showLoading() {
        if currentSelf() { WXMLoadingView.hiddenLoadingSuper(supMedium: self.navigationController) }
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loading,
                                        iType: .def,
                                        message: "",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showLoadViewFull() {
        if currentSelf() { WXMLoadingView.hiddenLoadingSuper(supMedium: self.navigationController) }
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loading,
                                        iType: .full,
                                        message: "",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showLoadViewDisable() {
        if currentSelf() { WXMLoadingView.hiddenLoadingSuper(supMedium: self.navigationController) }
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loading,
                                        iType: .disable,
                                        message: "",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showLoadViewForbid() {
        if currentSelf() { WXMLoadingView.hiddenLoadingSuper(supMedium: self.navigationController) }
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loading,
                                        iType: .forbid,
                                        message: "",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showLoadingMessage(_ message: String) {
        if currentSelf() { WXMLoadingView.hiddenLoadingSuper(supMedium: self.navigationController) }
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loadingMessage,
                                        iType: .disable,
                                        message: message,
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showMessage(_ message: String) {
        WXMLoadingView.showLoadingSuper(supMedium: self.navigationController ?? self,
                                        loadType: .message,
                                        iType: .def,
                                        message: message,
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showSuccessMessage(_ message: String?) {
        WXMLoadingView.showLoadingSuper(supMedium: self.navigationController ?? self,
                                        loadType: .success,
                                        iType: .def,
                                        message: message ?? " ",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showFailMessage(_ message: String?) {
        WXMLoadingView.showLoadingSuper(supMedium: self.navigationController ?? self,
                                        loadType: .fail,
                                        iType: .def,
                                        message: message ?? " ",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
        
}

extension UIView {
    
    func showLoading() {
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loading,
                                        iType: .def,
                                        message: "",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showLoadViewFull() {
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loading,
                                        iType: .full,
                                        message: "",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showLoadViewDisable() {
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loading,
                                        iType: .disable,
                                        message: "",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showLoadViewForbid() {
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loading,
                                        iType: .forbid,
                                        message: "",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showLoadingMessage(_ message: String) {
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .loadingMessage,
                                        iType: .disable,
                                        message: message,
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showMessage(_ message: String) {
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .message,
                                        iType: .def,
                                        message: message,
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showSuccessMessage(_ message: String?) {
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .success,
                                        iType: .def,
                                        message: message ?? " ",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    func showFailMessage(_ message: String?) {
        WXMLoadingView.showLoadingSuper(supMedium: self,
                                        loadType: .fail,
                                        iType: .def,
                                        message: message ?? " ",
                                        yMargin: WXMLoadMargin,
                                        delay: 0)
    }
    
    
}
