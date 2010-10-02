package org.osflash.statemachine.supporting {
import org.osflash.statemachine.base.BaseTransitionController;
import org.osflash.statemachine.core.IState;

public class SetCurrentStateTransitionController extends BaseTransitionController {
	override protected function onTransition( target:IState, payload:Object ):void{
		setCurrentState( target );
	}
}
}