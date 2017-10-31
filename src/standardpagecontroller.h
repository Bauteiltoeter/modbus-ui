#ifndef STANDARDPAGECONTROLLER_H
#define STANDARDPAGECONTROLLER_H

#include <QObject>
#include <QString>

class StandardPageController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString latestVoltage READ getLatestVoltage NOTIFY latestVoltageChanged)
    Q_PROPERTY(QString latestCurrent READ getLatestCurrent NOTIFY latestCurrentChanged)
    Q_PROPERTY(QString latestPower READ getLatestPower NOTIFY latestPowerChanged)
    Q_PROPERTY(QString latestResistance READ getLatestResistance NOTIFY latestResistanceChanged)
    Q_PROPERTY(QString setCurrent READ getSetCurrent WRITE setSetCurrent NOTIFY setCurrentChanged)
    Q_PROPERTY(QString setPower READ getSetPower WRITE setSetPower NOTIFY setPowerChanged)
    Q_PROPERTY(QString setResistance READ getSetResistance WRITE setSetResistance NOTIFY setResistanceChanged)
    Q_PROPERTY(bool setCurrentError READ getSetCurrentError NOTIFY setCurrentErrorChanged)
    Q_PROPERTY(bool setPowerError READ getSetPowerError NOTIFY setPowerErrorChanged)
    Q_PROPERTY(bool setResistanceError READ getSetResistanceError NOTIFY setResistanceErrorChanged)
    Q_PROPERTY(int setCurrentPercent READ getSetCurrentPercent WRITE setSetCurrentPercent NOTIFY setCurrentPercentChanged)
    Q_PROPERTY(int setPowerPercent READ getSetPowerPercent WRITE setSetPowerPercent NOTIFY setPowerPercentChanged)
    Q_PROPERTY(int setResistancePercent READ getResistancePercent WRITE setSetResistancePercent NOTIFY setResistancePercentChanged)
public:
    explicit StandardPageController(QObject *parent = 0);
    Q_INVOKABLE bool validateCurrent(QString in);
    Q_INVOKABLE bool validatePower(QString in);
    Q_INVOKABLE bool validateResistance(QString in);

    QString getLatestVoltage();
    QString getLatestCurrent();
    QString getLatestPower();
    QString getLatestResistance();

    QString getSetCurrent();
    QString getSetPower();
    QString getSetResistance();

    void setSetCurrent(QString current);
    void setSetPower(QString power);
    void setSetResistance(QString resistance);

    bool getSetCurrentError();
    bool getSetPowerError();
    bool getSetResistanceError();

    int getSetCurrentPercent();
    int getSetPowerPercent();
    int getResistancePercent();

    void setSetCurrentPercent(int current);
    void setSetPowerPercent(int power);
    void setSetResistancePercent(int resistance);

signals:
    void latestVoltageChanged();
    void latestCurrentChanged();
    void latestPowerChanged();
    void latestResistanceChanged();
    void setCurrentChanged();
    void setPowerChanged();
    void setResistanceChanged();
    void setCurrentErrorChanged();
    void setPowerErrorChanged();
    void setResistanceErrorChanged();

    void setCurrentPercentChanged();
    void setPowerPercentChanged();
    void setResistancePercentChanged();

public slots:

private:
    bool parse(QString input, QString unit, double& output);

    double latestVoltage;
    double latestCurrent;
    double latestPower;
    double latestResistance;

    double setCurrent;
    double setPower;
    double setResistance;

    bool setCurrentError;
    bool setPowerError;
    bool setResistanceError;

    double minCurrent;
    double maxCurrent;
    double minPower;
    double maxPower;
    double minResistance;
    double maxResistance;
};

#endif // STANDARDPAGECONTROLLER_H
