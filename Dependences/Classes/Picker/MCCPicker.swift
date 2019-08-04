//
//  MCCPicker.swift
//  changshoubao
//
//  Created by spectator Mr.Z on 2018/10/25.
//  Copyright © 2018 Mr.Z. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import RxCocoa


public var MCCPicker_COLOR = Color(0xffffff)

class MCCPicker: _SNBaseViewController {
    
    let table1 = SNBaseTableView()
    let table2 = SNBaseTableView()
    let table3 = SNBaseTableView()
    
    let title1 = UILabel().then {
        $0.font = Font(48)
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = true
    }
    let title2 = UILabel().then {
        $0.font = Font(48)
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = true
    }
    let title3 = UILabel().then {
        $0.font = Font(48)
        $0.textAlignment = .center
        $0.isUserInteractionEnabled = true
    }
    
    let flagV = UIView().then {
        $0.backgroundColor = MCCPicker_COLOR
    }
    
    
    fileprivate var titleV = UIView().then {
        $0.backgroundColor = .white
    }
    
    fileprivate var listV = UIView().then {
        $0.backgroundColor = .white
    }
    
    fileprivate var idx = 0 {
        didSet {
            switch idx {
            case 1:
                title1.textColor = MCCPicker_COLOR
                title2.textColor = .black
                title3.textColor = .black
            case 2:
                title1.textColor = .black
                title2.textColor = MCCPicker_COLOR
                title3.textColor = .black
            case 3:
                title1.textColor = .black
                title2.textColor = .black
                title3.textColor = MCCPicker_COLOR
            default:
                break
            }
            refreshFlag()
        }
    }
    
    let table1Rep = BehaviorRelay(value: [TableSectionModel<SNMCCPickerModel>]())
    let table2Rep = BehaviorRelay(value: [TableSectionModel<SNMCCPickerModel>]())
    let table3Rep = BehaviorRelay(value: [TableSectionModel<SNMCCPickerModel>]())
    
    var address1 = [SNMCCPickerModel]()
    var address2 = [SNMCCPickerModel]()
    var address3 = [SNMCCPickerModel]()
    
    typealias intCall = (Int,SNMCCPickerModel)->()
    var click : intCall?
    
    let vmodel = MCCPickerViewModel()
    
    typealias addrCall = (String)->()
    var result: addrCall?
}

extension MCCPicker {
    
    override func loadData() {
        
//       vmodel.getChildren(code: "0")
    }
    
    override func setupView() {
        
        table1.register(SNBaseTableViewCell.self)
        
        let line = UIView().then {
            $0.backgroundColor = Color(0xe1e1e1)
        }
        
        view.addSubviews(views: [titleV,listV,line])
        
        titleV.snp.makeConstraints { (make) in
            make.left.snEqualToSuperview()
            make.top.snEqualToSuperview()
            make.right.snEqualToSuperview()
            make.height.snEqualTo(130)
        }
        
        line.snp.makeConstraints { (make) in
            make.bottom.snEqualTo(titleV.snp.bottom)
            make.left.snEqualToSuperview()
            make.right.snEqualToSuperview()
            make.height.snEqualTo(1)
        }
        listV.snp.makeConstraints { (make) in
            make.top.snEqualTo(titleV.snp.bottom)
            make.left.snEqualToSuperview()
            make.right.snEqualToSuperview()
            make.bottom.snBottomSuperview(vc: self)
        }
        
        listV.addSubview(table1)
        
        table1.snp.makeConstraints { (make) in
            make.edges.snEqualToSuperview()
        }
        idx = 1
        title1.text = "请选择"
        
        titleV.addSubview(title1)
        title1.snp.makeConstraints { (make) in
            make.left.snEqualToSuperview()
            make.top.snEqualToSuperview()
            make.bottom.snEqualToSuperview()
            make.width.snEqualTo(200)
        }
        
        titleV.addSubview(flagV)
        flagV.snp.makeConstraints { (make) in
            make.bottom.snEqualToSuperview()
            make.width.snEqualTo(200)
            make.height.snEqualTo(5)
            make.left.snEqualToSuperview()
        }
        
    }
    
    override func bindEvent() {
        let dataSource = self.dataSource()
        table1Rep.bind(to: table1.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        
        address1.append(SNMCCPickerModel(name: "北京", code: "100", mcc: "0"))
        
        
        
        changeItems(items: address1)
        
        table1.rx.modelSelected(SNMCCPickerModel.self).subscribe(onNext: { (model) in
            SNLog("select \(model.name)")
            
            self.modelSelected(model: model)
            
        }).disposed(by: disposeBag)
        
        
        vmodel.queryResult = { ads in
            self.queryRes(models: ads)
        }
        
        
        title1.addTap(self, action: #selector(provinceTap))
        title2.addTap(self, action: #selector(cityTap))
        title3.addTap(self, action: #selector(areaTap))
    }
    
    func queryRes(models: [SNMCCPickerModel]) {
        
        switch idx {
        case 1:
            address1 = models
        case 2:
            address2 = models
        case 3:
            address3 = models
        default:
            break
        }
        
        changeItems(items: models)
        
    }
    
    func modelSelected(model: SNMCCPickerModel){
        
        switch idx {
        case 1:
            self.selecProvince(model: model)
            
        case 2:
            self.selectCity(model: model)
        case 3:
            title3.text = model.name
            self.result?("\(String(describing: title1.text!))/\(String(describing: title2.text!))/\(String(describing: title3.text!))")
        default:
            break
        }
        
        click?(idx,model)
        self.idx += 1
        self.idx = self.idx > 3 ? 3 : self.idx
        
        
    }
    
    func selecProvince(model: SNMCCPickerModel) {
        
        if title2.superview != nil {
            title2.removeFromSuperview()
            title2.snp.removeConstraints()
        }
        
        if title3.superview != nil {
            title3.removeFromSuperview()
            title3.snp.removeConstraints()
        }
        
        title1.text = model.name
        
        changeItems(items: [SNMCCPickerModel]())
//        vmodel.getChildren(code: model.code)
        
        title2.text = "请选择"
        titleV.addSubview(title2)
        title2.snp.makeConstraints { (make) in
            make.left.snEqualTo(title1.snp.right)
            make.top.snEqualToSuperview()
            make.bottom.snEqualToSuperview()
            make.width.snEqualTo(title1.snp.width)
        }
        
        //        flagV.snp.updateConstraints { (make) in
        //           make.left.snEqualToSuperview().snOffset(200)
        //        }
    }
    
    func selectCity(model: SNMCCPickerModel) {
        
        if title3.superview != nil {
            title3.removeFromSuperview()
            title3.snp.removeConstraints()
        }
        
        title2.text = model.name
        changeItems(items: [SNMCCPickerModel]())
//        vmodel.getChildren(code: model.code)
        
        title3.text = "请选择"
        titleV.addSubview(title3)
        title3.snp.makeConstraints { (make) in
            make.left.snEqualTo(title2.snp.right)
            make.top.snEqualToSuperview()
            make.bottom.snEqualToSuperview()
            make.width.snEqualTo(title1.snp.width)
        }
        
        //        flagV.snp.updateConstraints { (make) in
        //            make.left.snEqualToSuperview().snOffset(400)
        //        }
    }
    
    func scrTop() {
        changeItems(items: [SNMCCPickerModel]())
        
        let activity = UIActivityIndicatorView()
        view.addSubview(activity)
        activity.snp.makeConstraints { (make) in
            make.center.snEqualToSuperview()
            make.width.height.snEqualTo(100)
        }
        activity.hidesWhenStopped = true
        activity.color = .white
        activity.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        activity.startAnimating()
        delay(0.5) {
            activity.stopAnimating()
        }
        //        table1.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
    }
    
    func refreshFlag() {
        
        
        if flagV.superview != nil {
            
            let  x = 200 * (idx - 1)
            
            flagV.snp.updateConstraints { (make) in
                make.left.snEqualToSuperview().snOffset(CGFloat(x))
            }
        }
    }
    
    func changeItems(items: [SNMCCPickerModel]) {
        
        
        
        var sections = table1Rep.value
        if sections.isEmpty {
            _ = TableSectionModel(title: "", items:
                items
            )
//            table1Rep <= [section]
        } else {
            var section = sections[0]
            section.items = items
            sections[0] = section
//            table1Rep <= sections
        }
    }
    
    @objc func provinceTap() {
        scrTop()
        idx = 1
        delay(0.5) {
            self.changeItems(items: self.address1)
        }
        
    }
    
    @objc func cityTap() {
        scrTop()
        idx = 2
        delay(0.5) {
            self.changeItems(items: self.address2)
        }
    }
    
    @objc func areaTap() {
        scrTop()
        idx = 3
        delay(0.5) {
            self.changeItems(items: self.address3)
        }
    }
    
    func dataSource() ->RxTableViewSectionedReloadDataSource<TableSectionModel<SNMCCPickerModel>> {
        
        return RxTableViewSectionedReloadDataSource<TableSectionModel<SNMCCPickerModel>>(configureCell: { (ds, table, index, item) -> UITableViewCell in
            
            let cell : SNBaseTableViewCell = table.dequeueReusableCell(forIndexPath: index)
            cell.textLabel?.text = item.name
            return cell
            
        })
        
    }
}

public protocol MCCPickerModelPro {
    var name: String {get}
    var code: String {get}
}

public typealias MCCPickerModel = MCCPickerModelPro & SectionItemType

struct SNMCCPickerModel : MCCPickerModel {
    var name: String
    var code: String
    var mcc: String
}

