## Correzioni in Time#end\_of\_quarter e Date#end\_of\_quarter

Non appena fu rilasciato Rails 2.1 venne incontrato un errore serio. Se avete dei progetti creati sotto questa versione, accedete ad una sessione **irb** e provate:

	Date.new(2008, 5, 31).end_of_quarter

**ERROR!**

Come mai? L'implementazione di `end_of_quarter` era bacata. In pratica arrivava al termine dell'ultimo mese del trimestre, e quindi recuperava l'ultimo giorno. Il problema è che avanzava solo sul mese, e poiché nell'esempio si parte dal 31 marzo, il metodo cerca di creare un'istanza di `Date` con il 31 giugno, che non esiste. Nel caso di un oggetto `Time` non viene sollevata alcuna eccezione,  ma viene restituita la data sbagliata: 31 luglio.

Questo errore è stato corretto nell'attuale versione, ma se state ancora utilizzando Rails 2.1 per qualche progetto fate attenzione, dal momento che questo errore si manifesta quando utilizzate il metodo `end_of_quarter` con l'ultimo giorno di maggio, luglio o agosto.
