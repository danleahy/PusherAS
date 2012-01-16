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

	/**
	 * Pusher <http://pusher.com> Event Channel Data Storage Object
	 * @author Tilman Griesel <https://github.com/TilmanGriesel> - dozeo GmbH <http://dozeo.com>
	 */
	public final class PusherEventChannelData
	{
		private var _user_id:Number;
		private var _user_info:PusherEventUserInfo;
		
		public function PusherEventChannelData():void 
		{ 
		}
		
		public function get user_id():Number
		{
			return this._user_id;
		}
		
		public function set user_id(value:Number):void
		{
			this._user_id = value;
		}
		
		public function get user_info():PusherEventUserInfo
		{
			return this._user_info;
		}
		
		public function set user_info(value:PusherEventUserInfo):void
		{
			this._user_info = value;
		}
		
		public static function parse(data:String):PusherEventChannelData
		{
			// check if message object is null
			if(data == null)
				throw new Error('data cannot be empty');
			
			// decode data JSON string to an raw object
			var decodedObject:Object = JSON.decode(decodeURIComponent(data));
			
			// create new event data
			var pusherEventChannelData:PusherEventChannelData = new PusherEventChannelData();
			
			// parse "channel" property
			if(decodedObject.hasOwnProperty('user_id'))
			{
				pusherEventChannelData.user_id = Number(decodedObject.user_id);
			}
			
			// parse "user_info" property
			if(decodedObject.hasOwnProperty('user_info'))
			{
				pusherEventChannelData._user_info = PusherEventUserInfo.parse(decodedObject.user_info);
			}
			
			// return event data
			return pusherEventChannelData;
		}
		
	}
}