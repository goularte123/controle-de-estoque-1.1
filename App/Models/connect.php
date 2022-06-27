<?php

/**
 * Conexão com o banco de dados
 */
class Connect
{

	var $localhost = "127.0.0.1";
	var $user = "root";
	var $passwd = "";
	var $database = "controlestoque";
	var $SQL;

	public function __construct()
	{
		$this->SQL = mysqli_connect($this->localhost, $this->user, $this->passwd, $this->database);
		if (!$this->SQL) {
			die("Conexão com o banco de dados falhou!:" . mysqli_connect_error($this->SQL));
		}
	}


	function login($username, $password)
	{
		$query  = "SELECT * FROM `usuario` WHERE `Username` = '$username' LIMIT 1";
		$result = mysqli_query($this->SQL, $query) or die(mysqli_error($this->SQL));
		$total = mysqli_num_rows($result);

		if ($total > 0) {
			$user = mysqli_fetch_array($result);
			print_r($user);

			if (password_verify($password, $user['Password'])) {
				$_SESSION['idUsuario'] = $user['idUser'];
				$_SESSION['usuario']   = $user['Username'];
				$_SESSION['perm']      = $user['Permissao'];
				$_SESSION['foto']      = $user['imagem'];

				header("Location: ../views/");
			} else {
				header("Location: ../login.php?alert=2");
			}
		} else {
			header("Location: ../login.php?alert=1");
		}
	}

	function limpaCPF_CNPJ($valor)
	{

		$valor = trim($valor);
		$valor = str_replace(".", "", $valor);
		$valor = str_replace(",", "", $valor);
		$valor = str_replace("-", "", $valor);
		$valor = str_replace("/", "", $valor);
		return $valor;
	}
	function format_CPF($nbr_cpf)
	{

		$parte_um     = substr($nbr_cpf, 0, 3);
		$parte_dois   = substr($nbr_cpf, 3, 3);
		$parte_tres   = substr($nbr_cpf, 6, 3);
		$parte_quatro = substr($nbr_cpf, 9, 2);

		$monta_cpf = "$parte_um.$parte_dois.$parte_tres-$parte_quatro";

		return $monta_cpf;
	}

	function format_moeda($valor)
	{
		return 'R$' . number_format($valor, 2, ',', '.');
	}

	function mask($val, $mask)
	{
		$maskared = '';
		$k = 0;
		for ($i = 0; $i <= strlen($mask) - 1; $i++) {
			if ($mask[$i] == '0') {
				if (isset($val[$k]))
					$maskared .= $val[$k++];
			} else {
				if (isset($mask[$i]))
					$maskared .= $mask[$i];
			}
		}
		return $maskared;
	}
}
$connect = new Connect;
