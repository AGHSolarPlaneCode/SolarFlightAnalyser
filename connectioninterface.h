#ifndef CONNECTIONINTERFACE_H
#define CONNECTIONINTERFACE_H
#include <QUrl>
#include <QPair>

class ConnectionInterface{
public:    
    virtual void setURLAddress(const QUrl& newUrl) = 0;
    virtual void setConnectionStatus(bool status) = 0;
    virtual QUrl getURLAddress() const = 0;
    virtual QPair<bool, QString> connectionAvailable(const QUrl& qurl) = 0;  // check autorization with static ClientManager class
    virtual bool isRunningConnection() = 0;
    virtual ~ConnectionInterface() = default;

};

#endif // CONNECTIONINTERFACE_H