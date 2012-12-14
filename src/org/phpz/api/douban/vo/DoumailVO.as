package org.phpz.api.douban.vo
{
    import org.phpz.api.tools.DateParser;
    
    /**
     * 豆邮数据对象
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
            published = DateParser.parse(data['published']);
            content = data['content'];
        }
    
    }

}