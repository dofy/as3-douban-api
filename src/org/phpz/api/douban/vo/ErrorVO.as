package org.phpz.api.douban.vo
{
    
    /**
     * Error 数据对象
     * @author Seven Yu
     */
    public class ErrorVO
    {
        
        public var code:int;
        public var msg:String;
        public var request:String;
        public var httpStatus:int;
        
        public function ErrorVO(data:Object)
        {
            code = data['code'];
            msg = data['msg'];
            request = data['request'];
            httpStatus = data['http_status'];
        }
    
    }

}