%{
    #include<stdio.h>

    extern FILE *yyin;
    int flag=0;
   
%}
/*%pure-parser
%lex-param {void * scanner}
%parse-param {void * scanner}*/
%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E{
         printf("\nResult=%d\n",$$);
         return 0;
        }
E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |'('E')' {$$=$2;}
 | NUMBER {$$=$1;}
;
%%

int count(FILE *fp)
{
char ch;
int lines=0;
while(!feof(fp))
	{
	  ch = fgetc(fp);
	  if(ch == '\n')
	  {
	    lines++;
	  }
	}
return lines;
}

void main()
{
   FILE *fp=fopen("sample.txt", "r");
   yyin=fp;
   int i, countlines;
   //countlines=count(fp);
   printf("\nEnter Any Arithmetic Expression which can have operations Addition, Subtraction, Multiplication, Divison, Modulus and Round brackets:\n");

for(i=0;i<2;i++)
{
   yyparse();
} 

 if(flag==0)
   printf("\nEntered arithmetic expression is Valid\n\n");

	

}
void yyerror()
{
   printf("\nEntered arithmetic expression is Invalid\n\n");
   flag=1;
}
