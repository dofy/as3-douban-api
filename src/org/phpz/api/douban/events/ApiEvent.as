package org.phpz.api.douban.events 
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class ApiEvent extends Event 
    {
        public static const SUCCESS:String = 'success';
        public static const FAILED:String = 'failed';
        
        private var _url:String;
        private var _voObj:*;
        
        public function ApiEvent(type:String, url:String, voObj:*, bubbles:Boolean=false, cancelable:Boolean=false) 
        {
            super(type, bubbles, cancelable);
            
            this._url = url;
            this._voObj = voObj;
        }
        
        public function get url():String
        {
            return _url;
        }
        
        public function get voObj():Object
        {
            return _voObj;
        }
        
        public override function clone():Event 
        { 
            return new ApiEvent(type, url, voObj, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("ApiEvent", "type", "url", "bubbles", "cancelable", "eventPhase"); 
        }
        
    }
    
}