// Copyright (c) 2012 dozeo GmbH
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

package com.dozeo.pusheras.channel
{
	import com.dozeo.pusheras.Pusher;
	import com.dozeo.pusheras.events.PusherEvent;
	
	import flash.events.EventDispatcher;

	/**
	 * Pusher <http://pusher.com> Channel
	 * @author Tilman Griesel <https://github.com/TilmanGriesel> - dozeo GmbH <http://dozeo.com>
	 */
	public class PusherChannel extends EventDispatcher
	{
		// constants
		static public const CLIENT_EVENT_NAME_PREFIX:String = "client-";
		
		private var _name:String;
		private var _pusherEventDispatcherCallback:Function;
		
		public function PusherChannel(name:String, pusherEventDispatcherCallback:Function)
		{
			// copy vars
			this._name = name;
			this._pusherEventDispatcherCallback = pusherEventDispatcherCallback;
		}
		
		/**
		 * Dispatch pusher event on the channel
		 * notice: the channel name and the "cleint" prefix will be set
		 * automatically 
		 * @param Pusher event
		 * */
		public function dispatchPusherEvent(event:PusherEvent):void
		{
			if(_pusherEventDispatcherCallback == null)
				return;
			
			event.channel = _name;
			event.event = CLIENT_EVENT_NAME_PREFIX + event.event;
			
			_pusherEventDispatcherCallback(event);
		}
		
		/**
		 * Returns the channel name
		 * @return channel name
		 * */
		public function get name():String
		{
			return _name;
		}
		
		/**
		 * Sets the channel name
		 * @param channel name
		 * */
		public function set name(value:String):void
		{
			_name = value;
		}

		public function get pusherEventDispatcherCallback():Function
		{
			return _pusherEventDispatcherCallback;
		}

		public function set pusherEventDispatcherCallback(value:Function):void
		{
			_pusherEventDispatcherCallback = value;
		}


	}
}