//
//  WXMLoadingView.swift
//  IM_Client_Swift
//
//  Created by wq on 2020/5/31.
//  Copyright © 2020 wq. All rights reserved.
//

import UIKit
import Foundation

enum WXMInteractionType {
    case def
    case disable
    case full
    case forbid
}

enum WXMLoadingType {
    case loading
    case loadingMessage
    case message
    case success
    case fail
}

class WXMLoadingView: UIView {
    fileprivate var loadType: WXMLoadingType = .loading
    fileprivate var iType: WXMInteractionType = .def
    fileprivate var delay: CGFloat = 0.0
    fileprivate var yMargin: CGFloat = 0.0

    fileprivate weak var displayView: UIView!
    fileprivate weak var displayController: UIViewController!

    fileprivate var contontMessage: String?
    fileprivate var exsitBefore: Bool = false
    fileprivate var needOffset: Bool = false
    fileprivate var gesture: Bool = true
    fileprivate var advanceCancel: Bool = false

    /// 配置结构体
    fileprivate let cof: WXMLoadCof = WXMLoadCof()

    /// 显示菊花
    class func showLoadingSuper(supMedium: AnyObject,
        loadType: WXMLoadingType,
        iType: WXMInteractionType,
        message: String,
        yMargin: CGFloat,
        delay: CGFloat) {

        var currentLoad: WXMLoadingView? = currentLoading(supMedium: supMedium)
        if currentLoad == nil { currentLoad = WXMLoadingView.init() }
        if supMedium is UIViewController {
            currentLoad?.displayController = supMedium as? UIViewController
        }

        currentLoad?.iType = iType
        currentLoad?.tag = WXMLoadTag
        currentLoad?.displayView = supViewSupMedium(supMedium: supMedium)
        currentLoad?.loadType = loadType
        currentLoad?.contontMessage = message
        currentLoad?.yMargin = yMargin
        currentLoad?.delay = delay
        currentLoad?.differentInterfaces()
        currentLoad?.differentConfiguration()
        currentLoad?.displaySupView()
    }

    /// 隐藏
    class func hiddenLoadingSuper(supMedium: AnyObject?) {
        if supMedium == nil { return }
        let currentLoad: WXMLoadingView? = currentLoading(supMedium: supMedium!)
        currentLoad?.reductionGestures()
        currentLoad?.removeFromSuperview()
    }

    @objc fileprivate func hideLoadView() {
        if loadType == .loading { return }
        self.reductionGestures()
        self.removeFromSuperview()
    }

    /// 设置不同的界面
    fileprivate func differentInterfaces() {

        frame = displayView.bounds
        contentView.layer.cornerRadius = cof.loadRounded

        switch iType {
        case .def:

            isUserInteractionEnabled = false
            backgroundColor = UIColor.clear

        case .disable:

            isUserInteractionEnabled = true
            backgroundColor = UIColor.clear

        case .full:

            isUserInteractionEnabled = true
            backgroundColor = cof.fullColor

        case .forbid:

            isUserInteractionEnabled = true
            backgroundColor = UIColor.clear

            let nav: UINavigationController? = displayController.navigationController ?? nil
            nav?.interactivePopGestureRecognizer!.isEnabled = false
            if exsitBefore == false {
                self.gesture = nav?.interactivePopGestureRecognizer!.isEnabled ?? true
            }
        }

        for view in contentView.subviews {
            view.removeFromSuperview()
        }

        /// 配置message
        let messageCof = { () -> (CGFloat, CGFloat) in
            self.messageLabel.text = self.contontMessage ?? " "
            let expected = CGSize.init(width: self.cof.loadMsgWidth, height: CGFloat(MAXFLOAT))
            let msgSize = self.messageLabel.sizeThatFits(expected)
            self.messageLabel.frame = CGRect.init(origin: .zero, size: msgSize)
            return (msgSize.width, msgSize.height)
        }

        switch self.loadType {
        case .loading:

            contentView.frame = CGRect.init(origin: .zero, size: cof.loadSize)
            contentView.layer.cornerRadius = cof.loadRounded
            contentView.addSubview(indicatorView)
            displayCenter(inCenter: true)

        case .message:

            let message = messageCof()
            let width = message.0 + cof.loadpadMargin * 2.0 + 6.0
            let height = message.1 + cof.loadpadMargin * 2.0 + 1.0
            contentView.frame = CGRect.init(origin: .zero, size: CGSize.init(width: width, height: height))
            contentView.layer.cornerRadius = cof.loadRounded
            contentView.addSubview(messageLabel)
            displayCenter(inCenter: true)

        case .loadingMessage:

            let message = messageCof()
            let width = max(message.0 + cof.loadpadMargin * 2.0 + 6.0, cof.loadSize.width)
            let height = cof.iconSide + message.1 + cof.loadpadAllMargin

            contentView.frame = CGRect.init(origin: .zero, size: CGSize.init(width: width, height: height))
            contentView.layer.cornerRadius = cof.loadRounded
            contentView.addSubview(indicatorView)
            contentView.addSubview(messageLabel)
            displayCenter(inCenter: false)

        case .success, .fail:

            let message = messageCof()
            let width = max(message.0 + cof.loadpadMargin * 2.0 + 6.0, cof.loadSize.width)
            let height = cof.iconSide + message.1 + cof.loadpadAllMargin

            if loadType == .success {
                iconImageView.image = UIImage.init(named: "MBHUD_Success")
            } else if loadType == .fail {
                iconImageView.image = UIImage.init(named: "MBHUD_Warn")
            }

            contentView.frame = CGRect.init(origin: .zero, size: CGSize.init(width: width, height: height))
            contentView.layer.cornerRadius = cof.loadRounded
            contentView.addSubview(iconImageView)
            contentView.addSubview(messageLabel)
            displayCenter(inCenter: false)
        }


        addSubview(contentView)
    }

    /// 不同的配置
    fileprivate func differentConfiguration() {

        reductionGestures()
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hideLoadView), object: nil)
        if loadType == .success || loadType == .fail || loadType == .message {
            self.perform(#selector(hideLoadView), with: nil, afterDelay: TimeInterval(cof.hideDelay))
        }

    }

    /// 还原手势
    func reductionGestures() {
        if displayController == nil { return }
        if displayController.navigationController == nil { return }
        if displayController.navigationController!.interactivePopGestureRecognizer == nil { return }
        displayController.navigationController!.interactivePopGestureRecognizer!.isEnabled = gesture

        if displayController is UINavigationController {
            (displayController as! UINavigationController).interactivePopGestureRecognizer!.isEnabled = gesture
        }
    }

    /// 显示
    fileprivate func displaySupView() {
        self.displayView.addSubview(self)
    }

    /// 是否显示在中心
    func displayCenter(inCenter: Bool) {
        let width = min(self.frame.size.width, UIScreen.main.bounds.size.width)
        let height = min(self.frame.size.height, UIScreen.main.bounds.size.height)
        contentView.center = CGPoint.init(x: width / 2.0, y: height / 2.0 + yMargin)

        let contentX = contentView.frame.size.width / 2.0
        let contentY = contentView.frame.size.height / 2.0
        if inCenter {

            self.indicatorView.center = CGPoint.init(x: contentX, y: contentY)
            self.messageLabel.center = CGPoint.init(x: contentX, y: contentY)

        } else {

            let x = (contentView.frame.size.width - cof.iconSide) / 2;
            let oringin = CGPoint.init(x: x, y: cof.loadpadMargin);
            let size = CGSize.init(width: cof.iconSide, height: cof.iconSide)
            iconImageView.frame = CGRect.init(origin: oringin, size: size)
            indicatorView.frame = CGRect.init(origin: oringin, size: size)

            let top = iconImageView.frame.origin.y + iconImageView.frame.size.height + cof.topBtmMargin
            messageLabel.frame = CGRect.init(origin: CGPoint.init(x: 0, y: top), size: messageLabel.frame.size)
            messageLabel.center = CGPoint.init(x: contentX, y: messageLabel.center.y)
        }

    }

    /// 获取
    fileprivate class func currentLoading(supMedium: AnyObject) -> WXMLoadingView? {
        let superView = supViewSupMedium(supMedium: supMedium)
        let currentLoading = superView?.viewWithTag(WXMLoadTag)
        if currentLoading is WXMLoadingView {
            (currentLoading as! WXMLoadingView).exsitBefore = true
            return currentLoading as? WXMLoadingView
        }
        return nil
    }

    /// 获取
    fileprivate class func supViewSupMedium(supMedium: AnyObject) -> UIView? {
        if supMedium is UIView {
            return (supMedium as! UIView)
        }

        if supMedium is UIViewController {
            return (supMedium as! UIViewController).view
        }
        return nil
    }

    //MARK: 懒加载
    public lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.backgroundColor = cof.backColor
        contentView.layer.cornerRadius = cof.loadRounded
        contentView.layer.masksToBounds = true
        return contentView
    }()

    public lazy var indicatorView: UIActivityIndicatorView = {
        var indicatorView = UIActivityIndicatorView.init(style: .whiteLarge)
        indicatorView.hidesWhenStopped = false
        indicatorView.startAnimating()
        return indicatorView
    }()

    public lazy var messageLabel: UILabel = {
        var messageLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        messageLabel.textAlignment = .center
        messageLabel.font = cof.loadFont
        messageLabel.textColor = UIColor.white
        messageLabel.numberOfLines = 0
        return messageLabel
    }()

    public lazy var iconImageView: UIImageView = {
        let wh = cof.iconSide
        var iconImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: wh, height: wh))
        return iconImageView
    }()
}

