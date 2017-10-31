#include "fastslider.h"
#include <QDebug>
FastSlider::FastSlider(QObject *parent) : QObject(parent)
{
    width=0;
    x=0;
}

int FastSlider::xPos()
{
    return x;
}

void FastSlider::setXPos(int x)
{
   // qDebug() <<"set x: "<<x;

    if(x<0)
    {
        x=0;
    }
    else if(x>width-30)
    {
        x=width-30;
    }
     this->x=x;
    emit xPosChanged();
    emit valueChanged();
}

int FastSlider::getWidth()
{
    return width;
}

void FastSlider::setWidth(int width)
{
    this->width=width;
}

void FastSlider::setValue(int value)
{
    qDebug() << "Setting value" << value;
    x=value*(width-30)/100;
    qDebug() << "Calculated x: " << x;
    emit xPosChanged();
}

int FastSlider::getValue()
{
    return (float)x/(width-30)*100;
}
