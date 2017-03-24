#!/usr/bin/perl 


@b = ("32","64"); 

@a = ("1","2,","4","8"); 

@f = ("f","l","r"); 

$sl1u=128*1024; 

$sl2u=1024*1024; 

$sl1s=64*1024; 

$sl2s=512*1024; 

$count = 0;  

 

foreach my $blk1 (@b) 

 { 

   foreach my $asso1 (@a) 

    { 

   foreach my $rep1 (@f) 

    { 

      $nl1 = $sl1u/($blk1*$asso1); 

    foreach my $blk2 (@b) 

     { 

    foreach my $asso2 (@a) 

     { 

      foreach my $rep2 (@f) 

       { 

       $nl2 = $sl2u/($blk2*$asso2); 

       if($blk2<=$blk1) 

       { 

       $count = $count + 1;  

       system('cat /dev/null > ./outputs/temp.txt');       
       system('echo "*'.$count.'*l1:'.$nl1.':'.$blk1.':'.$asso1.':'.$rep1.'l2:'.$nl2.':'.$blk2.':'.$asso2.':'.$rep2.'" >> ./outputs/temp.txt'); 
       
       
       system('touch output.txt'); 

       system('chmod 777 output.txt'); 

       system("./sim-cache -redir:sim ./output.txt -cache:il1 dl1 -cache:dl1 ul1:$nl1:$blk1:$asso1:$rep1 -cache:il2 none -cache:dl2 ul2:$nl2:$blk2:$asso2:$rep2 -tlb:itlb none -tlb:dtlb none ./benchmarks/cc1.alpha -O ./benchmarks/1stmt.i"); 

       system('cat output.txt | grep "sim_num_insn" >> ./outputs/gcc_def.txt '); 

       system('cat output.txt | grep "ul1.accesses" >> ./outputs/gcc_def.txt '); 

       system('cat output.txt | grep "ul1.miss_rate" >> ./outputs/gcc_def.txt '); 

       system('cat output.txt | grep "ul2.accesses"  >> ./outputs/gcc_def.txt '); 

       system('cat output.txt | grep "ul2.miss_rate" >> ./outputs/gcc_def.txt ');
       
       system('cat output.txt | grep "sim_num_insn" >> ./outputs/temp.txt'); 

       system('cat output.txt | grep "ul1.accesses" >> ./outputs/temp.txt'); 

       system('cat output.txt | grep "ul1.miss_rate" >> ./outputs/temp.txt'); 

       system('cat output.txt | grep "ul2.accesses"  >> ./outputs/temp.txt'); 

       system('cat output.txt | grep "ul2.miss_rate" >> ./outputs/temp.txt');
       
        

       #system('rm output.txt');
       

my @lines; # Hold the lines you want

open (my $file, '<', './outputs/temp.txt') or die $!; # Open the file for reading
while (my $line = <$file>)
{
  next if $line =~ m/^#/; # Look at each line and if if isn't a comment
  push (@lines, $line);   # we will add it to the array.
}
close $file;
  my $sw = $lines[1];
  my $sim_ins=@{[$sw =~ m/\d+/g]}[0];
  print "$sim_ins \n"; 
   
  my $qw = $lines[2];
  my $ul1access=@{[$qw =~ m/\s+\d+/g]}[0];
  print "$ul1access \n";
  
  
  my $pp = $lines[3];
  my $l1miss=@{[$pp =~ m/([0-9]+\.+[0-9]+[0-9]+[0-9])+/g]}[0];
  print "$l1miss \n";
  
  my $er = $lines[4];
  my $l2access=@{[$er =~ m/\s+\d+/g]}[0];
  print "$l2access \n";
  
  my $gh = $lines[5];
  my $l2miss=@{[$gh =~ m/([0-9]+\.+[0-9]+[0-9]+[0-9])+/g]}[0];
  print "$l2miss \n";
  
  if( $sim_ins > 0)
  {my $cpi = 1 + ( 5* $l1miss + 40* $l2miss * ($l2access/$sim_ins));}
  else
  {my $cpi = 0;}
  
  system('echo "*'.$count.'*l1:'.$nl1.':'.$blk1.':'.$asso1.':'.$rep1.'l2:'.$nl2.':'.$blk2.':'.$asso2.':'.$rep2.'" >> ./outputs/gcc_def_cpi.txt'); 
  system('echo "'.$cpi.'" >> ./outputs/gcc_def_cpi.txt');
   

       system('echo "*'.$count.'*l1:'.$nl1.':'.$blk1.':'.$asso1.':'.$rep1.'l2:'.$nl2.':'.$blk2.':'.$asso2.':'.$rep2.'" >> ./outputs/ana_uni.txt'); 

       system('touch output.txt'); 

       system('chmod 777 output.txt'); 

       system("./sim-cache -redir:sim ./output.txt -cache:il1 dl1 -cache:dl1 ul1:$nl1:$blk1:$asso1:$rep1 -cache:il2 none -cache:dl2 ul2:$nl2:$blk2:$asso2:$rep2 -tlb:itlb none -tlb:dtlb none ./benchmarks/anagram.alpha ./benchmarks/words\<./benchmarks/anagram.in\> OUT"); 

       system('cat output.txt | grep "sim_num_insn" >> ./outputs/ana_uni.txt'); 

       system('cat output.txt | grep "ul1.accesses" >> ./outputs/ana_uni.txt'); 

       system('cat output.txt | grep "ul1.miss_rate" >> ./outputs/ana_uni.txt'); 

       system('cat output.txt | grep "ul2.accesses" >> ./outputs/ana_uni.txt'); 

       system('cat output.txt | grep "ul2.miss_rate" >> ./outputs/ana_uni.txt'); 
       
       
       

       #system('rm output.txt'); 

        

       system('echo "*'.$count.'*l1:'.$nl1.':'.$blk1.':'.$asso1.':'.$rep1.'l2:'.$nl2.':'.$blk2.':'.$asso2.':'.$rep2.'" >> ./outputs/go_uni.txt'); 

       system('touch output.txt'); 

       system('chmod 777 output.txt'); 

       system("./sim-cache -redir:sim ./output.txt -cache:il1 dl1 -cache:dl1 ul1:$nl1:$blk1:$asso1:$rep1 -cache:il2 none -cache:dl2 ul2:$nl2:$blk2:$asso2:$rep2 -tlb:itlb none -tlb:dtlb none ./benchmarks/go.alpha 50 9 ./benchmarks/2stone9.in"); 

       system('cat output.txt | grep "sim_num_insn" >> ./outputs/go_uni.txt'); 

       system('cat output.txt | grep "ul1.accesses" >> ./outputs/go_uni.txt'); 

       system('cat output.txt | grep "ul1.miss_rate" >> ./outputs/go_uni.txt'); 

       system('cat output.txt | grep "ul2.accesses" >> ./outputs/go_uni.txt'); 

       system('cat output.txt | grep "ul2.miss_rate" >> ./outputs/go_uni.txt'); 

       #system('rm output.txt'); 

       } 

    $count = $count + 1; 

    print "$nl1 \n";          

    print "$nl2 \n"; 

    print "$count \n\n"; 

      } 

     } 

      } 

    } 

  } 

 }
