package org.phpz.api.douban
{
    import flash.net.URLRequestMethod;
    import org.phpz.api.douban.events.ApiEvent;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Doumail extends APIBase
	{
		
        
        public function inbox():void
        {
            apiSend('/v2/doumail/inbox', URLRequestMethod.GET);
        }
        
        public function outbox():void
        {
            apiSend('/v2/doumail/outbox', URLRequestMethod.GET);
        }
        
        public function unread():void
        {
            apiSend('/v2/doumail/unread', URLRequestMethod.GET);
        }
        
        public function getMail(id:String, keepUnread:Boolean = false):void
        {
            apiSend('/v2/doumail/' + id, URLRequestMethod.GET, { "keep-unread": keepUnread } );
        }
        
        public function markAsRead(ids:Array):void
        {
            apiSend('/v2/doumail/read', URLRequestMethod.PUT, {"ids": ids.join(',')});
        }
        
        public function markOneAsRead(id:String):void
        {
            apiSend('/v2/doumail/' + id, URLRequestMethod.PUT);
        }
        
        public function delMail(id:String):void
        {
            apiSend('/v2/doumail/' + id, URLRequestMethod.DELETE);
        }
        
        protected override function succFunc(url:String, data:Object):void
        {
            trace('SUCCESS >>>', url, '\n', JSON.stringify(data));
            dispatchEvent(new ApiEvent(ApiEvent.SUCCESS, url, null));
        }
		
	}
	
}