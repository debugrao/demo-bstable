<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bootstrap-Table</title>
    
	<link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"/> 
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	
	<link href="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.css" rel="stylesheet"/> 
	<script src="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap-table/1.9.1/locale/bootstrap-table-zh-CN.min.js"></script>
	
</head>
<body>
<div>
	<div>
		<div class="col-*-12">
		    <div id="toolbar">
		        <div class="btn btn-primary glyphicon glyphicon-pencil" data-toggle="modal" data-target="#addModal">添加记录</div>
		        <div class="btn btn-danger glyphicon glyphicon-remove" onclick="javascript:dels();">批量删除</div>
		    </div>
		    
		    <table id="table" class="table table-hover"></table>
			
			<!-- 添加 -->
		    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
		       <div class="modal-dialog">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                    <h4 class="modal-title" id="myModalLabel">添加记录</h4>
		                </div>
		                <div class="modal-body">
		                    <form role="form" action="javascript:void(0)" id="addForm">
								<div class="form-group">
									<input type="text" class="form-control" name="username" placeholder="请输入用户名">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="password" placeholder="请输入密码">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="email" placeholder="请输入Email">
								</div>
								<div class="form-group">
									<label class="checkbox-inline">
										<input type="radio" name="useable" value="1" checked>可用
									</label>
									<label class="checkbox-inline">
										<input type="radio" name="useable" value="0">禁用
									</label>
								</div>
		                    </form>
		                </div>
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		                    <button type="button" class="btn btn-primary" id="addRecord">提交</button>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    <!-- 更新 -->
		    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-hidden="true">
		       <div class="modal-dialog">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                    <h4 class="modal-title" id="myModalLabel">更新记录</h4>
		                </div>
		                <div class="modal-body">
		                    <form role="form" action="javascript:void(0)" id="updateForm">
		                    	<input type="text" hidden="hidden" name="id" id="id">
								<div class="form-group">
									<input type="text" class="form-control" name="username" id="username">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="password" id="password">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="email" id="email">
								</div>
								<div class="form-group">
									<label class="checkbox-inline">
										<input type="radio" name="useable" id="used" value="1" checked>可用
									</label>
									<label class="checkbox-inline">
										<input type="radio" name="useable" id="unused"  value="0">禁用
									</label>
								</div>
		                    </form>
		                </div>
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		                    <button type="button" class="btn btn-primary" id="updateRecord">提交</button>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>
	<script type="text/javascript">
        $(function() {
			$('#table').bootstrapTable({
                url: "queryPage",//数据源
				dataType : "json",
                height: 667,//高度调整
                pagination: true,//是否分页
				pageNumber : 1,
				pageSize : 10,//单页记录数
				pageList: [10, 25, 50, 100],//分页步进值
                sidePagination: "server",//服务端分页
                dataType: "json",//期待返回数据类型
                searchAlign: "left",//查询框对齐方式
                queryParamsType : "undefined",
				queryParams: function (params) {//请求参数
					return {
						sortName : params.sortName,
						sortOrder : params.sortOrder,
						pageNo : params.pageNumber,
						pageSize : params.pageSize,
					}
				},
                search: true,//是否搜索
                buttonsAlign: "left",//按钮对齐方式
                searchOnEnterKey: false,//回车搜索
                showRefresh: true,//刷新按钮
                showColumns: true,//列选择按钮
				clickToSelect: true,
                toolbar: "#toolbar",//指定工具栏
                toolbarAlign: "right",//工具栏对齐方式
				sortName : "id",
				sortOrder : "desc",
				cache: false,
                columns: [{
					title: "全选", field: "select", checkbox: true, width: 20,align: "center",valign: "middle"//垂直
				},{
					title : '用户名', field : 'username', align : 'center', valign : 'middle'
				},{
					title : '', field : 'password', align : 'center', valign : 'middle'
				},{
					title : '邮箱地址', field : 'email', align : 'center'
				},{
					title : '是否可用', field : 'useable', align : 'center', formatter : function(value, row, index) {
						return 1 == row.useable ? "<font color='blue'>可用</font>" : "<font color='red'>禁用</font>";
					}
				},{
					title : '注册时间', field : 'addtime', align : 'center'
				},{
					title : '登录时间', field : 'logintime', align : 'center'
				},{
					title : '登录IP', field : 'loginip', align : 'center'
				},{
					title : '操作', field : 'id', align : 'center', formatter : function(value, row, index) {
						var edit = '<button type="button" class="btn btn-default" onclick="javascript:showUpdateModal(' + row.id + ',\'' + row.username + '\',\'' + row.password + '\',\'' + row.email + '\',' + row.useable + ')"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>更新</button>';
						var del = '<button type="button" class="btn btn-default" onclick="javascript:dels(\'' + row.id + '\')"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除</button>';
						return edit + del;
					}
				}],
                locale: "zh-CN",//中文支持,
                detailView: false //是否显示详情折叠
            });
            //隐藏密码列
			$('#table').bootstrapTable('hideColumn', 'password');
			
			//添加数据
            $("#addRecord").click(function(){
            	var data = $("#addForm").serialize();
				$.ajax({
					url: "addUser",
					dataType: "json",
					type: "post",
					data: data,
					success: function (req){
						if (req.retcode == 1) {
							$('#addModal').modal('hide');
							$('#table').bootstrapTable('refresh');
			            } else {
			            	alert("添加失败");
						}
					},
					error: function(req){}
				});
            });
			
			//更新数据
            $("#updateRecord").click(function(){
            	var data = $("#updateForm").serialize();
				$.ajax({
					url: "updateUser",
					dataType: "json",
					type: "post",
					data: data,
					success: function (req){
						if (req.retcode == 1) {
							$('#updateModal').modal('hide');
							$('#table').bootstrapTable('refresh');
			            } else {
			            	alert("更新失败");
						}
					},
					error: function(req){}
				});
            });
        })

		//显示更新模态框
		function showUpdateModal(id, username, password, email, useable){
			$("#id").val(id);
			$("#username").val(username);
			$("#password").val(password);
			$("#email").val(email);
			
			$('#updateModal').modal('show');
		}
        
        //获取选择ID
		function getIdSelections() {
			return $.map($('#table').bootstrapTable('getSelections'), function(row) {
				return row.id
			});
		}

		//删除记录
		function dels(ids) {
			if(confirm("确定删除选中记录吗?")){
				if(undefined == ids){
					ids = getIdSelections();
				}
				$.ajax({
					url : "delUser?ids=" + ids,
					dataType : "json",
					type : "post",
					success : function(req) {
						if (req.retcode == 1) {
							$('#table').bootstrapTable('refresh');
						} else {
							alert("删除失败");
						}
					},
					error : function(req) {}
				});
			}
		} 
    </script>
</body>
</html>
