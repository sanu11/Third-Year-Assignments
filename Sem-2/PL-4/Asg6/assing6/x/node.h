#ifndef NODE_H
#define NODE_H
#include "qstring.h"
class node
{
    QString title,author,publisher;
    int stock;
    float price;
    node *next;
    node *head,*trav,*last;
public:
    node();
     friend class Books;
    node(int,int,int);
    void insert(QString,QString,QString,int,float);
    node* search(QString,QString);
    void pur(node*,int);
};

#endif // NODE_H
