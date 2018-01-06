package com.budget.modules.budget.web;

/*import com.budget.modules.budget.entity.LmtBudget;
import com.budget.modules.util.DBUtils;*/

import com.thinkgem.jeesite.common.utils.SpringContextHolder;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

/*import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;*/
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

@Service
public class AllBudget {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//private JdbcTemplate jdbcTemplate = SpringContextHolder.getBean(JdbcTemplate.class);

	
	@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=false)
    public void getDatas(){
		//父子容器
    	SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);

    		
    		//1 核心类
    		//QueryRunner queryRunner = new QueryRunner(DBUtils.getDataSource());
    		//2 sql
    		//String sql = "select  *  from  YW_YSKZMB where RECORD_ID=?";
    		//String sql = "select  *  from  YW_YSKZMB";
    		//String sql = "select * from LMT_BUDGET where id=? ";
    		
    		//3 参数
    		//Object[] params = {"12"};
    		//4执行
    		//queryRunner.update(sql, params);
    		//4执行
    		//LmtBudget category = queryRunner.query(sql, new BeanHandler<LmtBudget>(LmtBudget.class),params);
    		
    		//List<LmtBudget> category = queryRunner.query(sql, new BeanListHandler<LmtBudget>(LmtBudget.class));
    		//LmtBudget category = new LmtBudget();
    		//System.out.println(category.get(0).getRecord_Id());
    		//System.out.println(category);
    		
    		/*DBUtils.closeConnection(queryRunner.);
    		DBUtils.closeStatement(statement);*/
    		
    		/*con = jdbcTemplate.getDataSource().getConnection();
    	    con.setAutoCommit(false);*/
    		try{
    		
    		//第一步：将中间表的数据导入到本地环境
    		String sql1 = "insert into YW_YSKZMB(id,record_id,batch_id,entity_code,entity_name,acct_code,acct_name,budget_amt,budget_disable,budget_year"
    				+ ",budget_period,insert_date,insert_by,sync_satus,sync_msg,sync_date,sync_by,attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8,attr9,attr10"
    				+ ",del_flag) SELECT YW_YSKZMB_SEQ.NEXTVAL id, y.*, 0 del_flag FROM YW_YSKZMB@budglink y where y.SYNC_SATUS = 'N'";
    		jdbcTemplate.execute(sql1);
    	
    		//第二步：将远程数据库中已经被同步的数据状态SYNC_SATUS置为Y
    		//把这一批次预算中间表的SYNC_SATUS置为Y
    		String sqly = "update YW_YSKZMB@budglink  set SYNC_SATUS='Y' WHERE BATCH_ID=( SELECT batch_id FROM YW_YSKZMB@budglink where SYNC_SATUS='N' and rownum=1)";
    		jdbcTemplate.execute(sqly);
    		
    		//判断本地的中间表是否为空(即判断远程中间表有无新数据)
    		List list = jdbcTemplate.queryForList("select budget_year from YW_YSKZMB where rownum=1");
    		if(list.size()>0){
    			//临时增加一步（1查询出所有数据的公司2删除EXCEL导入的该公司的数据）
    			
    			
	    		//第三步：将本地的中间表数据使用merge into 插入到LMT_budget表中
	    		String sql2 = "MERGE INTO LMT_BUDGET B USING YW_YSKZMB Y ON (B.BUDGET_MARK = Y.ATTR1)WHEN MATCHED THEN UPDATE  SET B.BATCH_ID=Y.BATCH_ID, B.STATUS = Y.BUDGET_DISABLE,B.RECORD_ID = Y.RECORD_ID,B.MODIFY_DATE = sysdate, B.budget_amount  = Y.BUDGET_AMT * 1000000,  B.Budget_Balance = Y.BUDGET_AMT*1000000 - NVL(B.Occupied_Amount, 0) - NVL(B.Blocked_Amount, 0)"
	    				+"WHEN NOT MATCHED THEN  INSERT   (B.ID, B.BUDGET_MARK,B.RECORD_ID,B.BATCH_ID,B.COMP_ID,B.COMP_NAME,B.BUDGET_SUBJECT_CODE,B.BUDGET_SUBJECT_NAME,B.Budget_Amount,B.BUDGET_BALANCE,B.STATUS,B.BUDGET_YEAR,B.BUDGET_PERIOD,B.CREATION_TIME,B.MODIFY_DATE)  VALUES  (LMT_BUDGET_SEQ.NEXTVAL, Y.ATTR1,Y.RECORD_ID,Y.BATCH_ID,Y.ENTITY_CODE,Y.ENTITY_NAME,Y.ACCT_CODE,Y.ACCT_NAME, Y.Budget_Amt*1000000,Y.BUDGET_AMT*1000000,Y.BUDGET_DISABLE,Y.BUDGET_YEAR,Y.BUDGET_PERIOD,sysdate,sysdate)";
	    		jdbcTemplate.execute(sql2);
	    		
	    		
	    		//获取预算年份用来保存日志
	    		//List<Map<String, Object>> years = jdbcTemplate.queryForList("SELECT distinct budget_year  FROM YW_YSKZMB "); 
	    		Map<String, Object> map = jdbcTemplate.queryForMap("select budget_year from YW_YSKZMB where rownum=1");
	    		
	    		//调用存储过程“P_LOG”完成写日志操作(要求传输正确才写日志)
	    		/*call  P_LOG@budglink('FSSC_IN_20170614_0001','2017','2017','0','');
	    		String vi_start_issue = (String) years.get(0).get("budget_year");
	    		String vi_end_issue = (String) years.get(0).get("budget_year");*/
	    		String vi_req_code = "FSSC_IN_20170614_0001";
	    		String vi_start_issue = (String) map.get("budget_year");
	    		String vi_end_issue = (String) map.get("budget_year");
	    		String vi_oper_status = "0";
	    		String vi_errmsg = "";
	    		//存储过程语句保存日志
	    		String sqlp = "call  P_LOG@budglink('" +vi_req_code+"','"+vi_start_issue+"','"+vi_end_issue+"','"+vi_oper_status+"','"+vi_errmsg+"')";
	    		jdbcTemplate.execute(sqlp);
	    		
	    		//都操作成功后删除本地中间表的数据
	    		String sqlDel = "delete from YW_YSKZMB where 1=1";
	    		jdbcTemplate.execute(sqlDel);

    		}
    		
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
    
    }
	
 }

