#ifndef FASTSLIDER_H
#define FASTSLIDER_H

#include <QObject>

class FastSlider : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int xPos READ xPos WRITE setXPos NOTIFY xPosChanged)
    Q_PROPERTY(int width READ getWidth WRITE setWidth NOTIFY widthChanged)
    Q_PROPERTY(int value READ getValue WRITE setValue NOTIFY valueChanged)
public:
    explicit FastSlider(QObject *parent = 0);
    int xPos();
    void setXPos(int x);
    int getWidth();
    void setWidth(int width);
    void setValue(int value);
    int getValue();

signals:
    void xPosChanged();
    void widthChanged();
    void valueChanged();

public slots:

private:
    int x;
    int width;
};

#endif // FASTSLIDER_H
