#ifndef SENDER_H
#define SENDER_H

#include <QObject>

class Sender : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString contents READ getContents WRITE setContents NOTIFY contentsChanged)
public:
    explicit Sender(QObject *parent = nullptr);

    QString getContents() const;
    void setContents(const QString &contents);
    Q_INVOKABLE void sendRequest(QString url);

private:
    QString contents;

signals:
    void contentsChanged();

public slots:
    void replyFinished();
};

#endif // SENDER_H
