#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include <QObject>
#include <memory>
#include "connectionsetup.h"
#include "connectionauthorization.h"
#include "telemetrysetup.h"

class DataManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QUrl currentEndpoint READ getCurrentEndpoint WRITE setCurrentEndpoint NOTIFY currentEndpointChanged)

    Q_PROPERTY(double lat READ getLat NOTIFY telemetryDataChanged)
    Q_PROPERTY(double lon READ getLon NOTIFY telemetryDataChanged)
    Q_PROPERTY(double latRaw READ getLatRaw NOTIFY telemetryDataChanged)
    Q_PROPERTY(double lonRaw READ getLonRaw NOTIFY telemetryDataChanged)

    Q_PROPERTY(double alt READ getAlt NOTIFY telemetryDataChanged)
    Q_PROPERTY(double relativeAlt READ getRelativeAlt NOTIFY telemetryDataChanged)
    Q_PROPERTY(double vx READ getVx NOTIFY telemetryDataChanged)
    Q_PROPERTY(double vy READ getVy NOTIFY telemetryDataChanged)

    Q_PROPERTY(double vz READ getVz NOTIFY telemetryDataChanged)
    Q_PROPERTY(double hdg READ getHdg NOTIFY telemetryDataChanged)
    Q_PROPERTY(double row READ getRow NOTIFY telemetryDataChanged)
    Q_PROPERTY(double pitch READ getPitch NOTIFY telemetryDataChanged)

    Q_PROPERTY(double yaw READ getYaw NOTIFY telemetryDataChanged)
    Q_PROPERTY(double rollSpeed READ getRollSpeed NOTIFY telemetryDataChanged)
    Q_PROPERTY(double pitchSpeed READ getPitchSpeed NOTIFY telemetryDataChanged)
    Q_PROPERTY(double yawSpeed READ getYawSpeed NOTIFY telemetryDataChanged)
public:
    explicit DataManager(QObject *parent = nullptr);

    Q_INVOKABLE void getDataAction();

    void setCurrentEndpoint(const QUrl& address);
    QUrl getCurrentEndpoint() const;

    void setTelemetryData(const TelemetryData& data);
public:
    // telemetry getters
    double getLat() const;
    double getLon() const;
    double getLatRaw() const;
    double getLonRaw() const;

    double getAlt() const;
    double getRelativeAlt() const;
    double getVx() const;
    double getVy() const;

    double getVz() const;
    double getHdg() const;
    double getRow() const;
    double getPitch() const;

    double getYaw() const;
    double getRollSpeed() const;
    double getPitchSpeed() const;
    double getYawSpeed() const;
signals:
    void currentEndpointChanged();
    void telemetryDataChanged();
public slots:
    void telemetryDataState(bool state);
private:
    std::unique_ptr<ConnectionInterface>     connectionStatus;
    std::unique_ptr<TelemetrySetupInterface> telemetryInterface;
    Authorization twoWaysAuthorize;

};

#endif // DATAMANAGER_H