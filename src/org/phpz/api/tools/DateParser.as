package org.phpz.api.tools
{
    
    /**
     * 解析日期字符串
     * @author Seven Yu
     */
    public class DateParser
    {
        
        public function DateParser()
        {
        }
        
        /**
         * 解析器
         * @param dateString    日期字符串
         * @return  返回 Date 类型日期
         */
        public static function parse(dateString:String):Date
        {
            var dt:Array = dateString.split(' ');
            var ds:Array = dt[0].split('-');
            var ts:Array = dt[1].split(':');
            
            return new Date(ds[0], ds[1] - 1, ds[2], ts[0], ts[1], ts[2]);
        }
    
    }

}