/*
 ADAPTED FOR ROBOTLEGS FROM:
 PureMVC AS3 Utility - StateMachine
 Copyright (c) 2008 Neil Manuell, Cliff Hall
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package org.osflash.statemachine {
import org.osflash.statemachine.core.IState;
import org.osflash.statemachine.core.IStateDecoder;
import org.osflash.statemachine.core.IStateMachine;

/**
 *
 */
public class FSMInjector {

	/**
	 * The instance of the decoder
	 */
	protected var stateDecoder:IStateDecoder;

	/**
	 * Creates an instance of the FSMInjector.
	 * @param stateDecoder the decoder used in this instance.
	 */
	public function FSMInjector( stateDecoder:IStateDecoder ){
		this.stateDecoder = stateDecoder;
	}

	/**
	 * Registers all the decoded states with the IStateMachine, then calls the onRegister method.
	 * @param stateMachine
	 */
	public function inject( stateMachine:IStateMachine ):void{
		var states:Array = stateDecoder.getStateList();
		for each ( var state:IState in states )
			stateMachine.registerState( state, isInitial( state.name ) );
		stateMachine.onRegister();
	}

	/**
	 *
	 * @param stateName
	 * @return whether the given state name is the initial state
	 */
	protected function isInitial( stateName:String ):Boolean{
		return stateDecoder.isInitial( stateName );
	}


}
}