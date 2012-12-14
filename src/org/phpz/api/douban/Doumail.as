package org.phpz.api.douban
{
    import flash.net.URLRequestMethod;
    import org.phpz.api.douban.events.ApiEvent;
    
    /**
     * 豆邮 API
     * @author Seven Yu
     */
    public class Doumail extends APIBase
    {
        
        /**
         * 获取一封豆邮
         * @param id            豆邮 id
         * @param keepUnread    是否保持未读状态 (默认: false)
         */
        public function mail(id:String, keepUnread:Boolean = false):void
        {
            apiSend('/v2/doumail/' + id, URLRequestMethod.GET, {'keep-unread': keepUnread});
        }
        
        /**
         * 授权用户收件箱
         */
        public function inbox():void
        {
            apiSend('/v2/doumail/inbox');
        }
        
        /**
         * 授权用户发件箱
         */
        public function outbox():void
        {
            apiSend('/v2/doumail/outbox');
        }
        
        /**
         * 授权用户未读邮件
         */
        public function unread():void
        {
            apiSend('/v2/doumail/inbox/unread');
        }
        
        /**
         * 发送一封豆邮
         * @param title         豆邮标题
         * @param content       豆邮正文
         * @param receiverId    接受邮件的用户 id
         * @param captchaToken  系统验证码 token
         * @param captchaString 用户输入验证码
         */
        public function mails(title:String, content:String, receiverId:String, captchaToken:String = null, captchaString:String = null):void
        {
            apiSend('/v2/doumails', URLRequestMethod.POST, {'title': title, 'content': content, 'receiver_id': receiverId, 'captcha_token': captchaToken, 'captcha_string': captchaString});
        }
        
        /**
         * 标记一封邮件已读
         * @param id    豆邮id
         */
        public function markOneAsRead(id:String):void
        {
            apiSend('/v2/doumail/' + id, URLRequestMethod.PUT);
        }
        
        /**
         * 批量标注已读
         * @param ids   豆邮 id 数组
         */
        public function markAllAsRead(ids:Array):void
        {
            apiSend('/v2/doumail/read', URLRequestMethod.PUT, {'ids': ids.join(',')});
        }
        
        /**
         * 删除一封豆邮
         * @param id    豆邮 id
         */
        public function deleteOne(id:String):void
        {
            apiSend('/v2/doumail/' + id, URLRequestMethod.DELETE);
        }
        
        /**
         * 批量删除
         * @param ids   豆邮 id 数组
         */
        public function deleteAll(ids:Array):void
        {
            apiSend('/v2/doumail/delete', URLRequestMethod.POST, {'ids': ids.join(',')});
        }
        
        public function Doumail()
        {
        }
    
    }

}