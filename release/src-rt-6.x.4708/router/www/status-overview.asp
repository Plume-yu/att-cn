<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<meta name="robots" content="noindex,nofollow">
		<title>[<% ident(); %>]: 主页</title>

		<!-- Interface Design -->
		<link href="css/interface.css" rel="stylesheet">
		<% css(); %>

		<!-- Load Favicon (icon) -->
		<link rel="shortcut icon" href="/favicon.ico" />

		<!-- One time load JAVASCRIPT -->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="tomato.js"></script>
		<script type="text/javascript" src="js/advancedtomato.js"></script>

		<!-- Variables which we keep through whole GUI, also determine Tomato version here -->
		<script type="text/javascript">

			var wl_ifaces = {};
			var routerName = '[<% ident(); %>] ';
			//<% nvram("at_nav,at_nav_action,at_nav_state,at_update,tomatoanon_answer"); %>
			//<% anonupdate(); %>

			// AdvancedTomato related object
			var gui = {
				'ajax_state'   : false,
				'nav_delay'    : null,
				'nav_action'   : ( ( typeof(nvram.at_nav_action) != 'undefined' && nvram.at_nav_action == 'hover' ) ? 'mouseover' : 'click' ),
				'refresh_timer': null,
				'version'      : "<% version(0); %>",
			};

			// ARM Only
			var lastjiffiestotal = 0;
			var lastjiffiesidle = 0;
			var lastjiffiesusage = 100;

			// On DOM Ready, parse GUI version and create navigation
			$( document ).ready( function() {

				// Attempt match
				match_regex = gui.version.match( /^1\.28\.0000.*?([0-9]{1,3}\.[0-9]{1}\-[0-9]{3}).* ([a-z0-9\-]+)$/i );

				// Check matches
				if ( match_regex == null || match_regex[ 1 ] == null ) {

					gui.version = '更多信息'

				} else {

					gui.version = 'v' + match_regex[ 1 ] + ' ' + match_regex[ 2 ];

				}

				// Write version & initiate GUI functions & binds
				$( '#gui-version' ).html( '<i class="icon-info-alt"></i> <span class="nav-collapse-hide">' + gui.version + '</span>' );
				AdvancedTomato();

			});

		</script>
	</head>
	<body>
		<div id="wrapper">

			<div class="top-header">

				<a href="/">
					<div class="logo">
						 <svg version="1.1" id="logo" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="26px" height="26px" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve">
						 <path id="mi" fill="#fff" d="M24.5,7.8h3.9v16.4h-3.9V7.8z M10.5,14.1h4v9.9h-4V14.1z M3.6,7.8l3.9,0h9.8c2.5,0,4.2,2.2,4.2,4.6c0,3.7,0,11.7,0,11.7l-3.8,0l-0.1-10.5c0-1.5-1-2.4-2.4-2.4c-1.8,0-6.5,0-7.7,0v12.9H3.6V7.8z"/>
						 </svg>
						<h1 class="nav-collapse-hide">Xiaomi<span>MiWiFi</span></h1>
						<h2 class="currentpage nav-collapse-hide">载入中...</h2>
						
					</div>
				</a>

				<div class="left-container">
					<a title="Toggle Collapsed Navigation" href="#" class="toggle-nav"><i class="icon-toggle-nav"></i></a>
				</div>

				<div class="pull-right links">
					<ul>
						<li><a title="Tools" href="#tools-ping.asp">工具 <i class="icon-tools"></i></a></li>
						<li><a title="Bandwidth" href="#bwm-realtime.asp">带宽监控 <i class="icon-graphs"></i></a></li>
						<li><a title="IP Traffic" href="#bwm-ipt-realtime.asp">流量监控 <i class="icon-traffic"></i></a></li>
						<li><a title="System" id="system-ui" href="#system">系统 <i class="icon-system"></i></a></li>
					</ul>
					<div class="system-ui">

						<div class="datasystem align center"></div>

						<div class="router-control">
							<a href="#" class="btn btn-primary" onclick="reboot();">重启 <i class="icon-reboot"></i></a>
							<a href="#" class="btn btn-danger" onclick="shutdown();">关机 <i class="icon-power"></i></a>
							<a href="#" onclick="logout();" class="btn">注销 <i class="icon-logout"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="navigation">
				<ul>
					<li class="nav-footer" id="gui-version" style="cursor: pointer;" onclick="loadPage('#about.asp');"></li>
				</ul>
			</div>


			<div class="container">
				<div class="ajaxwrap">

					<div class="container-center">
						<div class="spinner spinner-large"></div><br><br>
						正在载入界面，请稍候...
					</div>

				</div>

				<div class="clearfix"></div>

			</div>

		</div>
	</body>
</html>
