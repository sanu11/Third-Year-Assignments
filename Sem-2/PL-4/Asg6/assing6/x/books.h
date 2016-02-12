#ifndef BOOKS_H
#define BOOKS_H
#include "node.h"
#include <QMainWindow>

namespace Ui {
class Books;
}

class Books : public QMainWindow
{
    Q_OBJECT

public:
    explicit Books(QWidget *parent = 0);
    ~Books();
    void validate();
private:
    Ui::Books *ui;
    node n;
    float bill;
private slots:
    void getdata();
    void display();
    void purchase();
};

#endif // BOOKS_H
