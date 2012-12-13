package org.phpz.api.net 
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLRequestHeader;
    import flash.net.URLVariables;
    
	/**
     * ...
     * @author Seven Yu
     */
    public class Http extends EventDispatcher
    {
        
        protected var loader:URLLoader;
        protected var request:URLRequest;
        protected var vars:URLVariables;
        
        protected var succFunc:Function;
        protected var failFunc:Function;
        
        public function Http(succFunc:Function = null, failFunc:Function = null)
        {
            this.succFunc = succFunc;
            this.failFunc = failFunc;
        }
        
        protected function send(url:String, method:String, params:Object = null, headers:Vector.<URLRequestHeader> = null):void
        {
            request = new URLRequest(url);
            request.method = method;
            request.requestHeaders = headers || [];
            
            vars = new URLVariables();
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
        }
        
        protected function ioErrorHandler(e:IOErrorEvent):void 
        {
            trace(e);
        }
        
        protected function statusHandler(e:HTTPStatusEvent):void 
        {
            trace('status: ', request.url, e.status);
            status = e.status;
        }
        
        protected function completeHandler(e:Event):void 
        {
            var data:Object;
            try 
            {
                data = JSON.parse(e.target.data);
                if (!data['code'])
                {
                    data['code'] = 0;
                }
            }
            catch (e:Error)
            {
                data = {"code": 7999, "msg": "UNKNOW ERROR!! (" + status + ")"};
            }
            
            if (data.code > 0)
            {
                failFunc && failFunc(data, request.url);
            }
            else
            {
                succFunc && succFunc(data, request.url);
            }
        }
        
    }

}