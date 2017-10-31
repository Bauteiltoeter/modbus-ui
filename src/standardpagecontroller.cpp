#include "standardpagecontroller.h"
#include <stdio.h>
#include <QDebug>

StandardPageController::StandardPageController(QObject *parent) : QObject(parent),
    latestVoltage(5),
    latestCurrent(0.2),
    latestPower(6),
    latestResistance(0.5),
    setCurrent(2.2),
    setPower(5),
    setResistance(0.01),
    setCurrentError(false),
    setPowerError(false),
    setResistanceError(false),
    minCurrent(0),
    maxCurrent(10),
    minPower(0),
    maxPower(100),
    minResistance(0),
    maxResistance(1000)
{

}

bool StandardPageController::validatePower(QString in)
{
    //qDebug() << "validating string: " << in;
    bool tmp;
    double ftmp;
    tmp = !parse(in,"W",ftmp);

   // if(tmp!=setCurrentError)
    //{
        setPowerError=tmp;
        emit setPowerErrorChanged();
    //}

    // qDebug() << "res" << tmp;
    return tmp;
}

bool StandardPageController::validateResistance(QString in)
{
    bool tmp;
    double ftmp;
    tmp = !parse(in,"R",ftmp);

   // if(tmp!=setResistanceError)
   // {
        setResistanceError=tmp;
        emit setResistanceErrorChanged();
    //}
    return tmp;
}

bool StandardPageController::validateCurrent(QString in)
{
    bool tmp;
    double ftmp;
    tmp = !parse(in,"A",ftmp);

   // if(tmp!=setCurrentError)
   // {
        setCurrentError=tmp;
        emit setCurrentErrorChanged();
   // }
    return tmp;
}

QString StandardPageController::getLatestVoltage()
{
    char tmp[10];
    sprintf(tmp,"%03.02fV",latestVoltage);
    return tmp;
}

QString StandardPageController::getLatestCurrent()
{
    char tmp[10];
    if(latestCurrent<1)
        sprintf(tmp,"%3.0fmA",latestCurrent*1000);
    else
        sprintf(tmp,"%2.03fA",latestCurrent);
    return tmp;
}

QString StandardPageController::getLatestPower()
{
    char tmp[10];
    sprintf(tmp,"%3.0fW",latestPower);
    return tmp;
}

QString StandardPageController::getLatestResistance()
{
    char tmp[10];
    sprintf(tmp,"%3.03fR",latestResistance);
    return tmp;
}

QString StandardPageController::getSetCurrent()
{
    char tmp[10];
    if(setCurrent<1)
        sprintf(tmp,"%.0fmA",setCurrent*1000);
    else
        sprintf(tmp,"%.03fA",setCurrent);
    return tmp;
}

QString StandardPageController::getSetPower()
{
    char tmp[10];
    sprintf(tmp,"%.0fW",setPower);
    return tmp;
}

QString StandardPageController::getSetResistance()
{
    char tmp[10];
    sprintf(tmp,"%.03fR",setResistance);
    return tmp;
}

void StandardPageController::setSetCurrent(QString current)
{
   // qDebug() << "set current via string: " << current;
    bool error = !parse(current,"A",setCurrent);

    if(error != setCurrentError)
    {
        setCurrentError=error;
        emit setCurrentErrorChanged();
    }

    emit setCurrentPercentChanged();

}

void StandardPageController::setSetPower(QString power)
{
   // qDebug() << "set power via string: " << power;
    bool error = !parse(power,"W",setPower);


    if(error != setPowerError)
    {
        setPowerError=error;
        emit setPowerErrorChanged();
    }
    emit setPowerPercentChanged();
}

void StandardPageController::setSetResistance(QString resistance)
{
  //  qDebug() << "set resistance via string: " << resistance;
    bool error = !parse(resistance,"R",setResistance);



    if(error != setResistanceError)
    {
        setResistanceError=error;
        emit setResistanceErrorChanged();
    }
    emit setResistancePercentChanged();
}

bool StandardPageController::getSetCurrentError()
{
    return setCurrentError;

}

bool StandardPageController::getSetPowerError()
{
    return setPowerError;

}

bool StandardPageController::getSetResistanceError()
{
    return setResistanceError;
}

int StandardPageController::getSetCurrentPercent()
{
    return setCurrent/(maxCurrent-minCurrent)*100.0;
}

int StandardPageController::getSetPowerPercent()
{
    return setPower/(maxPower-minPower)*100.0;
}

int StandardPageController::getResistancePercent()
{
    return setResistance/(maxResistance-minResistance)*100.0;
}

void StandardPageController::setSetCurrentPercent(int current)
{
   // qDebug() << "Set current percent:" << current;
    setCurrent = (maxCurrent-minCurrent)*(current/100.0);
    emit setCurrentChanged();
}

void StandardPageController::setSetPowerPercent(int power)
{
    setPower = (maxPower-minPower)*(power/100.0);
    emit setPowerChanged();
}

void StandardPageController::setSetResistancePercent(int resistance)
{
    setResistance = (maxResistance-minResistance)*(resistance/100.0);
    emit setResistanceChanged();
}

bool StandardPageController::parse(QString input, QString unit, double &output)
{
 //   qDebug() << "Parsing \""<<input<<"\"";
    bool ok=false;
    double tmp;
    double factor=1;

    input.replace(unit," ",Qt::CaseSensitive);
    input.replace(",",".",Qt::CaseInsensitive);



    if(input.indexOf("u",0,Qt::CaseSensitive)>0) factor = 0.000001;
    if(input.indexOf("m",0,Qt::CaseSensitive)>0) factor = 0.001;
    if(input.indexOf("k",0,Qt::CaseSensitive)>0) factor = 1000;

    input.replace("u"," ",Qt::CaseSensitive);
    input.replace("m"," ",Qt::CaseSensitive);
    input.replace("k"," ",Qt::CaseSensitive);

    tmp = input.toDouble(&ok);
    if(ok)
    {
        output = tmp*factor;
       // qDebug() << "got" << output;
        return true;
    }


}
