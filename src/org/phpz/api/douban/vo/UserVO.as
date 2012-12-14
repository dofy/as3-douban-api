package org.phpz.api.douban.vo
{
    
    /**
     * User 数据对象
     * @author Seven Yu
     */
    public class UserVO
    {
        
        public var id:String;
        public var uid:String;
        public var name:String;
        public var avatar:String;
        public var alt:String;
        public var relation:String;
        public var created:String;
        public var loc_id:String;
        public var loc_name:String;
        public var desc:String;
        
        public function UserVO(data:Object)
        {
            id = data['id'];
            uid = data['uid'];
            name = data['name'];
            avatar = data['avatar'];
            alt = data['alt'];
            if (data['created'])
            {
                relation = data['relation'];
                created = data['created'];
                loc_id = data['loc_id'];
                loc_name = data['loc_name'];
                desc = data['desc'];
            }
        }
    
    }

}