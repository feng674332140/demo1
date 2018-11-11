package com.yzt.zhmp.service;

import com.yzt.zhmp.beans.OrgAdministrationFeatures;

/**
 * @author .
 */
public interface OrgAdministrationFeaturesService {
    /**
     * 查找功能模块的状态
     * @return
     */
    public OrgAdministrationFeatures selectFeatures();
}
