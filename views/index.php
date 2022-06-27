<?php
require_once '../App/auth.php';
require_once '../layout/script.php';
require_once '../App/Models/relatorios.class.php';

echo $head;
echo $header;
echo $aside;
echo '<div class="content-wrapper">';

echo '<section class="content" style="height: auto !important; min-height: 0px !important;">
';

if($perm >=1){
  echo '   
  <style>
  Bemvindo,h1{
    color:#265a88;
    font-size: 70px ;
    text-align: center;
  }
  </style>    
  <div class="Bemvindo"> 
  <h1>Bem Vindo!</h1>
  </div>
      <!-- Small boxes (Stat box) --> 

      <div class="row">
      <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6">
      <!-- small box -->
      <div class="small-box bg-green">
      <div class="inner">
              <h3>';   
              $relatorio = new Relatorio();
              $r = $relatorio->qtdeItensEstoqueTotal($perm);
              echo $r;

              echo'</h3>
              <p>Qtde. em Estoque</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">

        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->';


}

echo  $footer;
echo $javascript;
