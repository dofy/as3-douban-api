package org.phpz.api.douban
{
    import flash.events.Event;
    import flash.net.URLRequestHeader;
    import org.phpz.api.douban.events.ApiEvent;
    import org.phpz.api.net.ApiLoader;
    import org.phpz.api.net.Http;
    
    [Event(name="success",type="org.phpz.api.douban.events.ApiEvent")]
    [Event(name="failed",type="org.phpz.api.douban.events.ApiEvent")]
    
    /**
     * API 请求基类
     * @author Seven Yu
     */
    public class APIBase extends Http
    {
        
        /**
         * 弹出窗口 (用户 auth 认证)
         * @param url       请求地址
         * @param params    请求参数
         * @param window    打开窗口
         */
        protected function apiToUrl(url:String, params:Object = null, window:String = null):void
        {
            url = /^https?\:\/\//i.test(url) ? url : AppConfig.baseURL + url;
            toURL(url, params, window);
        }
        
        /**
         * 发送 API 请求
         * @param url       请求地址
         * @param method    请求方法
         * @param params    请求参数
         * @param auth      是否需要附加验证 Header
         */
        protected function apiSend(url:String, method:String = 'GET', params:Object = null, auth:Boolean = true):void
        {
            var headers:Array = auth ? [new URLRequestHeader('Authorization', 'Bearer ' + AppConfig.accessToken)] : [];
            url = /^https?\:\/\//i.test(url) ? url : AppConfig.baseURL + url;
            send(url, method, params, headers);
        }
        
        /**
         * 处理成功事件 (覆盖了父类的方法)
         * @param e
         */
        protected override function completeHandler(e:Event):void
        {
            var data:Object;
            var loader:ApiLoader = e.target as ApiLoader;
            var apiUrl:String = loader.url.replace(AppConfig.baseURL, '');
            
            // 尝试解析返回数据
            try
            {
                data = JSON.parse(loader.data);
                if (!data['code'])
                {
                    data['code'] = 0;
                }
            }
            // 解析失败
            catch (e:Error)
            {
                // 若 data == null, http status 缺为 200 (删除类返回)
                if (loader.data == 'null' && loader.httpStatus == 200)
                {
                    data = {'code': 0, 'msg': 'SUCCESS~~'};
                }
                // 发生其他错误
                else
                {
                    data = {'code': 7999, 'msg': 'UNKNOW ERROR!!'};
                }
            }
            
            // 所有返回都附加两个属性
            if (!data['request'])
            {
                data['request'] = loader.method + ' ' + apiUrl;
            }
            data['http_status'] = loader.httpStatus;
            
            // 处理结果
            if (data['code'] > 0)
            {
                trace('FAILED >>>', apiUrl);
                dispatchEvent(new ApiEvent(ApiEvent.FAILED, loader.method, loader.httpStatus, apiUrl, data));
            }
            // 有错误码
            else
            {
                trace('SUCCESS >>>', apiUrl);
                dispatchEvent(new ApiEvent(ApiEvent.SUCCESS, loader.method, loader.httpStatus, apiUrl, data));
            }
        }
        
        public function APIBase()
        {
        }
    }

}