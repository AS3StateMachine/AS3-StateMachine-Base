package org.osflash.statemachine.logging {
	import org.osflash.statemachine.core.ILoggable;

	/**
	 * Simple logger thaty wraps a trace statement
	 */
	public class TraceStateLogger implements ILoggable {

		/**
		 * private
		 */
		private var _prefix:String;

		/**
		 * Constructor
		 * @param prefix String to prefix all log messages with
		 */
		public function TraceStateLogger(prefix:String){
			_prefix = prefix;
		}

		/**
		 * @inheritDoc
		 */
		public function log( msg:String, level:int = 2 ):void{
			trace(_prefix + msg);
		}
	}
}