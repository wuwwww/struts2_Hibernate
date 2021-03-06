<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
<s:form method="post" action="Matri"  theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="600">
  <tr>
    <td width="100%" bgcolor="#C0C0C0">
    <font color="#0000FF">录入录取学生名册</font></td>
  </tr>
  <tr>
    <td width="100%" align="left">　
    请输入学生姓名：
    <s:textfield name="studentname"/>
    请选取录取专业:
	<s:select name="specialityid" listKey="specialityid"
		listValue="specialityname" list="#request.specialityArray"
		headerKey="" headerValue="==请选择==">
    </s:select><br>
    <!-- 提交信息时只提交specialityid号 -->
    请输入录取通知书号：<s:textfield name="matrino"/>
    <s:hidden name="action" value="add"/>
    <!-- 设置action的值为add，表示添加操作 -->
    <s:submit value="提交"/>
    <!-- 提交了姓名studentname，专业编号specialityid，录取通知号matrino三个参数 -->
    </td>
  </tr>
</table>
</s:form>
<s:form method="post" action="Matri"  theme="simple">
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="600">
  <tr>
    <td width="100%" bgcolor="#C0C0C0"  colspan="5">
    <font color="#0000FF">查询已录入的学生名册</font></td>
  </tr>
  <tr>
  <tr>
    <td width="100%" align="left" colspan="5">　
    请输入学生姓名：
    <s:textfield name="studentname"/>
    请选取录取专业:
	<s:select name="specialityid" listKey="specialityid"
		listValue="specialityname" list="#request.specialityArray"
		headerKey="" headerValue="==请选择==">
    </s:select>
    <!-- specialityArray在相应的action方法MatriAction.java中被放入了request中，故可以用list="#request.specialityArray将其取出 -->
    <s:hidden name="action" value="select"/>
    <!-- action值为select表示查询操作 -->
    <s:submit value="提交"/>
    </td>
  </tr>
  <tr>
  	<td align="center" colspan="5"><font color="#0000FF">
  	<s:if test="#request.pagecount>1&&#request.currentpage>1">
  		<a href="Matri.action?currentpage=1&action=<s:property value="action"/>
  		&specialityid=<s:property value="specialityid"/>
  		&studentname=<s:property value="studentname"/>">首页</a>&nbsp;
  	<!--设置上一页的超链接  -->
  		<a href="Matri.action?currentpage=<s:property value="#request.currentpage-1"/>
  		&action=<s:property value="action"/>
  		&specialityid=<s:property value="specialityid"/>
  		&studentname=<s:property value="studentname"/>">上一页</a>&nbsp;
  	</s:if>
  	<s:if test="#request.pagecount>1&&#request.currentpage<#request.pagecount">
  	<!-- 如果总页数大于1，且当前页数不是尾页，则显示下一页和尾页的超链接 -->
    <!-- 设置下一页的超链接 --> 		
  		<a href="Matri.action?currentpage=<s:property value="#request.currentpage+1"/>
  		&action=<s:property value="action"/>
  		&specialityid=<s:property value="specialityid"/>
  		&studentname=<s:property value="studentname"/>">下一页</a>&nbsp;
  	<!-- 设置尾页的超链接 --> 		
  		<a href="Matri.action?currentpage=<s:property value="#request.pagecount"/>
  		&action=<s:property value="action"/>
  		&specialityid=<s:property value="specialityid"/>
  		&studentname=<s:property value="studentname"/>">尾页</a>&nbsp;
  	</s:if>
  	共<s:property value="#request.recount"/>条记录，
  	共<s:property value="#request.pagecount"/>页，
  	当前第<s:property value="#request.currentpage"/>页
  	</font></td>
  </tr>
  <tr bgcolor="#C0C0C0">
  	<td align="center"><font color="#0000FF">序号</font></td>
  	<td align="center"><font color="#0000FF">姓名</font></td>
  	<td align="center"><font color="#0000FF">录取专业</font></td>
  	<td align="center"><font color="#0000FF">录取通知书号</font></td>
  	<td align="center"><font color="#0000FF">删除？</font></td>
  </tr>
<s:iterator value="#request.stuArray" status="status">
  <tr>
  	<td align="center"><s:property value="#status.count"/></td>
  	<td align="center">
  		<s:property value="StudentName"/>
  	</td>
  	<td align="center">      
  		<s:property value="@com.kang.db.StudentUtil@haveSplitSpec(SpecialityId)"/>
   		 
  	</td>
  	<td align="center">
  		<s:property value="MatriNo"/>
  	</td>
  	<td align="center">
  		<a href="Matri.action?action=del&studentid=<s:property value="StudentId"/>">删除</a>
  	</td>
  </tr>
 </s:iterator>
</table>
</s:form>
</body>
</html>
