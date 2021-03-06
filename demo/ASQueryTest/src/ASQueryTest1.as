package
{
	import cx.asQuery.*;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ASQuery测试类 1
	 * Demo说明：构建两个显示对象，设定基本属性，并让他们可以拖动。
	 * @author 翼翔天外
	 * @E-mail onechenxing@163.com
	 */
	public class ASQueryTest1 extends Sprite
	{
		public function ASQueryTest1()
		{
			//初始化
			$(this).ready(init);
		}
		
		private function init():void
		{			
			//设置舞台
			ASQueryConfig.stage = stage;
			
			//显示上方文本
			var tf:TextField = new TextField();
			tf.text = "ASQuery Test";
			tf.width = 200;
			tf.mouseEnabled = false;
			addChild(tf);
			
			//构建显示对象
			initDisplay();
			//测试ASQuery
			testQuery();
		}
		
		/**
		 * 构建测试显示对象
		 * 
		 */
		private function initDisplay():void
		{
			var a:Sprite = new MySprite("a",0x0000FF);
			addChild(a);
			var b:Sprite = new Sprite();
			b.name = "b";
			b.graphics.beginFill(0xFF8888);
			b.graphics.drawRect(0,0,25,25);
			addChild(b);
		}
		
		/**
		 * 测试ASQuery 
		 * 
		 */
		private function testQuery():void
		{
			//通过名字设置多个属性
			$("a").attr({"x":100,"y":200}).attr("alpha",.5);
			$("b").attr("y",50);
			
			//绑定this下面所有Sprite的事件，实现拖动处理
			$(this).find(Sprite).bind(MouseEvent.MOUSE_DOWN,
				function(event:MouseEvent):void
				{
					//移动到顶部，并开始拖动
					$(event.currentTarget).setIndexTop().fun("startDrag");
				})
				.bind(MouseEvent.MOUSE_UP,
				function(event:MouseEvent):void
				{
					//结束拖动
					$(event.currentTarget).fun("stopDrag");
				});
			//输出程序中的所有Sprite看看
			trace($(Sprite));
		}
	}
}