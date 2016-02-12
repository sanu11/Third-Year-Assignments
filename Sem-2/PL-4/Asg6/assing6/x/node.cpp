#include "node.h"
#include "qstring.h"
#include <QMessageBox>
node::node()
{
    title=author=publisher='\0';
    stock=0;
    price=0;
    next=head=trav=last='\0';
}

void node::insert(QString t, QString a, QString p, int s, float c)
{
    node *x=new node();

    x->title=t;
    x->author=a;
    x->publisher=p;
    x->stock=s;
    x->price=c;

     if(head==NULL)
     {
         head=last=trav=x;
     }
     else
     {
         last->next=x;
         last=last->next;
     }
}

void node::pur(node *temp,int cp)
{
    float bill;
      if(cp <= temp->stock)
          {
              bill=temp->price*cp;
              temp->stock=temp->stock-cp;
              QMessageBox q5;
              q5.setText( "Bill="+QString::number(bill) );
              q5.exec();
          }
          else
          {
              QMessageBox q6;
              q6.setText("Required copies are NOT available ");
              q6.exec();
          }
 }

node* node::search(QString s,QString u)
{
    while(trav!=NULL)
    {
       if((trav->title==s)&&(trav->author==u))
       {
           return trav;
           break;
       }
      trav=trav->next;
    }
    return trav;
}
