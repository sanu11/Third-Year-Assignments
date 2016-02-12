#include "books.h"
#include "ui_books.h"
#include "node.h"
#include "qstring.h"
#include <QMessageBox>
#include <QStandardItemModel>
#include <QRegExpValidator>
#include <QStandardItem>

Books::Books(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Books)
{
    ui->setupUi(this);
    validate();
    connect(this->ui->pushButton,SIGNAL(clicked()),this,SLOT(getdata()));
    connect(this->ui->pushButton_2,SIGNAL(clicked()),this,SLOT(display()));
    connect(this->ui->pushButton_3,SIGNAL(clicked()),this,SLOT(purchase()));
}

Books::~Books()
{
    delete ui;
}

void Books::validate()
{
   this->ui->lineEdit->setValidator(new QRegExpValidator(QRegExp("[A-Za-z]{20}")));
   this->ui->lineEdit_2->setValidator(new QRegExpValidator(QRegExp("[A-Za-z]{20}")));
   this->ui->lineEdit_3->setValidator(new QRegExpValidator(QRegExp("[A-Za-z]{20}")));
   this->ui->lineEdit_4->setValidator(new QRegExpValidator(QRegExp("[0-9]{10}")));
   this->ui->lineEdit_5->setValidator(new QRegExpValidator(QRegExp("[0-9]{20}")));
}

void Books::getdata()
{
    QString s1=ui->lineEdit->text();
    QString s2=ui->lineEdit_2->text();
    QString s3=ui->lineEdit_3->text();
    float p=ui->lineEdit_4->text().toFloat();
    int s=ui->lineEdit_5->text().toInt();

    n.insert(s1,s2,s3,s,p);
     QMessageBox q;
     q.setText(" Book is successfully added! ");
     q.exec();
}
void Books::display()
{
    int i=0;
   QStandardItemModel *m=new QStandardItemModel(5,4,this);

   m->setHorizontalHeaderItem(0,new QStandardItem(QString("Title")));
   m->setHorizontalHeaderItem(1,new QStandardItem(QString("Author")));
   m->setHorizontalHeaderItem(2,new QStandardItem(QString("Publisher")));
   m->setHorizontalHeaderItem(3,new QStandardItem(QString("Price")));
   m->setHorizontalHeaderItem(4,new QStandardItem(QString("Stock")));

   node *temp=n.head;
   if(temp!=NULL)
   {
     while(temp!=NULL)
     {
        m->setItem(i,0,new QStandardItem(temp->title));
        m->setItem(i,1,new QStandardItem(temp->author));
        m->setItem(i,2,new QStandardItem(temp->publisher));
        m->setItem(i,3,new QStandardItem(QString::number(temp->price)));
        m->setItem(i,4,new QStandardItem(QString::number(temp->stock)));

        this->ui->tableView->setModel(m);
        i+=1;
        temp=temp->next;
     }
   }
   else
   {
       QMessageBox q1;
       q1.setText("Shop is empty!");
       q1.exec();
   }
}

void Books::purchase()
{
    QMessageBox q2;
    q2.setText("Enter Title And Author Of Book");
    q2.exec();

    QString t1=ui->lineEdit->text();
    QString a1=ui->lineEdit_2->text();

    node* temp=n.search(t1,a1);

    if(temp!=NULL)
    {
        QMessageBox q3;
        q3.setText("Book is available! See details in following table");
        q3.exec();
            QStandardItemModel *m=new QStandardItemModel(0,4,this);

            m->setHorizontalHeaderItem(0,new QStandardItem(QString("Title")));
            m->setHorizontalHeaderItem(1,new QStandardItem(QString("Author")));
            m->setHorizontalHeaderItem(2,new QStandardItem(QString("Publisher")));
            m->setHorizontalHeaderItem(3,new QStandardItem(QString("Price")));
            m->setHorizontalHeaderItem(4,new QStandardItem(QString("Stock")));

            m->setItem(0,0,new QStandardItem(temp->title));
            m->setItem(0,1,new QStandardItem(temp->author));
            m->setItem(0,2,new QStandardItem(temp->publisher));
            m->setItem(0,3,new QStandardItem(QString::number(temp->price)));
            m->setItem(0,4,new QStandardItem(QString::number(temp->stock)));

             this->ui->tableView->setModel(m);

            QMessageBox q4;
            q4.setText("Enter no. of copies you want to purchase (Enter value in stock)");
            q4.exec();

            int cp=ui->lineEdit_5->text().toInt();
            n.pur(temp,cp);
    }
        else
        {
            QMessageBox q7;
            q7.setText(" Book is not available");
            q7.exec();
        }
}
