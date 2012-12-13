package org.phpz.api.events 
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class HttpEvent extends Event 
    {
        
        public function HttpEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
        { 
            super(type, bubbles, cancelable);
            
        } 
        
        public override function clone():Event 
        { 
            return new HttpEvent(type, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("HttpEvent", "type", "bubbles", "cancelable", "eventPhase"); 
        }
        
    }
    
}