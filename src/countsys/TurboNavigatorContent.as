package countsys
{
	import spark.components.NavigatorContent;
	import mx.collections.ArrayCollection;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class TurboNavigatorContent extends NavigatorContent
	{
		/**
		 * The following variables represent the Turbolist properties based on the associated XML files.
		 **/
		public var field_desc:String;				//Matches Accordion label.
		public var field_id:String;					//ID number used by CAS to identify the select category.
		public var field_val:ArrayCollection;		//Collection of selects. Serves as dataprovider for datagrid.
		//Field value sets.
		public var tvalue_desc:String;				//Text element seen in the datagrid.
		public var tvalue_data:String;				//Character code used by CAS to represent the select.
		
		/**
		 * Other properties
		 **/
		public var isGeo:Boolean;					//Geo or Field select indicator for the current navigator component.
		
		/**
		 * Event variables used to dispatch events to the controller.
		 **/
		public var selectingEvent:Event;
		public var removingEvent:Event;
		public var clearingEvent:Event;
		
		public function TurboNavigatorContent()
		{
			//TODO: implement function
			super();
		}
			
		/**
		 * Event dispatcher functions.
		 **/
		//Dispatches event when "Add" button is clicked.	
		public function selectClick(event:Event):void
		{
			selectingEvent = new Event("selectEvent",true);
			dispatchEvent(selectingEvent);
		}
		
		//Dispatches event when "Remove" button is clicked.
		public function removeClick(event:Event):void
		{
			removingEvent = new Event("removeEvent",true);
			dispatchEvent(removingEvent);
		}
		
		//Dispatches event when "Clear" button is clicked.
		public function clearClick(event:Event):void
		{
			clearingEvent = new Event("clearEvent",true);
			dispatchEvent(clearingEvent);
		}
		
		//Dispatches event when "Enter / Return" key is pressed while inside of text inputs and areas.
		protected function keyListener(event:KeyboardEvent):void
		{
			if (event.keyCode == 13)
			{
				selectingEvent = new Event("selectEvent",true);
				dispatchEvent(selectingEvent);
			}
		}
	}
}