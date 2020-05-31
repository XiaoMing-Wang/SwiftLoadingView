//
//  WXMLoadingConf.swift
//  IM_Client_Swift
//
//  Created by wq on 2020/5/31.
//  Copyright © 2020 wq. All rights reserved.
//
import UIKit
import Foundation

/** loading大小 */
let WXMLoadSize : CGSize = CGSize.init(width: 76.5, height: 77.5)

/** 状态大小 */
let WXMLoadStatusSize : CGSize = CGSize.init(width: 93.5, height: 93.5)
let WXMLoadIconSize : CGFloat = 35.0

/** 隐藏时间 */
let WXMHideDelay : CGFloat = 3.50

/** 字体 */
let WXMLoadFont : UIFont = UIFont.systemFont(ofSize: 16)

/** tag */
let WXMLoadTag : Int = 20555

/** 垂直偏移 */
let WXMLoadMargin : CGFloat = -10.0

/** 外边距 */
let WXMLoadOutsideMargin : CGFloat = 45.0

/** 上下间距 */
let WXMTopBtmMargin : CGFloat = 10.5

/** 内边距 */
let WXMLoadpadMargin : CGFloat = 18.0
let WXMLoadpadAllMargin : CGFloat = (WXMLoadpadMargin * 2.0 + WXMTopBtmMargin)

/** 圆角 */
let WXMLoadRounded : CGFloat = 12.0
let WXMLoadMinHeight : CGFloat = 49.0
let WXMLSWidth : CGFloat = UIScreen.main.bounds.width
let WXMLoadFullColor : UIColor = UIColor.white
let WXMLoadBackColor : UIColor = UIColor.black
let WXMLoadMsgWidth : CGFloat = (WXMLSWidth - 2.0 * WXMLoadOutsideMargin - 2.0 * WXMLoadpadMargin)
