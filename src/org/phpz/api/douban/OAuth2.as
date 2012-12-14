package org.phpz.api.douban 
{
    import flash.net.URLRequestMethod;
    
	/**
     * OAuth 2.0
     * Douban API OAuth 2.0
     * @author Seven Yu
     */
    public class OAuth2 extends APIBase 
    {
        
        private var _baseURL:String;
        
        public static const CODE:String = 'code';
        public static const TOKEN:String = 'token';
        public static const PASSWORD:String = 'password';
        public static const AUTHORIZATION_CODE:String = 'authorization_code';
        public static const REFRESH_TOKEN :String = 'refresh_token';
        
        /**
         * OAuth 2.0
         * @param baseURL   请求基地址
         */
        public function OAuth2(baseURL:String = null)
        {
            this._baseURL = baseURL || '';
        }
        
        /**
         * 获取 auth 授权 code
         * @param clientId      API KEY
         * @param redirectUri   重定向地址
         * @param responseType  获取类型 (code/token)
         * @param scope         申请权限列表
         * @param state         附加状态码
         */
        public function auth(clientId:String, redirectUri:String, responseType:String, scope:Array = null, state:String = null):void
        {
            var scopeString:String = scope ? scope.join(',') : null;
            apiToUrl(baseURL + '/service/auth2/auth', { 'client_id': clientId, 'redirect_uri': redirectUri, 'response_type':responseType, 'scope': scopeString, 'state':state } );
        }
        
        /**
         * 获取 access token
         * @param clientId      API Key
         * @param clientSecret  API Secret
         * @param redirectUri   重定向地址
         * @param code          auth 授权中得到的 code
         */
        public function accessToken(clientId:String, clientSecret:String, redirectUri:String, code:String):void
        {
            apiSend(baseURL + '/service/auth2/token', URLRequestMethod.POST, { 'client_id': clientId, 'client_secret':clientSecret, 'redirect_uri': redirectUri, 'grant_type':OAuth2.AUTHORIZATION_CODE, 'code':code }, false );
        }
        
        /**
         * access token 延期
         * @param clientId      API Key
         * @param clientSecret  API Secret
         * @param redirectUri   重定向地址
         * @param refreshToken  之前获取到的 refresh token
         */
        public function refreshToken(clientId:String, clientSecret:String, redirectUri:String, refreshToken:String):void
        {
            apiSend(baseURL + '/service/auth2/token', URLRequestMethod.POST, { 'client_id': clientId, 'client_secret':clientSecret, 'redirect_uri': redirectUri, 'grant_type':OAuth2.REFRESH_TOKEN, 'refresh_token':refreshToken }, false );
        }
        
        /**
         * xAuth 方式认证
         * @param clientId      API Key
         * @param clientSecret  API Secret
         * @param username      用户名
         * @param password      密码
         */
        public function xAuth(clientId:String, clientSecret:String, username:String, password:String):void
        {
            apiSend(baseURL + '/service/auth2/token', URLRequestMethod.POST, { 'client_id': clientId, 'client_secret':clientSecret, 'grant_type':OAuth2.PASSWORD, 'username':username, 'password':password }, false);
        }
        
        /**
         * 基地址
         */
        public function get baseURL():String
        {
            return _baseURL;
        }
        
    }

}