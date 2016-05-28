.class public Lorg/apache/http/impl/conn/IdleConnectionHandler;
.super Ljava/lang/Object;
.source "IdleConnectionHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final connectionToTimes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/HttpConnection;",
            "Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;",
            ">;"
        }
    .end annotation
.end field

.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->connectionToTimes:Ljava/util/Map;

    .line 63
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/http/HttpConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 13
    .param p1, "connection"    # Lorg/apache/http/HttpConnection;
    .param p2, "validDuration"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 75
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 77
    .local v2, "timeAdded":J
    iget-object v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 78
    iget-object v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Adding connection at: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 81
    :cond_24
    iget-object v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->connectionToTimes:Ljava/util/Map;

    new-instance v1, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;

    move-wide v4, p2

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;-><init>(JJLjava/util/concurrent/TimeUnit;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    return-void
.end method

.method public closeExpiredConnections()V
    .registers 13

    .prologue
    .line 142
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 143
    .local v4, "now":J
    iget-object v7, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_24

    .line 144
    iget-object v7, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Checking for expired connections, now: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 147
    :cond_24
    iget-object v7, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->connectionToTimes:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_2e
    :goto_2e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 148
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/apache/http/HttpConnection;Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpConnection;

    .line 149
    .local v0, "conn":Lorg/apache/http/HttpConnection;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;

    .line 150
    .local v6, "times":Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;
    # getter for: Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeExpires:J
    invoke-static {v6}, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->access$000(Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;)J

    move-result-wide v8

    cmp-long v7, v8, v4

    if-gtz v7, :cond_2e

    .line 151
    iget-object v7, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_72

    .line 152
    iget-object v7, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Closing connection, expired @: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    # getter for: Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeExpires:J
    invoke-static {v6}, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->access$000(Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;)J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 155
    :cond_72
    :try_start_72
    invoke-interface {v0}, Lorg/apache/http/HttpConnection;->close()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_75} :catch_76

    goto :goto_2e

    .line 156
    :catch_76
    move-exception v2

    .line 157
    .local v2, "ex":Ljava/io/IOException;
    iget-object v7, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    const-string v8, "I/O error closing connection"

    invoke-interface {v7, v8, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_2e

    .line 161
    .end local v0    # "conn":Lorg/apache/http/HttpConnection;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/apache/http/HttpConnection;Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;>;"
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v6    # "times":Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;
    :cond_7f
    return-void
.end method

.method public closeIdleConnections(J)V
    .registers 16
    .param p1, "idleTime"    # J

    .prologue
    .line 117
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long v6, v10, p1

    .line 119
    .local v6, "idleTimeout":J
    iget-object v9, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v9}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v9

    if-eqz v9, :cond_26

    .line 120
    iget-object v9, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Checking for connections, idle timeout: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 123
    :cond_26
    iget-object v9, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->connectionToTimes:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_30
    :goto_30
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 124
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/apache/http/HttpConnection;Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpConnection;

    .line 125
    .local v0, "conn":Lorg/apache/http/HttpConnection;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;

    .line 126
    .local v8, "times":Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;
    # getter for: Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeAdded:J
    invoke-static {v8}, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->access$100(Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;)J

    move-result-wide v2

    .line 127
    .local v2, "connectionTime":J
    cmp-long v9, v2, v6

    if-gtz v9, :cond_30

    .line 128
    iget-object v9, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v9}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v9

    if-eqz v9, :cond_70

    .line 129
    iget-object v9, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Closing idle connection, connection time: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 132
    :cond_70
    :try_start_70
    invoke-interface {v0}, Lorg/apache/http/HttpConnection;->close()V
    :try_end_73
    .catch Ljava/io/IOException; {:try_start_70 .. :try_end_73} :catch_74

    goto :goto_30

    .line 133
    :catch_74
    move-exception v4

    .line 134
    .local v4, "ex":Ljava/io/IOException;
    iget-object v9, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    const-string v10, "I/O error closing connection"

    invoke-interface {v9, v10, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_30

    .line 138
    .end local v0    # "conn":Lorg/apache/http/HttpConnection;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/apache/http/HttpConnection;Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;>;"
    .end local v2    # "connectionTime":J
    .end local v4    # "ex":Ljava/io/IOException;
    .end local v8    # "times":Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;
    :cond_7d
    return-void
.end method

.method public remove(Lorg/apache/http/HttpConnection;)Z
    .registers 8
    .param p1, "connection"    # Lorg/apache/http/HttpConnection;

    .prologue
    const/4 v1, 0x1

    .line 93
    iget-object v2, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->connectionToTimes:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;

    .line 94
    .local v0, "times":Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;
    if-nez v0, :cond_13

    .line 95
    iget-object v2, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->log:Lorg/apache/commons/logging/Log;

    const-string v3, "Removing a connection that never existed!"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 98
    :cond_12
    :goto_12
    return v1

    :cond_13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    # getter for: Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeExpires:J
    invoke-static {v0}, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->access$000(Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_12

    const/4 v1, 0x0

    goto :goto_12
.end method

.method public removeAll()V
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler;->connectionToTimes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 107
    return-void
.end method
