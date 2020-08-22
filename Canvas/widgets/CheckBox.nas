gui2.CheckBox = {
  new: func(parent, style, cfg)
  {
    cfg["type"] = "checkbox";
    var m = gui2.widgets.Button.new(parent, style, cfg);
    m._checkable = 1;

    append(m.parents, gui2.widgets.CheckBox);
    return m;
  },
  setCheckable: nil
};
