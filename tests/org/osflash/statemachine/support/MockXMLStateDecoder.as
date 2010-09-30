package org.osflash.statemachine.support {
import org.osflash.statemachine.base.BaseState;
import org.osflash.statemachine.base.BaseXMLStateDecoder;
import org.osflash.statemachine.core.IState;

public class MockXMLStateDecoder extends BaseXMLStateDecoder {
	public function MockXMLStateDecoder( fsm:XML ){
		super(fsm);
	}

	override public function decodeState( stateDef:Object ):IState{
		return new BaseState(stateDef.@name);
	}
}
}