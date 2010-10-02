package org.osflash.statemachine.supporting {
import org.osflash.statemachine.base.BaseTransitionController;
import org.osflash.statemachine.core.IState;

public class IsTransitionTrueTransitionController extends BaseTransitionController {

	override public function get isTransitioning():Boolean{
		return true
	}

	/*override protected function onTransition( target:IState, payload:Object ):void{
		setCurrentState( target );
	}*/
}
}