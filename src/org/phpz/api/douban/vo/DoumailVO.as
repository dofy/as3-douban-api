package org.phpz.api.douban.vo 
{
	/**
     * ...
     * @author Seven Yu
     */
    public class DoumailVO 
    {
        
        public var status:String; // Y:垃圾未读 X:垃圾已读 U:未读 R:已读
        public var id:String;
        public var sender:UserVO;
        public var receiver:UserVO;
        public var title:String;
        public var published:Date;
        public var content:String;
        
        public function DoumailVO(data:Object) 
        {
            status = data['status'];
            id = data['id'];
            sender = new UserVO(data['sender']);
            receiver = new UserVO(data['receiver']);
            title = data['title'];
            published = data['published'];
            content = data['content'];
        }
        
        private function setPublished(dateString:String):void
        {
            var dt:Array = dateString.split(' ');
            var ds:Array = dt[0].split('-');
            var ts:Array = dt[1].split(':');
            
            published = new Date(ds[0], ds[1], ds[2], ts[0], ts[1], ts[2]);
        }
        
    }

}