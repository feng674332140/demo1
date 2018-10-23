package com.yzt.zhmp.service;

import com.yzt.zhmp.beans.OrgAdministrationFeatures;

/**
 * @author .
 */
public interface MinZhengMicroserviceService {
    /**
     * 打开选择的功能
     * @param orgAdministrationFeatures
     * @return
     */
    public int midfyMicroservice(OrgAdministrationFeatures orgAdministrationFeatures);

    /**
     * 删除民政子功能
     * @param orgAdministrationFeatures
     * @return
     */
    public  int deleteMicroservice(OrgAdministrationFeatures orgAdministrationFeatures);
}
