package org.phpz.api.douban.vo 
{
	/**
     * ...
     * @author Seven Yu
     */
    public class ErrorVO 
    {
        
        public var code:int;
        public var msg:String;
        public var request:String;
        
        public function ErrorVO(data:Object) 
        {
            code = data['code'];
            msg = data['msg'];
            request = data['request'];
        }
        
    }

}