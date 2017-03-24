#!/usr/bin/perl
#system('./sim-cache ./benchmarks/anagram.alpha ./benchmarks/words <./benchmarks/anagram.in ');
@b = ("32","64");
@a = ("1","2","4","8");
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
      $nl1 = $sl1s/($blk1*$asso1);
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
		   system('echo "*'.$count.'*l1:'.$nl1.':'.$blk1.':'.$asso1.':'.$rep1.'   l2:'.$nl2.':'.$blk2.':'.$asso2.':'.$rep2.'" >> ./outputs/gcc_sepl1.txt');
		   system('touch output.txt');
		   system('chmod 777 output.txt');
		   system("./sim-cache -redir:sim ./output.txt -cache:il1 il1:$nl1:$blk1:$asso1:$rep1 -cache:dl1 dl1:$nl1:$blk1:$asso1:$rep1 -cache:il2 none -cache:dl2 ul2:$nl2:$blk2:$asso2:$rep2 -tlb:itlb none -tlb:dtlb none ./benchmarks/cc1.alpha -O ./benchmarks/1stmt.i");
		   system('cat output.txt | grep "sim_num_insn" >> ./outputs/gcc_sepl1.txt');
		   system('cat output.txt | grep "il1.accesses" >> ./outputs/gcc_sepl1.txt');
		   system('cat output.txt | grep "il1.miss_rate" >> ./outputs/gcc_sepl1.txt');
		   system('cat output.txt | grep "dl1.accesses" >> ./outputs/gcc_sepl1.txt');
		   system('cat output.txt | grep "dl1.miss_rate" >> ./outputs/gcc_sepl1.txt');
		   system('cat output.txt | grep "ul2.accesses" >> ./outputs/gcc_sepl1.txt');
		   system('cat output.txt | grep "ul2.miss_rate" >> ./outputs/gcc_sepl1.txt');
		   #system('rm output.txt');
		   
		   system('echo "*'.$count.'*l1:'.$nl1.':'.$blk1.':'.$asso1.':'.$rep1.'   l2:'.$nl2.':'.$blk2.':'.$asso2.':'.$rep2.'" >> ./outputs/ana_sepl1.txt');
		   system('touch output.txt');
		   system('chmod 777 output.txt');
		   system("./sim-cache -redir:sim ./output.txt -cache:il1 il1:$nl1:$blk1:$asso1:$rep1 -cache:dl1 dl1:$nl1:$blk1:$asso1:$rep1 -cache:il2 none -cache:dl2 ul2:$nl2:$blk2:$asso2:$rep2 -tlb:itlb none -tlb:dtlb none ./benchmarks/anagram.alpha ./benchmarks/words \<./benchmarks/anagram.in\> OUT");
		   system('cat output.txt | grep "sim_num_insn" >> ./outputs/ana_sepl1.txt');
		   system('cat output.txt | grep "il1.accesses" >> ./outputs/ana_sepl1.txt');
		   system('cat output.txt | grep "il1.miss_rate" >> ./outputs/ana_sepl1.txt');
		   system('cat output.txt | grep "dl1.accesses" >> ./outputs/ana_sepl1.txt');
		   system('cat output.txt | grep "dl1.miss_rate" >> ./outputs/ana_sepl1.txt');
		   system('cat output.txt | grep "ul2.accesses" >> ./outputs/ana_sepl1.txt');
		   system('cat output.txt | grep "ul2.miss_rate" >> ./outputs/ana_sepl1.txt');
		   #system('rm output.txt');
		   
		   system('echo "*'.$count.'*l1:'.$nl1.':'.$blk1.':'.$asso1.':'.$rep1.'   l2:'.$nl2.':'.$blk2.':'.$asso2.':'.$rep2.'" >> ./outputs/go_sepl1.txt');
		   system('touch output.txt');
		   system('chmod 777 output.txt');
		   system("./sim-cache -redir:sim ./output.txt -cache:il1 il1:$nl1:$blk1:$asso1:$rep1 -cache:dl1 dl1:$nl1:$blk1:$asso1:$rep1 -cache:il2 none -cache:dl2 ul2:$nl2:$blk2:$asso2:$rep2 -tlb:itlb none -tlb:dtlb none ./benchmarks/go.alpha 50 9 ./benchmarks/2stone9.in");
		   system('cat output.txt | grep "sim_num_insn" >> ./outputs/go_sepl1.txt');
		   system('cat output.txt | grep "il1.accesses" >> ./outputs/go_sepl1.txt');
		   system('cat output.txt | grep "il1.miss_rate" >> ./outputs/go_sepl1.txt');
		   system('cat output.txt | grep "dl1.accesses" >> ./outputs/go_sepl1.txt');
		   system('cat output.txt | grep "dl1.miss_rate" >> ./outputs/go_sepl1.txt');
		   system('cat output.txt | grep "ul2.accesses" >> ./outputs/go_sepl1.txt');
		   system('cat output.txt | grep "ul2.miss_rate" >> ./outputs/go_sepl1.txt');
		   }
		   #system('rm output.txt');
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
		 			 
