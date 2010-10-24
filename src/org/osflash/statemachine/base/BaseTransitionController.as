package org.osflash.statemachine.base
{
import org.osflash.statemachine.core.IState;
import org.osflash.statemachine.core.ITransitionController;

/**
 * Abstract class for creating custom state transitions
 */
public class BaseTransitionController implements ITransitionController
{
    /**
     * @private
     */
    private var _cancellationReason:String;

    /**
     * @private
     */
    private var _cachedPayload:Object;

	/**
     * @private
     */
    private var _canceled:Boolean;

    /**
     * @private
     */
    private var _currentState:IState;

    /**
     * @private
     */
    private var _isTransitioning:Boolean;

    /**
     * @private
     */
    private var _actionCallback:Function;

	public function BaseTransitionController(){}

    /**
     * @inheritDoc
     */
    public function get currentState():IState { return _currentState; }

    /**
     * @inheritDoc
     */
    public function set actionCallback( value:Function ):void{ _actionCallback = value; }

    /**
     * @inheritDoc
     */
    public function get isTransitioning():Boolean { return _isTransitioning; }

    /**
     * Determines whether the transition has been marked for cancellation.
     */
    protected function get isCanceled():Boolean{ return _canceled; }

    /**
     * The reason given for cancelling the transition.
     */
    protected function get cancellationReason():String{ return _cancellationReason; }

    /**
     * The data payload from the cancel notification.
     */
    protected function get cachedPayload():Object{ return _cachedPayload; }


    /**
     * @inheritDoc
     */
    final public function transition( target:IState, payload:Object = null):void{
        _isTransitioning = true;
        onTransition(target, payload);
        _isTransitioning = false;
		if(!isCanceled)dispatchGeneralStateChanged();
        reset();
    }

    /**
     * @inheritDoc
     */
    public function destroy():void {
        reset();
        _currentState = null;
        _actionCallback = null;
    }

    /**
     * Override to define the state transition.
     * @param target the IState which to transition to.
     * @param payload the data payload from the action notification.
     */
    protected function onTransition(target:IState, payload:Object):void{}

	protected function dispatchGeneralStateChanged():void{}

    /**
     * Sets the current state of the FSM.
     * @param state
     */
    protected function setCurrentState( state:IState):void{ _currentState = state; }

    /**
     * Starts a new transition
     * @param action the name of the action
     * @param payload the data payload from the action notification.
     * @return whether the action has been called successfully
     */
    protected function handleAction( action:String, payload:Object ):Boolean{
        if( _actionCallback == null ) return false;
        _actionCallback( action, payload );
        return true;
    }

    /**
     * Marks the transition to be cancelled.
     * @param reason the reason for cancellation.
     * @param payload the data payload from the cancel notification.
     */
    protected function handleCancel( reason:String = null, payload:Object = null ):void{
        _canceled = true;
        _cancellationReason = reason;
        _cachedPayload = payload;
    }

    /**
     * Resets any properties needed after each transition.
     * This can be extended, but does not need to be called from a sub-class.
     */
    protected function reset():void {
        _canceled = false;
        _cancellationReason = null;
        _cachedPayload = null;
    }

}
}