<?php
require_once '../auth.php';
require_once '../../App/Models/vendas.class.php';
require_once '../../App/Models/produtos.class.php';

if(!isset($_SESSION['itens']))
{
	$_SESSION['itens'] = array();
}


if(isset($_POST['prodSubmit']) && $_POST['prodSubmit'] == "carrinho"){

	$qtd    = $_POST['qtd'];
	$NomeProduto =$_POST['qtd'];
	$idProduto = $_POST['idItem'];

	if(!isset($_SESSION['itens'][$idProduto])){
		$_SESSION['itens'][$idProduto] = $qtd;
	}else{
		$_SESSION['itens'][$idProduto] = $qtd;
	}
}	

$pkCount = (is_array($_SESSION['itens']) ? count($_SESSION['itens']) : 0);
  if ($pkCount == 0) {
	echo ' Carrinho Vazios</br> ';

}else{

	$vendas = new Vendas;
	$cont = 1;
	foreach ($_SESSION['itens'] as $produto => $quantidade) {

		$prod = $produtos->getProdutoByIdItem($produto);
		
			echo '<tr>
			<td>'.$cont.'</td>
			<td>'.$prod["NomeProduto"].'</td>
			<td>'.$quantidade.'</td>
			<td><input type="hidden" id="idItem" name="idItem['.$produto.']" value="'.$produto.'" />
			<input type="hidden" id="qtd" name="qtd['.$produto.']" value="'.$quantidade.'" />
			<a href="../../App/Database/remover.php?remover=carrinho&id='.$produto.'"><i class="fa fa-trash text-danger"></i></a></td>
			</tr>';	
			$cont = $cont + 1;
		
	}
}
?>
