use warnings;
use strict; #implementar módulos próprios depois caso dê tempo, trabalho ficar mais bonito!! =)
use File::Copy qw(move);

#SUBROTINAS
#Contar Caracteres-----------------------------------------------------------------
sub contarCaracteres {
   my ($nomeArq, $limite) = @_;
   open (my $texto, '<', $nomeArq) or die "impossível abrir arquivo";
   my $total = 0;

   while (<$texto>)
       {
       $total = ($total + length $_) -1; # -1 desconsidero o \n
       } #obter o total de caracteres
   print "tamanho >>", $total, "\n";
   if ($total > $limite)
       {
       print "Arquivo muito Grande!! \n"
       }
   else 
       {
       print "tamanho dentro do limite \n"
       }
  
  close $nomeArq;
}

#Filtro parametros: arquivo, filtro, nome do arquivo ----------------------------------------
sub filtrarTexto {
   my ($nomeFiltro, $nomeArq) = @_;
   
   open (my $filtro, '<', $nomeFiltro) or die "impossivel abrir arquivo";
   open (my $texto, '<', $nomeArq) or die "impossivel abrir arquivo"; 

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
  
  close $filtro;
  close $texto;
}

#PROGRAMA PRINCIPAL----------------------------------------------------
print "Digite nome do arquivo: ";
my $nomeArq = <STDIN>;
chomp $nomeArq; #depois só passar o nome que foi pego com c++ para essa variavel, nao precisa mudar nada no resto do codigo!

print "digite nome do filtro: ";
my $nomeFiltro = <STDIN>;
chomp $nomeFiltro;

filtrarTexto ($nomeFiltro,  $nomeArq);

print "Digite o tamanho do arquivo >> ";
my $lim = <STDIN>;

contarCaracteres ($nomeArq, $lim)

		
