package org.phpz.api.douban.events 
{
    import flash.events.Event;
    
    /**
     * API Event
     * @author Seven Yu
     */
    public class ApiEvent extends Event 
    {
        
        public static const SUCCESS:String = 'success';
        public static const FAILED:String = 'failed';
        
        private var _method:String;
        private var _status:int;
        private var _url:String;
        
        private var _data:Object;
        
        /**
         * API Event
         * @param type          事件类型
         * @param method        API 请求方法
         * @param status        API 请求 http status
         * @param url           API 请求地址
         * @param data          返回数据
         * @param bubbles       
         * @param cancelable
         */
        public function ApiEvent(type:String, method:String, status:int, url:String, data:Object, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
            
            this._method = method;
            this._status = status;
            this._url = url;
            
            this._data = data;
        }
        
        /**
         * API 请求方法
         */
        public function get method():String
        {
            return _method;
        }
        
        /**
         * API 请求 http status
         */
        public function get status():int
        {
            return _status;
        }
        
        /**
         * API 请求地址
         */
        public function get url():String
        {
            return _url;
        }
        
        /**
         * 返回数据
         */
        public function get data():Object
        {
            return _data;
        }
        
        public override function clone():Event 
        { 
            return new ApiEvent(type, method, status, url, data, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("ApiEvent", "type", "method", "status", "url"); 
        }
        
    }
    
}