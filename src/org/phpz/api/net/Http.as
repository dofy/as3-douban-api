package org.phpz.api.net
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    
    /**
     * HTTP 请求基类
     * @author Seven Yu
     */
    public class Http extends EventDispatcher
    {
        
        protected var loader:ApiLoader;
        
        protected function toURL(url:String, params:Object = null, window:String = null):void
        {
            var request:URLRequest = new URLRequest(url);
            var vars:URLVariables = new URLVariables();
            if (params)
            {
                for (var key:String in params)
                {
                    vars[key] = params[key];
                }
            }
            request.data = vars;
            navigateToURL(request, window);
        }
        
        /**
         * 发送请求
         * @param url       请求地址
         * @param method    请求方法
         * @param params    请求参数
         * @param headers   请求附加头信息
         */
        protected function send(url:String, method:String = 'GET', params:Object = null, headers:Array = null):void
        {
            loader = new ApiLoader();
            var request:URLRequest = new URLRequest(url);
            request.method = method;
            request.requestHeaders = headers;
            
            var vars:URLVariables = new URLVariables();
            if (params)
            {
                for (var key:String in params)
                {
                    vars[key] = params[key];
                }
            }
            request.data = vars;
            
            loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            loader.addEventListener(HTTPStatusEvent.HTTP_RESPONSE_STATUS, statusHandler);
            loader.addEventListener(Event.COMPLETE, completeHandler);
            
            loader.load(request);
        }
        
        /**
         * 处理 IO 错误
         * @param e
         */
        protected function ioErrorHandler(e:IOErrorEvent):void
        {
            trace(e);
        }
        
        /**
         * 处理 HTTP Status 事件
         * @param e
         */
        protected function statusHandler(e:HTTPStatusEvent):void
        {
            var loader:ApiLoader = e.target as ApiLoader;
            trace('STATUS:', e.status, loader.url);
            loader.httpStatus = e.status;
        }
        
        /**
         * 加载完成事件
         * @param e
         */
        protected function completeHandler(e:Event):void
        {
            trace('<COMPLETE>\n', e.target.data);
        }
    
    }

}