// isso é um arquivo manifest que será compilado incluindo todos os arquivos listados abaixo.
// adicione novos códigos javascript/coffeescript em arquivos separados nesse diretório e eles
// serão automaticamente incluídos no arquivo compilado acessível em https://example.com/assets/application.js
//
// não é sugerido adicionar código diretamente aqui, mas caso seja o caso, ele irá
// aparecer no bottom do arquivo compilado.
//
//= require jquery
//= require jquery_ujs
//= require tree

$(function () {
    $(".one_click_select").click(function () {
        $(this).select();
    });

    $('select#branch').selectmenu({
        style: 'popup',
        width: 200
    });

    $('select#tag').selectmenu({
        style: 'popup',
        width: 200
    });
});
