%{
#include<stdio.h>
int com=0;
%}
%%
"/*"[^\n]+"*/" {com++;fprintf(yyout, " ");}
%%
int main()
{
printf("Write a C program\n");
yyout=fopen("output", "w");
yylex();
printf("Comment=%d\n",com);
return 0;
}
Ouput:->
shravan@ubuntu:~/ss_final/lex$ gedit lexp2.l
shravan@ubuntu:~/ss_final/lex$ cc lex.yy.c -ll
shravan@ubuntu:~/ss_final/lex$ ./a.out
Write a C program
#include<stdio.h>int main()
{
int a,b;
/*float c;*/
printf("haaiiiii");
/*hjdhs*/
}
------------[press ctrl+d]-----------------------
Comment=2
shravan@ubuntu:~/ss_final/lex$ cat output
#include<stdio.h>
int main()
{
int a,b;
printf("haaiiiii");
}
