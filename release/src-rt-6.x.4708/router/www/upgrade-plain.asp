<html>
    <head><title>固件升级</title>
    <script type="text/javascript">
    function upgrade() {
        document.form_upgrade.submit();
    }
    </script>
    </head>
    <body>
        <h1>固件升级</h1>
        <b>警告:</b>
        <ul>
            <li>当你点击升级按钮后，本页面不会显示上传信息，仅当升级完成时页面才会刷新。
            <li>升级大约需要3分钟，请不要关闭浏览器窗口和路由器电源。
        </ul>
        <br>
        <form name="form_upgrade" method="post" action="upgrade.cgi?_http_id=<% nv(http_id); %>" encType="multipart/form-data">
            <label>选择固件:</label>
            <input type="file" name="file" size="50"> <button type="button" value="Upgrade" id="afu-upgrade-button" onclick="upgrade()" class="btn btn-danger">升级</button>
        </form>
    </body>
</html>
