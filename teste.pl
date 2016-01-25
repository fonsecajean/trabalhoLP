my $nb = 0;
open ($ARQ,"<","frutas.txt") ;
while (<$ARQ>)
{
   s/banana/goiaba/g; 
   # if (   /(banana) */  )
   # {  
   #   $nb++
   # }
   $string = $_;
   print $string;

}

print $nb, "\n";
