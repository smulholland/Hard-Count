package comp
{	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.DataGrid;
	import spark.components.NavigatorContent;
	
	[Event(name="selectEvent", type="flash.events.Event")]	
	[Event(name="removeEvent", type="flash.events.Event")]	
	[Event(name="clearEvent", type="flash.events.Event")]
	
	public class TurboNavigatorContent extends NavigatorContent
	{
		
		// Skin Parts that constitute the necessary parts of the component
		[SkinPart(required="true")]
		public var dgdSelect:DataGrid;  
		[SkinPart(required="true")]
		public var btnAdd:Button = new Button;  
		[SkinPart(required="true")]
		public var btnRemove:Button = new Button;  
		[SkinPart(required="true")]
		public var btnClear:Button = new Button;
		
		// property exposed to the instantiating object
		[Bindable]
		public var firstColumnHeader:String = new String();
		
		public function TurboNavigatorContent()
		{
			//TODO: implement function
			super();
			btnAdd.addEventListener(MouseEvent.CLICK, selectClick);
			btnRemove.addEventListener(MouseEvent.CLICK, removeClick);
			btnClear.addEventListener(MouseEvent.CLICK, clearClick);
			
		}
		
		//Dispatches event when "Add" button is clicked.	
		public function selectClick(event:MouseEvent):void
		{
			event.currentTarget.dispatchEvent(new Event("selectEvent",true));
		}
		
		//Dispatches event when "Remove" button is clicked.
		public function removeClick(event:MouseEvent):void
		{
			event.currentTarget.dispatchEvent(new Event("removeEvent",true));
		}
		
		//Dispatches event when "Clear" button is clicked.
		public function clearClick(event:MouseEvent):void
		{
			event.currentTarget.dispatchEvent(new Event("clearEvent",true));
		}
		
		
	}
}