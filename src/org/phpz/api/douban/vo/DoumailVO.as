package org.phpz.api.douban.vo 
{
	/**
     * ...
     * @author Seven Yu
     */
    public class DoumailVO 
    {
        
        public var status:String;
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
            sender = data['sender'];
            receiver = data['receiver'];
            title = data['title'];
            published = data['published'];
            content = data['content'];
        }
        
    }

}