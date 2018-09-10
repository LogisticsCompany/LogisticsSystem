<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>运单查询</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />


		<script type="text/javascript">
function check() {
	if (document.getElementById("dh").value == "") {
		alert("请输入单号");
		return false;
	}

	return true;
}
</script>
	</head>

	<body>

		<div class="page">
			<div class="page_con">
				<jsp:include flush="true" page="/inc/top.jsp"></jsp:include>
				<!----------------内容区开始-------------------->
					<div class = "panel panel-info" style = "width: 100%">
						<div class = "panel-heading">运单查询</div>
						<div class = "panel-body">
							<div class="sub_mainbox clearfix">


								<div class="m_border">

									<div class="m_content message_con">
										<form id="form1" name="form1" method="post"
											  action="yundanq.jsp" onsubmit="return check()">
											<p class="tips">
												<b>注：</b>带
												<span class="red">*</span>号为必填项
											</p>
                                            <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0"
                                                   class = "table table-striped ">

												<tr>
													<td class="left_name1">
														单号：
													</td>
                                                    <td>

                                                        <input type = "text" name = "dh" id = "dh"
                                                               class = "form-control form-control-inline"
                                                               style = "width: 200px"/>
                                                        <span class = "red">*</span>
                                                    </td>


												</tr>

												<tr>
													<td>
														&nbsp;
													</td>
													<td>
                                                        <input type = "submit" value = "查询" name = "button" id = "button"
                                                               class = "btn btn-success" style = "height: auto;width:auto"
                                                        />
													</td>
												</tr>
											</table>
										</form>
									</div>
								</div>

							</div>
						</div>
					</div>
				<div class="sub_main">
					<div class="sub_maincon">

					</div>
				</div>
				<!----------------内容区结束-------------------->
				<!---------------页脚开始---------------->
				<jsp:include flush="true" page="/inc/foot.jsp"></jsp:include>
				<!---------------页脚结束---------------->
			</div>
		</div>
	</body>
</html>
