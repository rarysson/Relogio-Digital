# Relógio digital

O projeto teve como propósito de desenvolver um relógio digital em Verilog.

O sistema consiste em um módulo principal e vários submódulos. Essa estrutura pode ser visualizado abaixo:
* sistema
  * enable_1hz
    * módulo para ajustar a ativação do clock em determinado tempo.
  * maq_s
    * módulo para contar os segundos.
  * maq_m
    * módulo para contar os minutos.
  * maq_h
    * módulo para contar as horas.
  * bcd_7seg
    * módulo para converter os números do relógio para o código da peça de visualização do FPGA.

> Obs.: Alguns valores nos módulos estão só para permitir a visualização no Quartus, sendo necessário realizar a troca de valores caso queira implementar o código na placa FPGA. Os valores verdadeiros estão comentados ao lado dos lugares que é necessário realizar a troca. 