%{
#include<stdio.h>
int id=0;
%}
%%
[a-zA-Z][a-zA-Z0-9_]* { id++ ; ECHO; printf("\n");}
.+ { ;}
\n { ;}
%%
int yywrap()
{
return 1;
}
main (int argc, char *argv[])
{
if(argc!=2)
{
printf("Usage: <./a.out> <sourcefile>\n");
exit(0);
}
yyin=fopen(argv[1],"r");
printf("Valid identifires are\n");
yylex();
printf("No of identifiers = %d\n",id);
}
INPUT.TXT
int
float
78f
90gh
a
d
are
default
printfoutput:
shravan@ubuntu:~/ss_final/lex$ gedit lexp4.l
shravan@ubuntu:~/ss_final/lex$ gedit input.txt
shravan@ubuntu:~/ss_final/lex$ lex lexp4.l
shravan@ubuntu:~/ss_final/lex$ cc lex.yy.c -ll
shravan@ubuntu:~/ss_final/lex$ ./a.out input.txt
Valid identifires are
int
float
a
d
are
default
printf
No of identifiers = 7
