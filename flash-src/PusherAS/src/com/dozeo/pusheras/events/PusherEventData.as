// Copyright (c) 2012 dozeo GmbH
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

package com.dozeo.pusheras.events
{
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONEncoder;

	/**
	 * Pusher <http://pusher.com> Event Data Object
	 * @author Tilman Griesel <https://github.com/TilmanGriesel> - dozeo GmbH <http://dozeo.com>
	 */
	public final class PusherEventData
	{
		private var _channel:String;
		private var _auth:String;
		private var _channel_data:PusherEventChannelData;
		
		public function PusherEventData():void 
		{ 
		}
		
		public function get channel():String
		{
			return this._channel;
		}
		
		public function set channel(value:String):void
		{
			this._channel = value;
		}
		
		public function get auth():String
		{
			return this._auth;
		}
		
		public function set auth(value:String):void
		{
			this._auth = value;
		}
		
		public function get channel_data():PusherEventChannelData
		{
			return this._channel_data;
		}
		
		public function set channel_data(value:PusherEventChannelData):void
		{
			this._channel_data = value;
		}
		
		public static function parse(data:String):PusherEventData
		{
			// check if message object is null
			if(data == null)
				throw new Error('data cannot be empty');
			
			// decode data JSON string to an raw object
			var decodedObject:Object = JSON.decode(decodeURIComponent(data));
			
			// create new event data
			var pusherEventData:PusherEventData = new PusherEventData();
			
			// parse "channel" property
			if(decodedObject.hasOwnProperty('channel'))
			{
				pusherEventData.channel = decodedObject.channel;
			}

			// parse "auth" property
			if(decodedObject.hasOwnProperty('auth'))
			{
				pusherEventData.auth = decodedObject.auth;
			}

			// parse "channel_data" property
			if(decodedObject.hasOwnProperty('channel_data'))
			{
				pusherEventData.channel_data = PusherEventChannelData.parse(decodedObject.channel_data);
			}
			
			// return event data
			return pusherEventData;
		}
	}
}