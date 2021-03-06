gui2.Label = {

	new: func(parent, style, cfg) {
		var m = gui2.Widget.new(gui2.Label);
		m._cfg = Config.new(cfg);
		m._focus_policy = m.NoFocus;
		m._setView( style.createWidget(parent, "label", m._cfg) );

		return m;
	},
	
	setText: func(text) {
		me._view.setText(me, text);
		return me;
	},
	
	setFontSize: func(fsize, aspect) {
		me._view.setFontSize(fsize, aspect);
		return me;
	},
	
	setImage: func(img) {
		me._view.setImage(me, img);
		return me;
	},
	
	setBackground: func(bg) {
		me._view.setBackground(me, bg);
		return me;
	}
	
};
