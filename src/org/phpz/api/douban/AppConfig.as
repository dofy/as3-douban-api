package org.phpz.api.douban
{
    
    /**
     * APP 配置文件, 使用 API 前先对该类进行设置
     * @author Seven Yu
     */
    public class AppConfig
    {
        /**
         * API 地址
         */
        static public var baseURL:String = '';
        
        /**
         * API KEY
         */
        static public var apiKey:String = '';
        
        /**
         * Secret
         */
        static public var secret:String = '';
        
        /**
         * 回调地址
         */
        static public var redirectUri:String = '';
        
        /**
         * access token
         */
        static public var accessToken:String = '';
        
        /**
         * refresh token
         */
        static public var refreshToken:String = '';
        
        public function AppConfig()
        {
        }
    
    }

}