package org.osflash.statemachine.logging {
	import org.osflash.statemachine.core.IStateLogger;

	public class TraceStateLogger implements IStateLogger {

		private var _prefix:String;

		public function TraceStateLogger(prefix:String){
			_prefix = prefix;
		}

		public function log( msg:String, level:int = 2 ):void{
			trace(_prefix + msg);
		}
	}
}