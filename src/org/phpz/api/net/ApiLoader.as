package org.phpz.api.net 
{
    import flash.net.URLLoader;
    import flash.net.URLRequest;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class ApiLoader extends URLLoader 
    {
        
        public var httpStatus:int;
        
        private var _method:String;
        private var _url:String;
        
        public function ApiLoader(request:URLRequest = null) 
        {
            super(request);
            if (request)
            {
                _method = request.method;
                _url = request.url;
            }
        }
        
        override public function load(request:URLRequest):void
        {
            _method = request.method;
            _url = request.url;
            super.load(request);
        }
        
        public function get method():String
        {
            return _method;
        }
        
        public function get url():String
        {
            return _url;
        }
        
    }

}