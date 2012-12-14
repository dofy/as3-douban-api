package org.phpz.api.douban
{
    import flash.net.URLRequestMethod;
    import org.phpz.api.douban.events.ApiEvent;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class User extends APIBase
	{
		
        public function User()
        {
            super();
        }
        
        public function getMe():void
        {
            apiSend('/v2/user/~me', URLRequestMethod.GET);
        }
        
        public function getUser(name:String):void
        {
            apiSend('/v2/user/' + name, URLRequestMethod.GET);
        }
        
        public function test():void
        {
            apiSend('/app/test.php', URLRequestMethod.GET, null, false);
        }
        
        protected override function succFunc(url:String, data:Object):void
        {
            trace('SUCCESS >>>', url, '\n', JSON.stringify(data));
            dispatchEvent(new ApiEvent(ApiEvent.SUCCESS, url, null));
        }
		
	}
	
}