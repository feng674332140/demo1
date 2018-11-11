package com.yzt.zhmp.utils;

import com.yzt.zhmp.beans.OrgAdministrationFeatures;
import com.yzt.zhmp.beans.PoliceFeatures;

import java.util.ArrayList;

/**
 * 把list值存到对应的功能bean的属性中
 * @author .
 */
public class ListFeatures {
    /**
     * 民政功能
     * @param arrayList
     * @return
     */
    public OrgAdministrationFeatures listFeatures(ArrayList arrayList){
        OrgAdministrationFeatures orgAdministrationFeatures=new OrgAdministrationFeatures();
        for (int i=0;i<arrayList.size();i++){
            if (arrayList.get(i).equals("MinzhengDongTai")){
             orgAdministrationFeatures.setMinzhengDongTai((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("TonzhiGongGao")){
                orgAdministrationFeatures.setTonzhiGongGao((String)arrayList.get(i));
            }
            if (arrayList.get(i).equals("WangshangBanshi")){
                orgAdministrationFeatures.setWangshangBanshi((String)arrayList.get(i));
            }
            if (arrayList.get(i).equals("MinzhengKanWu")){
                orgAdministrationFeatures.setMinzhengKanWu((String)arrayList.get(i));
            }
            if (arrayList.get(i).equals("YouDaiFuXu")){
                orgAdministrationFeatures.setYouDaiFuXu((String)arrayList.get(i));
            }
            if (arrayList.get(i).equals("TuiWuAnZhi")){
                orgAdministrationFeatures.setTuiWuAnZhi((String)arrayList.get(i));
            }
            if (arrayList.get(i).equals("JiuZaiJuiZhi")){
                orgAdministrationFeatures.setJiuZaiJuiZhi((String)arrayList.get(i));
            }
            if (arrayList.get(i).equals("TeKunGongYang")){
                orgAdministrationFeatures.setTeKunGongYang((String)arrayList.get(i));
            }
        }
        return orgAdministrationFeatures;
    }


    /**
     * 公安模块功能
     * @param arrayList
     * @return
     */
    public PoliceFeatures policeFeatures(ArrayList arrayList){
        PoliceFeatures policeFeatures=new PoliceFeatures();
        for (int i=0;i<arrayList.size();i++){
            if (arrayList.get(i).equals("ZhuHuChaXun")){
                policeFeatures.setZhuHuChaXun((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("PaiChuSuoInfo")){
                policeFeatures.setPaiChuSuoInfo((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("AnQuanJanYi")){
                policeFeatures.setAnQuanJanYi((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("XunRenQiShi")){
                policeFeatures.setXunRenQiShi((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("WangShangHuiJian")){
                policeFeatures.setWangShangHuiJian((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("XiaQuMinJing")){
                policeFeatures.setXiaQuMinJing((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("YiJianBaoJing")){
                policeFeatures.setYiJianBaoJing((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("FangWuZuLin")){
                policeFeatures.setFangWuZuLin((String) arrayList.get(i));
            }
            if (arrayList.get(i).equals("ZhaoPingXinXi")){
                policeFeatures.setZhaoPingXinXi((String) arrayList.get(i));
            }
        }
        return policeFeatures;
    }
}
