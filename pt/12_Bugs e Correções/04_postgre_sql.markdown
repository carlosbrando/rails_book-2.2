## PostgreSQL

No PostgreSQL, a sintaxe dele de **typecast** é a seguinte: \<column>::\<type>

O problema é que quando se usava essa sintaxe, o `ActiveRecord` achava que o na verdade era um named bind e reclamava que o valor para ele não estava sendo passado no **hash**. Agora este problema está corrigido, permitindo que façamos algo assim:

	:conditions => [':foo::integer', { :foo => 1 }]
