<!--
Tomato GUI
Copyright (C) 2012 Shibby
http://openlinksys.info
For use with Tomato Firmware only.
No part of this file may be used without permission.
--><title>TomatoAnon 项目</title>
<content>
	<script type="text/javascript">
		//	<% nvram("tomatoanon_enable,tomatoanon_answer,tomatoanon_id"); %>
		$('.anonlink').append('<a title="Check out my router" class="pull-right" href="http://anon.groov.pl/?search=9&routerid=<% nv('tomatoanon_id'); %>" target="_blank"><i class="icon-forward"></i></a>');
		function verifyFields(focused, quiet)
		{
			var o = (E('_tomatoanon_answer').value == '1');
			E('_tomatoanon_enable').disabled = !o;
			var s = (E('_tomatoanon_enable').value == '1');
			return 1;
		}
		function save()
		{
			if (verifyFields(null, 0)==0) return;
			var fom = E('_fom');
			fom._service.value = 'tomatoanon-restart';
			form.submit('_fom', 1);
		}
		function init()
		{
			var anon = true;
		}

		function submit_complete()
		{
			document.location.reload();
		}
	</script>


	<form id="_fom" method="post" action="tomato.cgi">
		<input type="hidden" name="_nextpage" value="/#admin-tomatoanon.asp">
		<input type="hidden" name="_service" value="tomatoanon-restart">

		<div class="box">
			<div class="heading">TomatoAnon项目</div>
			<div class="content">
				<p>我想向您介绍一个新的项目，我一直在努力，为tomatoanon。
					该TomatoAnon脚本将信息发送到你的路由器的型号和Tomato安装版的在线数据库。
					提交的信息是100％匿名的，并且将只用于统计目的。
					<b>这个脚本不会收集或传送任何（如MAC地址，IP地址等），任何私人或个人信息！</b>
					TomatoAnon脚本是完全开放的，用bash语言编写的。每个人都免费看收集并传送到数据库中的信息..
				</p>

				<p>所收集的数据在 <a href="http://anon.groov.pl/" target="_blank"><b>TomatoAnon统计</b></a>页面。<br>
					此信息可以帮助您选择您所在的国家或地区可用的最佳/最流行的路由器。
					可以找到最常用的Tomato版本和哪个版本在各个路由器上最稳定。
					你可以随时禁用。
					你可以随时启用。
				</p>

				<p>以下数据将被收集：</p>
				<ul>
					<li>WAN和LAN的MAC地址的MD5SUM - 这提供了每个路由器唯一的标识符，例如: 1c1dbd4202d794251ec1acf1211bb2c8</li>
					<li>路由器的型号，例如: XIAOMI MIWIFI</li>
					<li>Tomato版本号, 例如: 102 K26 USB</li>
					<li>编译类型，例如: Mega-VPN-64K</li>
					<li>国家，例如: China</li>
					<li>ISO国家代码，例如: CN</li>
					<li>路由器开机时间，例如: 3 天</li>
					<li>就这么多!!</li>
				</ul>

				<p>感谢您的阅读，并请作出正确的选择来帮助这个项目。</p><br />

				<h3>Tomato更新</h3>
				<p>
					AdvancedTomato增加了TomatoAnon脚本以便于检查固件更新。
					像TomatoAnon脚本一样，本脚本也会检测当前使用的固件版本，并检测是否有更新版本的AdvancedTomato。
					像TomatoAnon，代码是完全开放的，以确保不会收集任何其他敏感信息。
				</p><br />

				<h4>它是如何工作的?</h4>
				<p>AdvancedTomato检查你的固件版本并创建一个小链接，就像： <b><a target="_blank" href="http://advancedtomato.com/update.php?v=1.06.08">http://advancedtomato.com/update.php?v=1.06.08</a></b>。
					你的浏览器会访问这个页面，AdvancedTomato服务器会返回查询结果并提示是否有固件更新。<br>
					就这样！
				</p>
			</div>
		</div>

		<div class="box anon">
			<div class="heading anonlink">TomatoAnon 设置</div>
			<div class="content"></div>
			<script type="text/javascript">
				$('.box.anon .content').forms([
					{ title: '您明白TomatoAnon是什么吗?', name: 'tomatoanon_answer', type: 'select', options: [ ['0','我不清楚，我必须在读完所有信息后才能做出选择。'], ['1','是的，我了解并且希望做个选择。'] ], value: nvram.tomatoanon_answer, suffix: ' '},
					{ title: '您想启用TomatoAnon吗？', name: 'tomatoanon_enable', type: 'select', options: [ ['-1','现在还不想。'], ['1','我确定要启用。'], ['0','我不想启用。'] ], value: nvram.tomatoanon_enable, suffix: ' '}
				]);
			</script>
		</div>

		<button type="button" value="Save" id="save-button" onclick="save()" class="btn btn-primary">保存 <i class="icon-check"></i></button>
		<button type="button" value="Cancel" id="cancel-button" onclick="javascript:reloadPage();" class="btn">取消 <i class="icon-cancel"></i></button>
		<span id="footer-msg" class="alert alert-warning" style="visibility: hidden;"></span>

	</form>

	<script type="text/javascript">verifyFields(null, 1); init();</script>
</content>
