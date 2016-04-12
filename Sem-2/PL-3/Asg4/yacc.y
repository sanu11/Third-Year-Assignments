%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<omp.h>
     
    #define YYSTYPE int

    int numofthreads,expsperthread;
    char inputfilename[30];
%}
%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%pure-parser
%lex-param {void * scanner}
%parse-param {void * scanner}

%%

ArithmeticExpression: E{
           
         //printf("\nResult=%d\n",$$);
       
         return $$;
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

void func()
{
void * scanner;
    yylex_init(&scanner);

FILE *fp;
fp=fopen(inputfilename,"r");

int i,j;

int tid;
int res;
  
tid=omp_get_thread_num();  

char *s=malloc(100);
size_t n=100;

for(i=0;i<(expsperthread*tid);i++)
  {
    getline(&s,&n,fp);
  }

yyset_in(fp,scanner);

for(j=0;j<expsperthread;j++)
  { 
    res=yyparse(scanner);
 
    printf("%dth Expression=%d is given by Thread %d\n",(expsperthread*tid+j+1),res,tid);
  }

    yylex_destroy(scanner);
 
fclose(fp);
}

void main()
{
printf("Enter Input Text File Name\n");
scanf("%s",inputfilename);
printf("Enter Number of threads to be created\n");
scanf("%d",&numofthreads);
printf("Enter Number of Arithmetic Expressions to be evaluated by each thread\n");
scanf("%d",&expsperthread);

#pragma omp parallel num_threads(numofthreads)
  {
    func();
  }
}

int yyerror()
{
   printf("\nArithmetic expression is Invalid\n\n");
}    
