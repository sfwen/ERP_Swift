//
//  WorkMainViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/13.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class WorkMainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var contentArray : NSMutableArray?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "我的工作"
        self.initItemData()
    }
    
    func initItemData() -> Void {
        self.contentArray = NSMutableArray()
        
        if currUserRights == nil {
            return
        }
        if (currUserRights?.contains(Right_Menu_MyMeetCus))! {
            //见面申请
            let model = OptionModel()
            model.name = Menu_MyMeetCus_Titile
            model.imageName = Menu_MyMeetCus_Img
            model.flowCatg = .MeetCust
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Cont))! {
            //合同
            let model = OptionModel()
            model.name = Menu_Cont_Title
            model.imageName = Menu_Cont_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_DesignContract_Look))! {
            //设计合同
            let model = OptionModel()
            model.name = Menu_DesignContract_Titile
            model.imageName = Menu_Cont_Img
            model.flowCatg = .ContractDesign
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_ContStart))! {
            //开工申请
            let model = OptionModel()
            model.name = Menu_ContStart_Title
            model.imageName = Menu_ContStart_Img
            model.flowCatg = .ContStart
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_ConstructAccept_Look))! {
            //开工验收申请
            let model = OptionModel()
            model.name = Menu_ConstructAccept_Title
            model.imageName = Menu_ConstructAccept_Img
            model.flowCatg = .ConstructAccept
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_WaitQc))! {
            //工地验收单
            let model = OptionModel()
            model.name = Menu_WaitQc_Title
            model.imageName = Menu_WaitQc_Img
            model.flowCatg = .SiteWaitQc
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Site))! {
            //工地
            let model = OptionModel()
            model.name = Menu_Site_Title
            model.imageName = Menu_Site_Img
            model.flowCatg = .MySite
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_MatlPur))! {
            //采购单
            let model = OptionModel()
            model.name = Menu_MatlPur_Title
            model.imageName = Menu_MatlPur_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_MatlNeed))! {
            //工地用料单
            let model = OptionModel()
            model.name = Menu_MatlNeed_Title
            model.imageName = Menu_MatlNeed_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Rectify))! {
            //整改单
            let model = OptionModel()
            model.name = Menu_Rectify_Title
            model.imageName = Menu_Rectify_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_StopRst))! {
            //停工登记
            let model = OptionModel()
            model.name = Menu_StopRst_Title
            model.imageName = Menu_StopRst_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Site_SiteStop))! {
            //复工登记
            let model = OptionModel()
            model.name = Menu_SiteRst_Title
            model.imageName = Menu_StopRst_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_SiteCmpl))! {
            //完工登记
            let model = OptionModel()
            model.name = Menu_SiteCmpl_Title
            model.imageName = Menu_SiteCmpl_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Registration_Evaluation_Look))! {
            //完工评定
            let model = OptionModel()
            model.name = Menu_SiteFinishEvaluate_Title
            model.imageName = Menu_SiteCmpl_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_StartDateChg))! {
            //开工日期变更
            let model = OptionModel()
            model.name = Menu_StartDateChg_Title
            model.imageName = Menu_StartDateChg_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_PersonChg))! {
            //装修管家变更
            let model = OptionModel()
            model.name = Menu_PersonChg_Title
            model.imageName = Menu_PersonChg_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Liaison))! {
            //工作联络单
            let model = OptionModel()
            model.name = Menu_Liaison_Title
            model.imageName = Menu_Liaison_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_CheckHouse))! {
            //验房申请单
            let model = OptionModel()
            model.name = Menu_CheckHouse_Title
            model.imageName = Menu_CheckHouse_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_CheckHouseRefund))! {
            //验房退款单
            let model = OptionModel()
            model.name = Menu_CheckHouseRefund_Title
            model.imageName = Menu_CheckHouseRefund_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Earnest))! {
            //定金登记
            let model = OptionModel()
            model.name = Menu_Earnest_Title
            model.imageName = Menu_Earnest_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_EarnestRefund))! {
            //定金退款
            let model = OptionModel()
            model.name = Menu_EarnestRefund_Title
            model.imageName = Menu_EarnestRefund_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_FinRequest))! {
            //请款申请
            let model = OptionModel()
            model.name = Menu_FinRequest_Title
            model.imageName = Menu_FinRequest_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_OnDuty))! {
            //值班模式设置
            let model = OptionModel()
            model.name = Menu_OnDuty_Title
            model.imageName = Menu_OnDuty_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_CheckHouseAcpt))! {
            //验房登记
            let model = OptionModel()
            model.name = Menu_CheckHouseAcpt_Title
            model.imageName = Menu_CheckHouseAcpt_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_ContHydropower))! {
            //水电增项单
            let model = OptionModel()
            model.name = Menu_ContHydropower_Title
            model.imageName = Menu_ContHydropower_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_RepairRecord))! {
            //维修记录
            let model = OptionModel()
            model.name = Menu_RepairRecord_Title
            model.imageName = Menu_RepairRecord_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_DsgnChg))! {
            //合同设计师变更
            let model = OptionModel()
            model.name = Menu_ContDsgnChg_Title
            model.imageName = Menu_ContDsgnChg_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_MatlConfirm))! {
            //主材确认单
            let model = OptionModel()
            model.name = Menu_MatlConfirm_Title
            model.imageName = Menu_MatlConfirm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Fabao))! {
            //工人发包发放申请
            let model = OptionModel()
            model.name = Menu_Fabao_Title
            model.imageName = Menu_Fabao_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Fabao_Document))! {
            //项目发包单
            let model = OptionModel()
            model.name = Menu_Fabao_Document_Title
            model.imageName = Menu_Fabao_Document_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_CustProm))! {
            //客户推广费用申请
            let model = OptionModel()
            model.name = Menu_CustProm_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_SiteTimeAdjust))! {
            //工地工期调整
            let model = OptionModel()
            model.name = Menu_SiteTimeAdjust_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_MaterialStorage_Look))! {
            //物资采购入库
            let model = OptionModel()
            model.name = Menu_MaterialStorage_Titile
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Notice_Measure_Look))! {
            //测量通知单
            let model = OptionModel()
            model.name = Menu_Measure_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_Notice_Install_Look))! {
            //安装通知单
            let model = OptionModel()
            model.name = Menu_Install_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_FinSettleOtherOut_Look))! {
            //报销申请单
            let model = OptionModel()
            model.name = Menu_FinSettleOtherOut_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_MeetingRoom_Look))! {
            //会议室申请
            let model = OptionModel()
            model.name = Menu_MeetingRoom_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_SiteFeeApply_Look))! {
            //工地费用报销单
            let model = OptionModel()
            model.name = Menu_Site_FeeApply_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_SiteStart_Look))! {
            //开工确认单
            let model = OptionModel()
            model.name = Menu_SiteStart_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_DutySchedule_Look))! {
            //值班安排
            let model = OptionModel()
            model.name = Menu_DutySchedule_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_VisitCustomer_Look))! {
            //回访
            let model = OptionModel()
            model.name = Menu_VisitCustomer_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_ContFavourable_Look))! {
            //合同优惠
            let model = OptionModel()
            model.name = Menu_ContFavourable_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_ContFavourable_Look))! {
            //现场活动
            let model = OptionModel()
            model.name = Menu_Scene_Activity_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        if (currUserRights?.contains(Right_Menu_PromoteCost_Form_Look))! {
            //推广费用报销单
            let model = OptionModel()
            model.name = Menu_PromoteCost_Form_Title
            model.imageName = Menu_CustProm_Img
            model.flowCatg = .Contract
            self.contentArray?.add(model)
        }
        
        self.collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.contentArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WorkMainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkMainCollectionViewCell", for: indexPath) as! WorkMainCollectionViewCell
        let model : OptionModel = self.contentArray?.object(at: indexPath.row) as! OptionModel
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model : OptionModel = self.contentArray?.object(at: indexPath.row) as! OptionModel
        switch model.flowCatg {
        case .MeetCust?, .Contract?, .ConstructAccept?, .SiteWaitQc?, .MySite?:
            do {
            let vc : FourLabelViewController = FourLabelViewController()
            vc.flowCatg = model.flowCatg!
            self.navigationController?.pushViewController(vc, animated: true)
        }
            break
        case .ContractDesign?:
            do {
                let vc : FiveLabelViewController = FiveLabelViewController()
                vc.flowCatg = model.flowCatg!
                self.navigationController?.pushViewController(vc, animated: true)
            }
        default:
            break
        }
        
    }
    
    lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let w = (self.view.width - 16) / 3.0
        flowLayout.itemSize = CGSize(width: w, height: w)
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view).offset(8)
            make.right.equalTo(self.view).offset(-8)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
        })
        
        collectionView.register(WorkMainCollectionViewCell.self, forCellWithReuseIdentifier: "WorkMainCollectionViewCell")
        
        return collectionView
    }()
    
}
