package org.osflash.statemachine.supporting {
import org.osflash.statemachine.base.BaseState;
import org.osflash.statemachine.base.BaseXMLStateDecoder;
import org.osflash.statemachine.core.IState;

public class MockXMLStateDecoder extends BaseXMLStateDecoder {

	public var hasDestroyMethodBeenCalled:Boolean;

	public function MockXMLStateDecoder( fsm:XML ){
		super(fsm);
	}

	override public function decodeState( stateDef:Object ):IState{
		return new BaseState(stateDef.@name);
	}

	override public function destroy():void{
		super.destroy();
		hasDestroyMethodBeenCalled = true;
	}
}
}