package com.budget.common.web;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Org;
import com.thinkgem.jeesite.modules.sys.service.OrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by mattialiu on 17/10/13.
 */
@Controller
@RequestMapping(value = "${adminPath}/account/common/popWindow")
public class PopWindowController extends BaseController {
    @Autowired
    OrgService orgService;
    /**
     * 组织结构弹框页面初始化
     */
    @RequestMapping(value = {"orgIndex"})
    public String orgIndex(Org org, Model model) {
        model.addAttribute("org", org);
        return "common/orgSearch";
    }

    /**
     * 条件查询组织结构列表
     * @param org
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = { "orgList", "" })
    public String orgList(Org org, HttpServletRequest request,HttpServletResponse response, Model model) {
        long start = System.currentTimeMillis();
        Page<Org> page = orgService.findDeptByParentNo(new Page<Org>(request, response), org);
        model.addAttribute("org",org);
        model.addAttribute("page", page);
        long end = System.currentTimeMillis();
        logger.info("****************组织树 orgService.findDeptByParentNo 耗时:" + (end - start) +"毫秒");
        return "common/orgPopList";
    }

    /**
     * 项目弹框页面初始化
     * @param projectInfo
     * @param model
     * @return
     */
}
