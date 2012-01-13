// Copyright (c) 2012 dozeo GmbH
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

package
{
	import com.dozeo.pusheras.Pusher;
	import com.dozeo.pusheras.vo.PusherOptionsVO;
	
	import flash.display.Sprite;
	
	/**
	 * Pusher <http://pusher.com> Example Application
	 * @author Tilman Griesel <https://github.com/TilmanGriesel> - dozeo GmbH <http://dozeo.com>
	 */
	public class PusherASExample extends Sprite
	{
		public function PusherASExample()
		{
			// create pusher options
			var pusherOptions:PusherOptionsVO = new PusherOptionsVO();
			pusherOptions.applicationKey = '7eb5f1182dcd61a4ac58';
			pusherOptions.origin = 'http://localhost/';
			
			// create pusher client and connect to server
			var pusher:Pusher = new Pusher(pusherOptions);
			pusher.connect();
		}
	}
}