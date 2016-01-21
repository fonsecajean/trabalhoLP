use warnings;
use strict; #implementar módulos próprios depois caso dê tempo, trabalho ficar mais bonito!! =)

#SUBROTINAS
sub contarCaracteres {
   my ($texto, $limite) = @_;
   my $saida = 0; # saida recebe 0 se estiver ok, 1 se for muito grande
   my $total = 0;

   while (<$texto>)
       {
       $total = ($total + length $_) -1; # -1 desconsidero o \n
       } #obter o total de caracteres
   print "tamanho >>", $total, "\n";
   if ($total > $limite)
       {
       $saida = 1;
       }

   return ($saida);
}

#PROGRAMA PRINCIPAL----------------------------------------------------

open (my $arquivo, "<", "arquivo.txt") or die "Impossível abrir arquivo.txt"; 

print "Digite o tamanho do arquivo >> ";
my $lim = <STDIN>;

if (contarCaracteres($arquivo, $lim) == 0)
      {
      print "tamanho adequado!! \n";
      }

else  #nesse caso, o arquivo será vetado ou a gente corta o que for muito grande?? 
      {
      print "arquivo muito grande!\n"
      }

close $arquivo or die "Impossível fechar arquivo.txt"
		
