extends ItemList
var wcisniento="nic"
func _on_item_activated(index):
	wcisniento=get_item_text(index)
	match wcisniento:
		"Chandlaż":
			clear()
			add_item("czabka (15)")
		"czabka (15)":
			Eq.Money-=15
			Eq.Kieszenie.append("Czabka")
		"zamów coś":
			clear()
			add_item("Piwo (1)")#bonus dmg
			add_item("Kurczak z Rożna (2)")
			add_item("Pieczona Wiepszowina (3)")#bonus hp
		"Piwo (1)":
			Eq.Money-=1
			
		"Kurczak z Rożna (2)":
			Eq.Money-=2
			
		"Pieczona Wiepszowina (3)":
			Eq.Money-=3
			
