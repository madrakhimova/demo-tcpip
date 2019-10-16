#include "sender.h"

#include <QNetworkReply>

Sender::Sender(QObject *parent) : QObject(parent) {}

QString Sender::getContents() const
{
    return contents;
}

void Sender::setContents(const QString &contents)
{
    this->contents = contents;
}

void Sender::sendRequest(QString url)
{
    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    QNetworkRequest request;
    request.setUrl(QUrl(url));
    QNetworkReply *reply = manager->get(request);
    connect(reply, SIGNAL(finished()), this, SLOT(replyFinished()));
}

void Sender::replyFinished()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());
    if (reply->error() == QNetworkReply::NoError)
    {
        contents = reply->readAll();
        qDebug() << contents;
        contentsChanged();
    }
}
