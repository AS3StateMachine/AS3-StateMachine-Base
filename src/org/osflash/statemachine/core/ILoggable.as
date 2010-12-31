package org.osflash.statemachine.core {
	public interface ILoggable{
		/**
		 * Allows wrapping of logging functionality within the StateMachine framework
		 * @param msg The message to log
		 * @param level The level at which to set the message
		 */
		function log( msg:String, level:int = 2 ):void;
		
	}
}