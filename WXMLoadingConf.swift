//
//  WXMLoadingConf.swift
//  IM_Client_Swift
//
//  Created by wq on 2020/5/31.
//  Copyright © 2020 wq. All rights reserved.
//
import UIKit
import Foundation

/// 配置
let WXMLoadTag: Int = 20555
let WXMLoadMargin: CGFloat = -10.0


struct WXMLoadCof {

    /// load最小size
    let loadSize: CGSize = CGSize.init(width: 76.5, height: 77.5)

    /// 状态大小
    let iconSide: CGFloat = 35.0

    /// 隐藏时间
    let hideDelay: CGFloat = 3.50

    /** 字体 */
    let loadFont: UIFont = UIFont.systemFont(ofSize: 16)

    /** tag */
    let loadTag: Int = 20555

    /** 外边距 */
    let loadOutsideMargin: CGFloat = 45.0

    /// 内边距
    let loadpadMargin: CGFloat = 18.0

    /** 上下间距 */
    let topBtmMargin: CGFloat = 10.5

    /// 宽度
    let sWidth: CGFloat = UIScreen.main.bounds.width

    /** 圆角 */
    let loadRounded: CGFloat = 12.0

    /** 全屏颜色 */
    let fullColor: UIColor = UIColor.white
    let backColor: UIColor = UIColor.black

    /// message最大宽度
    var loadMsgWidth: CGFloat {
        get {
            return (sWidth - 2.0 * loadOutsideMargin - 2.0 * loadpadMargin)
        }
    }

    /// 所有的边距
    var loadpadAllMargin: CGFloat {
        get {
            return (2.0 * loadpadMargin + topBtmMargin)
        }
    }


}
