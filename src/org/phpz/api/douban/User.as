package org.phpz.api.douban
{
    import flash.net.URLRequestMethod;
    import org.phpz.api.douban.events.ApiEvent;
    
    /**
     * 用户 API
     * @author Seven Yu
     */
    public class User extends APIBase
    {
        
        /**
         * 获取当前授权用户信息
         */
        public function me():void
        {
            apiSend('/v2/user/~me');
        }
        
        /**
         * 获取用户信息
         * @param name  用户 uid 或 数字 id
         */
        public function user(name:String):void
        {
            apiSend('/v2/user/' + name);
        }
        
        /**
         * 搜索用户
         * @param q     全文检索关键词
         * @param start 起始元素
         * @param count 结果返回数
         */
        public function search(q:String, start:int = 0, count:int = 20):void
        {
            apiSend('/v2/user', URLRequestMethod.GET, {'q': q, 'start': start, 'count': count});
        }
        
        public function User()
        {
        }
    }

}