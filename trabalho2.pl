use warnings;
use strict; #implementar módulos próprios depois caso dê tempo, trabalho ficar mais bonito!! =)
use File::Copy qw(move);

#SUBROTINAS
#Contar Caracteres-----------------------------------------------------------------
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

#Filtro parametros: arquivo, filtro, nome do arquivo ----------------------------------------
sub filtrarTexto {
   my ($texto, $filtro, $nomeArq) = @_;
   my @palavroes = <$filtro>;
   open (my $escrita, '>>', 'arquivo2.txt');
   
     while (<$texto>)
     {
     my $linha = $_;
        foreach my $i (0..($#palavroes-1))
	{
  	chomp ($palavroes[$i]); #tirar o \n do final >> deve ser padrão no arquivo filtro.txt 
 	$linha =~ s/($palavroes[$i])/\*\*\*\*/gi;
	}
     print $escrita $linha;
     print $linha;
     }
 
  move 'arquivo2.txt', $nomeArq; 
}

#PROGRAMA PRINCIPAL----------------------------------------------------
print "Digite nome do arquivo: ";
my $nomeArq = <STDIN>;
chomp $nomeArq; #depois só passar o nome que foi pego com c++ para essa variavel, nao precisa mudar nada no resto do codigo!

open (my $arquivo, "<", $nomeArq) or die "Impossível abrir arquivo.txt"; 
open (my $filtro, "<", "filtro.txt") or die "impossivel abrir o filtro";

filtrarTexto ($arquivo, $filtro, $nomeArq);

print "Digite o tamanho do arquivo >> ";
my $lim = <STDIN>;
seek ($arquivo, 0, 0);
     if (contarCaracteres($arquivo, $lim) == 0)
     {
     print "tamanho adequado!! \n";
     }

     else  #nesse caso, o arquivo será vetado ou a gente corta o que for muito grande?? 
     {
     print "arquivo muito grande!\n"
     }

close $arquivo or die "Impossível fechar arquivo.txt";
close $filtro or die "impossível fechar filtro.txt";
		
