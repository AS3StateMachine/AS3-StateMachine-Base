package org.osflash.statemachine.core {
public interface IFSMInjector {
	function inject( sm:IStateMachine ):void
	function destroy():void;
}
}