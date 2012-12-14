package org.phpz.api.net 
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    
	/**
     * ...
     * @author Seven Yu
     */
    public class Http extends EventDispatcher
    {
        
        protected var loader:ApiLoader;
        
        
        protected function send(url:String, method:String, params:Object = null, headers:Array = null):void
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
        
        protected function ioErrorHandler(e:IOErrorEvent):void 
        {
            trace(e);
        }
        
        protected function statusHandler(e:HTTPStatusEvent):void 
        {
            var loader:ApiLoader = e.target as ApiLoader;
            trace('STATUS:', e.status, loader.url);
            loader.httpStatus = e.status;
        }
        
        protected function completeHandler(e:Event):void 
        {
            trace('<COMPLETE>\n', e.target.data);
        }
        
    }

}