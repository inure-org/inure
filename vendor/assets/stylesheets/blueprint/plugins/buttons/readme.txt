botões

* fornece alguns botões css, tanto para <a> quanto para <button>.
* demo: particletree.com/features/rediscovering-the-button-element


créditos
-----------------------------------------------------------------

* criado por grivo [grvo.github.io/me]
* adaptado para o blueprint por grivo [grvo.github.io/me]


uso
-----------------------------------------------------------------

1) adicionar esse plugin para lib/settings.yml.
	veja compress.rb para instruções.

2) use o seguinte código html para posicionar os botões do seu site:

	<button type="submit" class="button positive">
		<img src="css/blueprint/plugins/buttons/icons/tick.png" alt=""/> salvar
	</button>

	<a class="button" href="/password/reset/">
		<img src="css/blueprint/plugins/buttons/icons/key.png" alt=""/> mudar senha
	</a>

	<a href="#" class="button negative">
		<img src="css/blueprint/plugins/buttons/icons/cross.png" alt=""/> cancelar
	</a>
