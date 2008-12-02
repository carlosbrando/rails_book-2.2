## Nuovo test helper (assert\_sql)

Probabilmente avrete già sentito parlare del metodo `assert_queries`, utilizzato per validare test e il numero di query eseguite su un database. Per esempio:

Nel test seguente specifichiamo che, se ci sono `partial_updates`, una query deve essere eseguita sul database; altrimenti nessuna query deve essere eseguita.

Adesso abbiamo un ulteriore helper che facilita il test delle query generate dalle astrazioni di `ActiveRecord`. Vediamo un esempio:

	def test_empty_with_counter_sql
	  company = Firm.find(:first)
	  assert_sql /COUNT/i do
	    assert_equal false, company.clients.empty?
	  end
	end

Nell'esempio precedente stiamo asserendo che, nel blocco specificato, almeno una query dovrebbe contenere la parola **COUNT**. Ovviamente potete essere più specifici nell'espressione regolare utilizzata. Vediamo un altro esempio:

	assert_sql(/\(\"companies\".\"id\" IN \(1\)\)/) do
	  Account.find(1, :include => :firm)
	end
