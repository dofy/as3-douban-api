package org.phpz.api.douban.vo 
{
	/**
     * ...
     * @author Seven Yu
     */
    public class TokenVO 
    {
        
        public var accessToken:String;
        public var refreshToken:String;
        public var expiresIn:int;
        public var doubanUserId:String;
        
        public function TokenVO(data:Object) 
        {
            accessToken = data['access_token'];
            refreshToken = data['refresh_token'];
            expiresIn = data['expires_in'];
            doubanUserId = data['douban_user_id'];
        }
        
    }

}