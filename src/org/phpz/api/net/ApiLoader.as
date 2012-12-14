package org.phpz.api.net
{
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    
    /**
     * URLLoader 的一个扩展, 增加了一些属性
     * @author Seven Yu
     */
    public class ApiLoader extends URLLoader
    {
        
        public var httpStatus:int;
        
        private var _method:String;
        private var _url:String;
        
        /**
         * 若在构造函数中传 URL 请求, 也要保存属性
         * @param request   URL 请求
         */
        public function ApiLoader(request:URLRequest = null)
        {
            if (request)
            {
                _method = request.method;
                _url = request.url;
            }
            super(request);
        }
        
        /**
         * 覆盖 load 方法, 保存属性
         * @param request   URL 请求
         */
        override public function load(request:URLRequest):void
        {
            _method = request.method;
            _url = request.url;
            super.load(request);
        }
        
        /**
         * 请求方法
         */
        public function get method():String
        {
            return _method;
        }
        
        /**
         * 请求地址
         */
        public function get url():String
        {
            return _url;
        }
    
    }

}