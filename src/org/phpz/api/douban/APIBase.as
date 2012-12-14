package org.phpz.api.douban 
{
    import flash.events.Event;
    import flash.net.URLRequestHeader;
    import org.phpz.api.douban.events.ApiEvent;
    import org.phpz.api.douban.vo.ErrorVO;
    import org.phpz.api.net.ApiLoader;
    import org.phpz.api.net.Http;
	
    
    [Event(name = "success", type = "org.phpz.api.douban.events.ApiEvent")] 
    
    [Event(name = "failed", type = "org.phpz.api.douban.events.ApiEvent")] 
    
    
	/**
     * ...
     * @author Seven Yu
     */
    public class APIBase extends Http 
    {
        
        
        protected function apiSend(url:String, method:String, params:Object = null, auth:Boolean = true):void
        {
            var headers:Array = auth ? [new URLRequestHeader('Authorization', 'Bearer ' + AppConfig.accessToken)] : [];
            this.send(AppConfig.baseURL + url, method, params, headers);
        }
        
        protected override function completeHandler(e:Event):void
        {
            var data:Object;
            var loader:ApiLoader = e.target as ApiLoader;
            var apiUrl:String = loader.url.replace(AppConfig.baseURL, '');
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
                data = { "code": 7999, "msg": "UNKNOW ERROR!! (" + loader.httpStatus + ")", "request": loader.method + " " + apiUrl };
            }
            
            if (data.code > 0)
            {
                failFunc(apiUrl, data);
            }
            else
            {
                succFunc(apiUrl, data);
            }
        }
        
        protected function succFunc(url:String, data:Object):void
        {
            throw new Error('Please override this method in sublcasses.');
        }
        
        protected function failFunc(url:String, data:Object):void
        {
            //throw new Error('Please override this method in sublcasses.');
            
            trace('FAILED >>>', url);
            dispatchEvent(new ApiEvent(ApiEvent.FAILED, url, new ErrorVO(data)));
        }
        
    }

}