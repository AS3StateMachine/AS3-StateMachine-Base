/*
 ADAPTED FOR ROBOTLEGS FROM:
 PureMVC AS3 Utility - StateMachine
 Copyright (c) 2008 Neil Manuell, Cliff Hall
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package org.osflash.statemachine
{
import org.osflash.statemachine.base.*;
import org.osflash.statemachine.core.IState;
import org.osflash.statemachine.core.IStateMachine;
import org.osflash.statemachine.core.ITransitionController;
import org.osflash.statemachine.errors.StateTransitionError;

public class StateMachine implements IStateMachine
{

    /**
     * Map of States objects by name.
     */
    protected var states:Object = new Object();

    /**
     * The initial state of the FSM.
     */
    protected var initial:IState;

    /**
     * The ITransitionController instance.
     */
    protected var transitionController:ITransitionController;

    /**
     *
     * @param controller
     */
    public function StateMachine( controller:ITransitionController ):void{
        transitionController = controller;
        initiate()
    }

    /**
     * @private
     */
    private function initiate():void {
        transitionController.actionCallback = doAction;
    }

    /**
     * @inheritDoc
     */
    public function get currentStateName():String { return transitionController.currentState.name.valueOf(); }

    /**
     * @inheritDoc
     */
    public function onRegister():void{
        if ( initial )
            transitionTo( initial, null );
    }

    /**
     * @inheritDoc
     */
    public function hasState(stateName:String):Boolean {
        return ( states[ stateName ] != null );
    }

    /**
     * @inheritDoc
     */
    public function registerState( state:IState, initial:Boolean=false ):Boolean
    {
        if ( state == null || hasState( state.name ) ) return false;
        states[ state.name ] = state;
        if ( initial ) this.initial = IState( state );
        return true;
    }

    /**
     * @inheritDoc
     */
    public function removeState( stateName:String ):Boolean{
        if( !hasState( stateName ) ) return false;
        delete states[ stateName ];
        return true;
    }

    /**
     * @inheritDoc
     */
    public function destroy():void{
        transitionController.destroy();
        for each ( var state:IState in states )  state.destroy();
        states = null;
        initial = null;
        transitionController = null;
    }

    /**
     * Initiates transition process.
     * Its OK, you don't have to worry about this as it is set as the ITranstionController's actionCallback property.
     * @see #initiate()
     * @param action
     * @param payload
     */
    protected function doAction(action:String, payload:Object ):void{
        var newStateTarget:String = transitionController.currentState.getTarget( action );
        var newState:IState = IState( states[ newStateTarget ] );
        if( newState )
            transitionTo( newState, payload );
    }

    /**
     *
     * @param targetState
     * @param payload
     * @throws org.osflash.statemachine.errors.StateTransitionError
     */
    protected function transitionTo( targetState:IState, payload:Object=null ):void{
        if( targetState == null ) return;
        if( transitionController.isTransitioning )
            throw new StateTransitionError( StateTransitionError.ALREADY_TRANSITIONING);
        transitionController.transition( targetState, payload);
    }

}
}