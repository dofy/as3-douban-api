Douban API (V2) for as3(Air)
============================

豆瓣 API (v2) for as3(Air) *注意,目前只能正常用于 Air 程序中*

目前已完成的 API:
-----------------
* OAuth2
* 用户
* 豆邮

示例代码:
---------
    public class Test extends Sprite
    {
        
        public function Test()
        {
            AppConfig.baseURL = 'https://api.douban.com';
            
            AppConfig.apiKey = 'your api key';
            AppConfig.secret = 'your secret';
            
            AppConfig.redirectUri = 'http://your.site.com/callback';
            
            // 这个 access token 用来做测试的, 正常情况下应该在得到 access_token 后保存到客户端文件中
            AppConfig.accessToken = 'test access token';
            
            // 定义一个 User Api 对象
            var user:User = new User();
            // 绑定事件 (只有这两个事件)
            user.addEventListener(ApiEvent.SUCCESS, succHandler);
            user.addEventListener(ApiEvent.FAILED, failHandler);
            
            // 获取当前授权用户信息
            user.me();
            // 获取某用户信息
            //user.user('dofy');
            // 搜索用户
            //user.search('dofy');
            
            // OAuth2
            var oauth:OAuth2 = new OAuth2('https://www.douban.com');
            oauth.addEventListener(ApiEvent.SUCCESS, succHandler);
            oauth.addEventListener(ApiEvent.FAILED, failHandler);
            // auth 方法会弹出页面, 重定向到 redirectUri, 地址中包含 code
            //oauth.auth(AppConfig.apiKey, AppConfig.redirectUri, OAuth2.CODE);
            // 用上一步拿到的 code 获取 access_token
            //oauth.accessToken(AppConfig.apiKey, AppConfig.secret, AppConfig.redirectUri, 'auth code');
            
        }
        
        private function succHandler(e:ApiEvent):void 
        {
            // ApiEvent 事件中除了包含返回的数据外, 
            // 还会包含对应请求的 方法,Http 状态码 和 请求地址
            // 返回数据中会附加 request(即使是正确的返回) 和 http_status 属性
            trace('success handler:', e, JSON.stringify(e.data));
            switch(e.url)
            {
                case '/v2/user/~me':
                    // 格式化成数据对象
                    var userVO:UserVO = new UserVO(e.data);
                    trace('user created', userVO.created.toLocaleString());
                    break;
            }
        }
        
        private function failHandler(e:ApiEvent):void 
        {
            trace('failed handler:', e, JSON.stringify(e.data));
        }
    }
