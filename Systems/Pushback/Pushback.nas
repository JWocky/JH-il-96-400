var PushbackDialog = {

	new: func(width=440,height=160) {
		var m = {
			parents: [SettingsDialog],
			_dlg: canvas2.Window.new([width, height], "Pushback")
		};

		m._dlg.setTitle("Pushback");
		m._dlg.getCanvas(1).set("background", canvas2.style.getColor("bg_color"));
		m._root = m._dlg.getCanvas().createGroup();
 
		var vbox = canvas.VBoxLayout.new();
		m._dlg.setLayout(vbox);


		var hbox=canvas.HBoxLayout.new();
		vbox.addItem(hbox);
       			props.globals.getNode("/sim/model/pushback/enabled", 1 ).setBoolValue(1);
			var buttonMinus=canvas.gui.widgets.Button.new(m._root, canvas2.style, {}).setText("Reverse");
			buttonMinus.setCheckable(1);
			buttonMinus.listen("clicked", func{
							var fps=getprop("/sim/model/pushback/target-speed-fps");
							fps=fps-1;
							setprop("/sim/model/pushback/target-speed-fps", fps);
							speed.setText(fps~" fps");
						});
			hbox.addItem(buttonMinus);

			buttonPlus=canvas.gui.widgets.Button.new(m._root, canvas2.style, {}).setText("Forward");
			buttonPlus.setCheckable(1);
			buttonPlus.listen("clicked", func{
								var fps=getprop("/sim/model/pushback/target-speed-fps");
								fps=fps+1;
								setprop("/sim/model/pushback/target-speed-fps", fps);
								speed.setText(fps~" fps");					
							});
			hbox.addItem(buttonPlus);

			buttonStop=canvas.gui.widgets.Button.new(m._root, canvas2.style, {}).setText("Stop");
			buttonStop.setCheckable(1);
			buttonStop.listen("clicked", func{
								var fps=getprop("/sim/model/pushback/target-speed-fps");
								fps=0;
								setprop("/sim/model/pushback/target-speed-fps", fps);
								speed.setText(fps~" fps");
							});
			hbox.addItem(buttonStop);

			var hbox3=canvas.HBoxLayout.new();
			vbox.addItem(hbox3);
			var fps=getprop("/sim/model/pushback/target-speed-fps");
			var txt=fps~" fps";
			var speed=gui2.Label.new(m._root, canvas2.style, {});
			chkTest=canvas.gui.widgets.CheckBox.new( m._root, canvas2.style, {}).setText("(Dis)connect");
			chkTest.setCheckable(1);
			chkTest.listen("toggled", func(e){
								setprop("/sim/model/pushback/position-norm",e.detail.checked); 
							});
#			btnTest2=canvas.gui2.Label( m._root, canvas2.style, {}).setText("   ");
				
			speed.setText(txt);
			hbox3.addItem(chkTest);
#			hbox3.addItem(btnTest2);
			hbox3.addItem(speed);


		var hbox2=canvas.HBoxLayout.new();
		vbox.addItem(hbox2);
		btnClose=canvas.gui.widgets.Button.new( m._root, canvas2.style, {}).setText("Close Window");
		btnClose.listen("clicked", func{
			setprop("/sim/model/pushback/target-speed-fps", 0);
			setprop("/sim/model/pushback/position-norm",0); 
       			setprop("/sim/model/pushback/enabled", 0 );
			m._dlg.del();
		});

		hbox2.addItem(btnClose);
		var hint = vbox.sizeHint();
		hint[0] = math.max(width, hint[0]);
		m._dlg.setSize(hint);

		return m;
	}


};


